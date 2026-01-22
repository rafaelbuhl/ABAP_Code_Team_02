CLASS lsc_zr_cs02_customers DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zr_cs02_customers IMPLEMENTATION.

  METHOD adjust_numbers.

    LOOP AT mapped-zrcs02customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
      TRY.
          cl_numberrange_runtime=>number_get(
              EXPORTING
                object            = 'ZCSTIDNUM2'
                nr_range_nr       = '01'
              IMPORTING
                number            = DATA(lv_number)
            ).
          IF sy-subrc = 0.
            <fs_customer>-Customerid = lv_number+14(6).
          ELSE.
            RAISE EXCEPTION TYPE cx_number_ranges.
          ENDIF.
        CATCH cx_root.
      ENDTRY.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.


CLASS lhc_zr_cs02_customers DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrCs02Customers
        RESULT result,
      CheckEmail FOR VALIDATE ON SAVE
        IMPORTING keys FOR ZrCs02Customers~CheckEmail,
      GetCity FOR DETERMINE ON SAVE
        IMPORTING keys FOR ZrCs02Customers~GetCity,
      GetCurrencyTarget FOR DETERMINE ON SAVE
        IMPORTING keys FOR ZrCs02Customers~GetCurrencyTarget,
      GetDefaultValues FOR DETERMINE ON MODIFY
        IMPORTING keys FOR ZrCs02Customers~GetDefaultValues,
      SetLastDate FOR DETERMINE ON MODIFY
        IMPORTING keys FOR ZrCs02Customers~SetLastDate,
      CheckCompany FOR VALIDATE ON SAVE
        IMPORTING keys FOR ZrCs02Customers~CheckCompany,
      CancelOrders FOR MODIFY
        IMPORTING keys FOR ACTION ZrCs02Customers~CancelOrders RESULT result,
      ShowStatistics FOR MODIFY
        IMPORTING keys FOR ACTION ZrCs02Customers~ShowStatistics RESULT result.
ENDCLASS.

CLASS lhc_zr_cs02_customers IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD CheckEmail.

    DATA customers TYPE TABLE FOR READ RESULT zr_cs02_customers.
    DATA lv_email TYPE string.
    DATA reported_record LIKE LINE OF reported-zrcs02customers.
    DATA failed_record LIKE LINE OF failed-zrcs02customers.

    READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
    ENTITY ZrCs02Customers
    FIELDS ( Customerid Email )
    WITH CORRESPONDING #( keys )
    RESULT customers.

    LOOP AT customers INTO DATA(customer).
      lv_email = customer-Email.
      IF NOT lv_email IS INITIAL AND NOT zcl_cs02_service_class=>is_valid_email( lv_email ).
        DATA(message) = me->new_message(
                          id       = 'ZMESSAGE02'
                          number   = '002'
                          severity = ms-error
                          v1       = lv_email
*                          v2       =
*                          v3       =
*                          v4       =
                        ).
        reported_record-%tky = customer-%tky.
        reported_record-%msg = message.
        reported_record-%element-email = if_abap_behv=>mk-on.
        APPEND reported_record TO reported-zrcs02customers.
        failed_record-%tky = customer-%tky.
        APPEND failed_record TO failed-zrcs02customers.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD GetCity.

    DATA customers TYPE TABLE FOR READ RESULT zr_cs02_customers.
    READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
    ENTITY ZrCs02Customers
    FIELDS ( Postcode )
    WITH CORRESPONDING #( keys )
    RESULT customers.

    LOOP AT customers INTO DATA(customer).

      SELECT SINGLE
          FROM zcs02_postcode
          FIELDS city
          WHERE postcode = @customer-Postcode
          INTO @customer-city.

      MODIFY customers FROM customer.
    ENDLOOP.

    DATA customers_upd TYPE TABLE FOR UPDATE zr_cs02_customers.
    customers_upd = CORRESPONDING #( customers ).

    MODIFY ENTITIES OF zr_cs02_customers IN LOCAL MODE
    ENTITY ZrCs02Customers
    UPDATE
    FIELDS ( city )
    WITH customers_upd
    REPORTED DATA(reported_records).

    reported-zrcs02customers = CORRESPONDING #( reported_records-zrcs02customers ).

  ENDMETHOD.

