CLASS zcl_cs02_daten_import_job DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF zt_import_split,
        company  TYPE string,
        street   TYPE string,
        postcode TYPE string,
        city     TYPE string,
        means    TYPE string,
        val1     TYPE string,
        val2     TYPE string,
      END OF zt_import_split.

    DATA:
        badi_handler TYPE REF TO zcs02_statistics_badi.

    INTERFACES:
      if_apj_dt_exec_object,
      if_apj_rt_exec_object.
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES:
      BEGIN OF ts_error_dataset,
        raw        TYPE zt_import_split,
        customer   TYPE zcs02_customers,
        error      TYPE REF TO zcx_cs02_import_error,
        customerid TYPE zcustomerid02,
      END OF ts_error_dataset.
ENDCLASS.



CLASS zcl_cs02_daten_import_job IMPLEMENTATION.

  METHOD if_apj_dt_exec_object~get_parameters.
*    et_parameter_def = value #(  ).
  ENDMETHOD.

  METHOD if_apj_rt_exec_object~execute.

*    CSV Daten aus der Tabelle ztl_00_casestudy in die ztl_02_casestudy übertragen
*        DATA: lt_data TYPE TABLE OF ztl_00_casestudy.
*        SELECT * FROM ztl_00_casestudy INTO TABLE @lt_data.
*        INSERT ztl_02_casestudy FROM TABLE @lt_data.

*    Get Data for default values
    DATA gv_language TYPE spras.
    SELECT SINGLE FROM zcs02_custtab
      FIELDS default_value
      WHERE name = 'LANGUAGE'
      AND active = 'X'
      INTO @gv_language.
    DATA gv_country TYPE land.
    SELECT SINGLE FROM zcs02_custtab
      FIELDS default_value
      WHERE name = 'COUNTRY'
      AND active = 'X'
      INTO @gv_country.

*    Get Badi Handler
    TRY.
        GET BADI badi_handler.
      CATCH cx_badi INTO DATA(badi_ex).
*        out->write( badi_ex->get_text( ) ).
    ENDTRY.

    DATA gs_error TYPE ts_error_dataset.
    DATA gt_errors TYPE TABLE OF ts_error_dataset.

*    Get all CSV Data
    SELECT *
    FROM ztl_02_casestudy
    INTO TABLE @DATA(gt_import).

    DATA gt_import_split TYPE TABLE OF lcl_util=>ts_import_split.
    DATA gs_import_split TYPE lcl_util=>ts_import_split.

*    Split raw CSV data into string fields and trim quotation marks
    LOOP AT gt_import INTO DATA(gs_import).
      gs_import_split = lcl_util=>split_and_trim( gs_import ).
      APPEND gs_import_split TO gt_import_split.
    ENDLOOP.

*    Use sorted table to eliminate duplicates
    DATA gt_zcustomers TYPE SORTED TABLE OF zcs02_customers
        WITH UNIQUE KEY last_name first_name company street postcode city.
    DATA gs_zcustomers TYPE zcs02_customers.

*    Insert into sorted table (if no duplicate)
    DATA go_length_ex TYPE REF TO zcx_cs02_import_error.
    LOOP AT gt_import_split INTO gs_import_split.
      gs_zcustomers = lcl_util=>check_and_convert(
        EXPORTING
          iv_line_string = gs_import_split
        IMPORTING
            eo_exception = go_length_ex
        ).
      INSERT gs_zcustomers INTO TABLE gt_zcustomers.
      IF NOT go_length_ex IS INITIAL.
*        out->write( go_length_ex->get_text( ) ).    " TODO: Protocol
        gs_error-raw = gs_import_split.
        gs_error-customer = gs_zcustomers.
        gs_error-error = go_length_ex.
        APPEND gs_error TO gt_errors.
        CLEAR gs_error.
        CLEAR go_length_ex.
      ENDIF.
    ENDLOOP.

*    Map communication means to customers
    CLEAR go_length_ex.
    DATA go_email_ex TYPE REF TO zcx_cs02_import_error.
    LOOP AT gt_import_split INTO gs_import_split.

      DATA gs_zcustomer_temp TYPE zcs02_customers.
      gs_zcustomer_temp-company = gs_import_split-company.
      gs_zcustomer_temp-street = gs_import_split-street.
      gs_zcustomer_temp-postcode = gs_import_split-postcode.
      gs_zcustomer_temp-city = gs_import_split-city.

      LOOP AT gt_zcustomers INTO gs_zcustomers
          WHERE company = gs_zcustomer_temp-company AND
              street = gs_zcustomer_temp-street AND
              postcode = gs_zcustomer_temp-postcode AND
              city = gs_zcustomer_temp-city.

        gs_zcustomers = CORRESPONDING #( lcl_util=>map_comm_means(
            EXPORTING
                is_import_split = gs_import_split
                is_zcustomers = gs_zcustomers
            IMPORTING
                ex_length = go_length_ex
                ex_email = go_email_ex
        ) ).

        MODIFY gt_zcustomers FROM gs_zcustomers.

        IF NOT go_email_ex IS INITIAL.
