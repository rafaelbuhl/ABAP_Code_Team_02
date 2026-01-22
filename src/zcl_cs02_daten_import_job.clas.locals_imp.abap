*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

"! This class contains (static) methods to convert data.
CLASS lcl_util DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ts_import_split,
        company  TYPE string,
        street   TYPE string,
        postcode TYPE string,
        city     TYPE string,
        means    TYPE string,
        val1     TYPE string,
        val2     TYPE string,
      END OF ts_import_split.
    CLASS-METHODS:
      "! Splits the CSV data into multiple string fields and removes all excess quotation marks.
      "! @parameter iv_line_raw | Line of CSV data as string
      "! @parameter r_line | Cleaned data in string structure
      split_and_trim
        IMPORTING
          iv_line_raw   TYPE ztl_02_casestudy
        RETURNING
          VALUE(r_line) TYPE ts_import_split,

      "! Checks, if the fields of the imported string structure are too long
      "! @parameter iv_line_string | structure to be checked and converted
      "! @parameter eo_exception | Exception for too long values
      "! @parameter r_line_converted | data converted into line of DB table
      check_and_convert
        IMPORTING
          iv_line_string          TYPE ts_import_split
        EXPORTING
          eo_exception            TYPE REF TO zcx_cs02_import_error
        RETURNING
          VALUE(r_line_converted) TYPE zcs02_customers,

      map_comm_means
        IMPORTING
          is_import_split      TYPE ts_import_split
          is_zcustomers        TYPE zcs02_customers
        EXPORTING
          ex_length            TYPE REF TO zcx_cs02_import_error
          ex_email             TYPE REF TO zcx_cs02_import_error
        RETURNING
          VALUE(rs_zcustomers) TYPE zcs02_customers.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_util IMPLEMENTATION.

  METHOD split_and_trim.
    DATA raw_text TYPE string.
    raw_text = iv_line_raw-import.      " necessary, because import parameters must not be altered
    REPLACE ALL OCCURRENCES OF '"' IN raw_text WITH ''.
    SPLIT raw_text AT ';'
    INTO
        r_line-company
        r_line-street
        r_line-postcode
        r_line-city
        r_line-means
        r_line-val1
        r_line-val2.
  ENDMETHOD.


  METHOD check_and_convert.

    r_line_converted-company = iv_line_string-company.
    r_line_converted-street = iv_line_string-street.
    r_line_converted-postcode = iv_line_string-postcode.
    r_line_converted-city = iv_line_string-city.
    DATA exc_field_name TYPE string.
    DATA exc_field_value TYPE string.
    IF strlen( iv_line_string-company ) > 60.
      exc_field_name = 'COMPANY'.
      exc_field_value = iv_line_string-company.
    ELSEIF strlen( iv_line_string-street ) > 50.
      exc_field_name = 'STREET'.
      exc_field_value = iv_line_string-street.
    ELSEIF strlen( iv_line_string-postcode ) > 8.
      exc_field_name = 'POSTCODE'.
      exc_field_value = iv_line_string-postcode.
    ELSEIF strlen( iv_line_string-city ) > 30.
      exc_field_name = 'CITY'.
      exc_field_value = iv_line_string-city.
    ENDIF.
    IF NOT exc_field_name IS INITIAL OR NOT exc_field_value IS INITIAL.
      eo_exception = NEW zcx_cs02_import_error(
        textid         = zcx_cs02_import_error=>value_too_long
        iv_field_name = exc_field_name
        iv_field_value = exc_field_value
      ).
    ENDIF.

  ENDMETHOD.

  METHOD map_comm_means.

    rs_zcustomers = CORRESPONDING #( is_zcustomers ).
    DATA exc_field_name TYPE string.
    DATA exc_field_value TYPE string.

    CASE is_import_split-means.
      WHEN ''.
        CONCATENATE is_import_split-val1 is_import_split-val2 INTO DATA(lv_phone) SEPARATED BY ' '.
        IF NOT strlen( is_import_split-val2 ) > 0.
          exc_field_value = lv_phone.
        ENDIF.
        IF strlen( lv_phone ) > 15.
          exc_field_name = 'PHONE'.
          exc_field_value = lv_phone.
        ENDIF.
        IF NOT is_zcustomers-phone IS INITIAL OR exc_field_value IS NOT INITIAL.
          CONCATENATE 'Phone' lv_phone INTO lv_phone SEPARATED BY ': '.
          IF NOT is_zcustomers-memo IS INITIAL.
            CONCATENATE is_zcustomers-memo lv_phone INTO rs_zcustomers-memo SEPARATED BY '; '.
          ELSE.
            rs_zcustomers-memo = lv_phone.
          ENDIF.
        ELSE.
          rs_zcustomers-phone = lv_phone.
        ENDIF.
      WHEN 'Email'.
        DATA(lv_email) = is_import_split-val1.
        IF strlen( lv_email ) > 60.
          exc_field_name = 'EMAIL'.
          exc_field_value = lv_email.
        ENDIF.
        IF NOT is_zcustomers-email IS INITIAL OR NOT zcl_cs02_service_class=>is_valid_email( lv_email ).
          IF NOT zcl_cs02_service_class=>is_valid_email( lv_email ).
            ex_email = NEW zcx_cs02_import_error(
              textid         = zcx_cs02_import_error=>email_not_valid
*              previous       =
*              iv_field_name  =
              iv_field_value = lv_email
            ).
          ENDIF.
          CONCATENATE 'Email' lv_email INTO lv_email SEPARATED BY ': '.
          IF NOT is_zcustomers-memo IS INITIAL.
            CONCATENATE is_zcustomers-memo lv_email INTO rs_zcustomers-memo SEPARATED BY '; '.
          ELSE.
            rs_zcustomers-memo = lv_email.
          ENDIF.
        ELSE.
          rs_zcustomers-email = lv_email.
        ENDIF.
      WHEN 'Telefax'.
        CONCATENATE is_import_split-val1 is_import_split-val2 INTO DATA(lv_fax) SEPARATED BY ' '.
        IF strlen( lv_fax ) > 15.
          exc_field_name = 'FAX'.
          exc_field_value = lv_fax.
        ENDIF.
        IF NOT is_zcustomers-fax IS INITIAL.
          CONCATENATE 'Telefax' lv_fax INTO lv_fax SEPARATED BY ': '.
          IF NOT is_zcustomers-memo IS INITIAL.
            CONCATENATE is_zcustomers-memo lv_fax INTO rs_zcustomers-memo SEPARATED BY '; '.
          ELSE.
            rs_zcustomers-memo = lv_fax.
          ENDIF.
        ELSE.
          rs_zcustomers-fax = lv_fax.
        ENDIF.
      WHEN OTHERS.
        CONCATENATE is_import_split-means is_import_split-val1 INTO DATA(lv_mem) SEPARATED BY ': '.
        CONCATENATE lv_mem is_import_split-val2 INTO lv_mem SEPARATED BY ' '.
        IF NOT is_zcustomers-memo IS INITIAL.
          CONCATENATE is_zcustomers-memo lv_mem INTO rs_zcustomers-memo SEPARATED BY '; '.
        ELSE.
          rs_zcustomers-memo = lv_mem.
        ENDIF.
    ENDCASE.

    IF exc_field_value IS NOT INITIAL.
      IF exc_field_name IS NOT INITIAL.
        ex_length = NEW zcx_cs02_import_error(
          textid         = zcx_cs02_import_error=>value_too_long
*          previous       =
          iv_field_name  = exc_field_name
          iv_field_value = exc_field_value
        ).
      ELSE.
        ex_length = NEW zcx_cs02_import_error(
          textid         = zcx_cs02_import_error=>phone_not_valid
*        previous       =
*        iv_field_name  =
          iv_field_value = exc_field_value
        ).
      ENDIF.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