*  METHOD GetCurrencyTarget.
*    DATA: customers_upd TYPE TABLE FOR UPDATE zr_cs02_customers.
*
*    READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
*        ENTITY ZrCs02Customers
*        FIELDS ( Currency CurrencyTarget SalesVolume SalesVolumeTarget ChangeRateDate )
*        WITH CORRESPONDING #( keys )
*        RESULT DATA(customers).
*
*
*
*    LOOP AT customers INTO DATA(customer).
*
*      IF customer-ChangeRateDate IS INITIAL.
*      customer-ChangeRateDate = cl_abap_context_info=>get_system_date(  ).
*      ENDIF.
*
*      SELECT SINGLE
*            Currency, CurrencyTarget, SalesVolume,
*              currency_conversion( amount = @customer-SalesVolume,
*                                   source_currency = @customer-Currency,
*                                   target_currency = @customer-CurrencyTarget,
*                                   exchange_rate_date = @customer-ChangeRateDate,
*                                   on_error = @sql_currency_conversion=>c_on_error-fail ) AS SalesVolumeTarget
*
*          FROM zr_cs02_customers
**          WHERE Customerid = @customer-Customerid
*          INTO  @DATA(customer_result).
*
*      IF sy-subrc = 0.
*
*      customer-SalesVolumeTarget = customer_result-salesvolumetarget.
*
*      MODIFY customers FROM customer INDEX sy-tabix.
*      ENDIF.
*
*      customers_upd = CORRESPONDING #( customers ).
*
*
*      MODIFY ENTITIES OF zr_cs02_customers IN LOCAL MODE
*          ENTITY ZrCs02Customers
*          UPDATE
*          FIELDS ( SalesVolumeTarget CurrencyTarget  )
*          WITH CORRESPONDING #(  customers_upd )
*          REPORTED DATA(reported_records).
*
*      reported-zrcs02customers = CORRESPONDING #( reported_records-zrcs02customers ).
*    ENDLOOP.
*
*  ENDMETHOD.


  METHOD GetCurrencyTarget.
    TRY.

        DATA customers_upd TYPE TABLE FOR UPDATE zr_cs02_customers.
        DATA customers TYPE TABLE FOR READ RESULT zr_cs02_customers.

        READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
            ENTITY ZrCs02Customers
            ALL FIELDS
            WITH CORRESPONDING #( keys )
            RESULT customers.

        LOOP AT customers INTO DATA(customer).

          IF customer-ChangeRateDate IS INITIAL.
            customer-ChangeRateDate = cl_abap_context_info=>get_system_date(  ).
          ENDIF.

          IF customer-Currency IS INITIAL OR customer-Currency = '0'.
            customer-Currency = 'EUR'.
          ENDIF.
          IF customer-CurrencyTarget IS INITIAL OR customer-CurrencyTarget = '0'.
            customer-CurrencyTarget = 'EUR'.
          ENDIF.

          IF customer-SalesVolume = customer-SalesVolumeTarget AND customer-Currency = customer-CurrencyTarget.
*      Do nothing
          ELSE.
            SELECT SINGLE
            'Hallo :)' AS Hello,
                    currency_conversion( amount = @customer-SalesVolume,
                                         source_currency = @customer-Currency,
                                         target_currency = @customer-CurrencyTarget,
                                         exchange_rate_date = @customer-ChangeRateDate,
                                         on_error = @sql_currency_conversion=>c_on_error-fail ) AS SalesVolumeTarget

                FROM zcs02_customers
                INTO  @DATA(customer_result).

            IF sy-subrc = 0 AND NOT customer-SalesVolumeTarget = customer_result-salesvolumetarget.
              customer-SalesVolumeTarget = customer_result-salesvolumetarget.
              APPEND CORRESPONDING #( customer ) TO customers_upd.
            ENDIF.
          ENDIF.
        ENDLOOP.

        MODIFY ENTITIES OF zr_cs02_customers IN LOCAL MODE
            ENTITY ZrCs02Customers
            UPDATE
            FIELDS ( Currency SalesVolumeTarget CurrencyTarget ChangeRateDate )
            WITH customers_upd
            REPORTED DATA(reported_records).

        reported-zrcs02customers = CORRESPONDING #( reported_records-zrcs02customers ).