*          out->write( go_email_ex->get_text(  ) ).
          gs_error-raw = gs_import_split.
          gs_error-customer = gs_zcustomers.
          gs_error-error = go_email_ex.
          APPEND gs_error TO gt_errors.
          CLEAR gs_error.
          CLEAR go_email_ex.
        ENDIF.
        IF NOT go_length_ex IS INITIAL.
*          out->write( go_length_ex->get_text(  ) ).
          gs_error-raw = gs_import_split.
          gs_error-customer = gs_zcustomers.
          gs_error-error = go_length_ex.
          APPEND gs_error TO gt_errors.
          CLEAR gs_error.
          CLEAR go_length_ex.
        ENDIF.

      ENDLOOP.
    ENDLOOP.

*    out->write( gt_zcustomers ).
*    out->write( lines( gt_zcustomers ) ).

*    Insert into DB table and draw id
    DATA gt_existing_customers TYPE SORTED TABLE OF zcs02_customers
        WITH UNIQUE KEY last_name first_name company street postcode city.
    SELECT
        FROM zcs02_customers
        FIELDS *
        INTO TABLE @gt_existing_customers.

    TRY.
        DATA(go_number_drawer) = lcl_customer_number_drawer=>get_instance( ).
        DATA gv_current_number TYPE zcs02_customers-customerid.
        DATA number_changed_or_created TYPE i.
        LOOP AT gt_zcustomers INTO gs_zcustomers.
          READ TABLE gt_existing_customers INTO DATA(gs_existing_customer) WITH KEY
            last_name = gs_zcustomers-last_name
            first_name = gs_zcustomers-first_name
            company = gs_zcustomers-company
            street = gs_zcustomers-street
            postcode = gs_zcustomers-postcode
            city = gs_zcustomers-city.
          IF sy-subrc = 0.
            gs_existing_customer-phone = gs_zcustomers-phone.
            gs_existing_customer-fax = gs_zcustomers-fax.
            gs_existing_customer-email = gs_zcustomers-email.
            gs_existing_customer-memo = gs_zcustomers-memo.
            UPDATE zcs02_customers FROM @gs_existing_customer.
            IF sy-subrc <> 0.
*              out->write( |Unable to update line:| ).
*              out->write( gs_existing_customer ).
            ELSE.
              number_changed_or_created += 1.
            ENDIF.
          ELSE.
            gv_current_number = go_number_drawer->draw_number( ).
            gs_zcustomers-customerid = gv_current_number.
            gs_zcustomers-country = gv_country.
            gs_zcustomers-language = gv_language.
            INSERT INTO zcs02_customers VALUES @gs_zcustomers.
            IF sy-subrc <> 0.
*              out->write( |Unable to insert line:| ).
*              out->write( gs_existing_customer ).
            ELSE.
              number_changed_or_created += 1.
            ENDIF.
          ENDIF.
        ENDLOOP.
        CALL BADI badi_handler->counter
          EXPORTING
            iv_count = number_changed_or_created.
      CATCH cx_root INTO DATA(ex_r).
*        out->write( ex_r->get_text( ) ).
    ENDTRY.

*   Fehlerdatensätze protokollieren und BADI Import Data aufrufen
    SELECT
        FROM zcs02_customers
        FIELDS *
        INTO TABLE @gt_existing_customers.
    LOOP AT gt_errors INTO gs_error.
      READ TABLE gt_existing_customers INTO gs_existing_customer WITH KEY
          last_name = gs_error-customer-last_name
          first_name = gs_error-customer-first_name
          company = gs_error-customer-company
          street = gs_error-customer-street
          postcode = gs_error-customer-postcode
          city = gs_error-customer-city.
      gs_error-customerid = gs_existing_customer-customerid.
      TRY.
          CLEAR gs_existing_customer.
          CALL BADI badi_handler->import_data
            EXPORTING
              is_raw        = gs_error-raw
              is_customer   = gs_error-customer
              io_error      = gs_error-error
              iv_customerid = gs_error-customerid
            CHANGING
              cs_result     = gs_existing_customer.
          UPDATE zcs02_customers FROM @gs_existing_customer.
          IF sy-subrc <> 0.
*            out->write( |Unable to update line:| ).
*            out->write( gs_existing_customer ).
          ENDIF.
*          Append error protocol
          DATA gs_protocol TYPE zcs02_protocol.
          gs_protocol-id = cl_system_uuid=>create_uuid_x16_static( ).
          gs_protocol-category = cl_abap_classdescr=>get_class_name( gs_error-error ).
          gs_protocol-text = gs_error-error->get_text( ).
          GET TIME STAMP FIELD gs_protocol-created_at.
          INSERT INTO zcs02_protocol VALUES @gs_protocol.
        CATCH cx_root INTO DATA(ex).
*          out->write( ex->get_text( ) ).
      ENDTRY.
    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