"! This class is implemented as a Singleton Pattern and provides a method for drawing IDs of type {@link ZCUSTOMERID02}
CLASS lcl_customer_number_drawer DEFINITION CREATE PRIVATE.
  PUBLIC SECTION.
    CLASS-METHODS:
      "! Returns the singleton instance
      "! @parameter ro_instance | object of class
      "! @raising cx_nr_object_not_found | Raised during creation of number range interval
      "! @raising cx_number_ranges | Raised during creation of number range interval
      get_instance
        RETURNING
          VALUE(ro_instance) TYPE REF TO lcl_customer_number_drawer
        RAISING
          cx_nr_object_not_found cx_number_ranges.
    METHODS:
      "! Draw next ID for {@link ZCUSTOMERID02}
      "! @parameter rv_number | New ID
      "! @raising cx_nr_object_not_found | Raised during number retrieval
      "! @raising cx_number_ranges | Raised during number retrieval
      "! @raising cx_root | In case of unexpected errors
      draw_number
        RETURNING
          VALUE(rv_number) TYPE zcs02_customers-customerid
        RAISING
          cx_nr_object_not_found
          cx_number_ranges
          cx_root.

  PROTECTED SECTION.

  PRIVATE SECTION.
    CONSTANTS:
      lc_nrobject  TYPE cl_numberrange_objects=>nr_attribute-object VALUE 'ZCSTIDNUM2',
      lc_nr_number TYPE cl_numberrange_intervals=>nr_nriv_line-nrrangenr VALUE '01',
      lc_nr_from   TYPE cl_numberrange_intervals=>nr_nriv_line-fromnumber VALUE '000001',
      lc_nr_to     TYPE cl_numberrange_intervals=>nr_nriv_line-tonumber VALUE '199999'.
    CLASS-DATA:
        self_instance TYPE REF TO lcl_customer_number_drawer.
    METHODS:
      "! Initializing singleton instance
      "! @raising cx_nr_object_not_found | Raised during creation of number range interval
      "! @raising cx_number_ranges | Raised during creation of number range interval
      initialize
        RAISING
          cx_nr_object_not_found cx_number_ranges.
ENDCLASS.

CLASS lcl_customer_number_drawer IMPLEMENTATION.

  METHOD get_instance.
    IF self_instance IS INITIAL.
      self_instance = NEW lcl_customer_number_drawer( ).
*      Number interval may only be created once!
*      self_instance->initialize( ).
    ENDIF.
    ro_instance = self_instance.
  ENDMETHOD.

  METHOD draw_number.
    cl_numberrange_runtime=>number_get(
            EXPORTING
              nr_range_nr       = lc_nr_number
              object            = lc_nrobject
            IMPORTING
              number            = DATA(lv_number)
          ).
    IF sy-subrc = 0.
      rv_number = lv_number+14(6).
    ELSE.
      RAISE EXCEPTION TYPE cx_number_ranges.
    ENDIF.
  ENDMETHOD.

  METHOD initialize.
    cl_numberrange_intervals=>create(
      EXPORTING
        interval  = VALUE #( (
            nrrangenr = lc_nr_number
            fromnumber = lc_nr_from
            tonumber = lc_nr_to
            procind = 'I'
            ) )
        object    = lc_nrobject
    ).
  ENDMETHOD.


ENDCLASS.