*    DATA(my_reported) = reported_records-zrcs02customers.

      CATCH cx_root INTO DATA(ex).
        DATA(temp) = ex->get_text( ).
    ENDTRY.

  ENDMETHOD.

  METHOD GetDefaultValues.
    DATA cust_read TYPE TABLE FOR READ RESULT zr_cs02_customers.
    DATA cust_upd TYPE TABLE FOR UPDATE zr_cs02_customers.

    READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
        ENTITY ZrCs02Customers
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT cust_read.

    SELECT SINGLE
    FROM zcs02_custtab
    FIELDS default_value
    WHERE name = 'COUNTRY' AND active = 'X'
    INTO @DATA(lv_country).

    SELECT SINGLE
    FROM zcs02_custtab
    FIELDS default_value
    WHERE name = 'LANGUAGE' AND active = 'X'
    INTO @DATA(lv_language).

    LOOP AT cust_read INTO DATA(row_cust_read).
      row_cust_read-Country = lv_country.
      row_cust_read-Language = lv_language.
      APPEND CORRESPONDING #( row_cust_read ) TO cust_upd.
    ENDLOOP.

    MODIFY ENTITIES OF zr_cs02_customers IN LOCAL MODE
        ENTITY ZrCs02Customers
        UPDATE
        FIELDS ( Country Language )
        WITH cust_upd
        REPORTED DATA(reported_data).

    reported-zrcs02customers = CORRESPONDING #( reported_data-zrcs02customers ).

  ENDMETHOD.

  METHOD SetLastDate.
    DATA cust_read TYPE TABLE FOR READ RESULT zr_cs02_customers.
    DATA cust_upd TYPE TABLE FOR UPDATE zr_cs02_customers.

    READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
        ENTITY ZrCs02Customers
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT cust_read.

    LOOP AT cust_read INTO DATA(row).
      IF row-LastDate IS INITIAL.
        row-LastDate = cl_abap_context_info=>get_system_date( ).
        APPEND CORRESPONDING #( row ) TO cust_upd.
      ENDIF.
    ENDLOOP.

    MODIFY ENTITIES OF zr_cs02_customers IN LOCAL MODE
        ENTITY ZrCs02Customers
        UPDATE
        FIELDS ( LastDate )
        WITH cust_upd
        REPORTED DATA(rep_dat).

    reported-zrcs02customers = CORRESPONDING #( rep_dat-zrcs02customers ).

  ENDMETHOD.

  METHOD CheckCompany.

    DATA customers TYPE TABLE FOR READ RESULT zr_cs02_customers.
    DATA reported_record LIKE LINE OF reported-zrcs02customers.
    DATA failed_record LIKE LINE OF failed-zrcs02customers.

    READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
     ENTITY ZrCs02Customers
     FIELDS ( LastName FirstName Company Street City Postcode )
     WITH CORRESPONDING #( keys )
     RESULT customers.

    LOOP AT customers INTO DATA(customer).

      SELECT SINGLE
        FROM zr_cs02_customers
        FIELDS Customerid, Company
        WHERE LastName  = @customer-LastName
          AND FirstName = @customer-FirstName
          AND Company   = @customer-company
          AND Street    = @customer-Street
          AND City      = @customer-City
          AND Postcode  = @customer-Postcode
        INTO @DATA(customer_result).

      IF sy-subrc = 0.

        DATA(message) = me->new_message(
                              id       = 'ZMESSAGE02'
                              number   = '005'
                              severity = ms-error
*                          v1       =
*                          v2       =
*                          v3       =
*                          v4       =
                            ).
        reported_record-%tky = customer-%tky.
        reported_record-%msg = message.
        reported_record-%element-email = if_abap_behv=>mk-on.
        APPEND reported_record TO reported-zrcs02customers.
        failed_record-%tky = customer-%tky.
        APPEND failed_record TO failed-zrcs02customers.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD CancelOrders.
    TRY.
        LOOP AT keys INTO DATA(key_row).
          SELECT FROM zcs02_custorders
          FIELDS orderid
          WHERE customerid = @key_row-%param-customerid
          INTO TABLE @DATA(lt_orders).

          DATA orders_read TYPE TABLE FOR READ RESULT zr_cs02_custorders.
          READ ENTITIES OF zr_cs02_custorders
          ENTITY ZrCs02Custorders
          ALL FIELDS
          WITH CORRESPONDING #( lt_orders )
          RESULT orders_read.

          DATA(number_upd) = 0.
          DATA orders_upd TYPE TABLE FOR UPDATE zr_cs02_custorders.
          LOOP AT orders_read INTO DATA(ls_order).
            ls_order-Status = 'ST'.
            APPEND CORRESPONDING #( ls_order ) TO orders_upd.
            number_upd += 1.
          ENDLOOP.

          MODIFY ENTITIES OF zr_cs02_custorders
          ENTITY ZrCs02Custorders
          UPDATE
          FIELDS ( Status )
          WITH orders_upd
          REPORTED DATA(reported_data).


          DATA(res_msg) = new_message(
                                   id       = 'ZMESSAGE02'
                                   number   = '006'
                                   severity = if_abap_behv_message=>severity-information
                                   v1       = key_row-%param-customerid
                                   v2       = number_upd
*                             v3       =
*                             v4       =
                                 ).
          APPEND res_msg TO reported-%other.

        ENDLOOP.
*        result
      CATCH cx_root INTO DATA(ex).
    ENDTRY.

  ENDMETHOD.

  METHOD ShowStatistics.
*   Klassenname laden und auf Implementierung des Interfaces testen
    SELECT SINGLE FROM zcs02_statistic
    FIELDS name
    WHERE type = 'CLASS' AND is_active = 'X'
    INTO @DATA(lv_classname)." = 'ZCL_CS02_STATISTICS_01'.      "Replace with select

    DATA(lo_class_descr) = CAST cl_abap_classdescr( cl_abap_typedescr=>describe_by_name( lv_classname ) ).
    READ TABLE lo_class_descr->interfaces
        WITH KEY name = 'ZIF_STATISTICS02'
        INTO DATA(qwert).
    IF sy-subrc <> 0.
*      Not implemented
    ELSE.

*    Read Entities of keys
      READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
      ENTITY ZrCs02Customers
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_customers).


*       Klasse referenzieren
*      DATA(lo_stat_calc) = NEW zcl_cs02_statistics_01( ).

      DATA lo_stat_calc TYPE REF TO zif_statistics02.
      CREATE OBJECT lo_stat_calc TYPE (lv_classname).

*       Interfacemethoden aufrufen
      LOOP AT lt_customers INTO DATA(ls_customer).
        DATA(lv_customerid) = ls_customer-Customerid.
*           Ausgabe erzeugen
        DATA(res_msg) = new_message(
                                       id       = 'ZMESSAGE02'
                                       number   = '007'
                                       severity = if_abap_behv_message=>severity-information
                                       v1       = lv_customerid
                                       v2       = lo_stat_calc->averagesales( lv_customerid )
                                       v3       = lo_stat_calc->maxsales( lv_customerid )
                                       v4       = lo_stat_calc->daysales( )
                                     ).
        APPEND res_msg TO reported-%other.
      ENDLOOP.
    ENDIF.


  ENDMETHOD.

ENDCLASS.
