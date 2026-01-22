
*CLASS lsc_zr_cs02_customers_m DEFINITION INHERITING FROM cl_abap_behavior_saver.
*
*  PROTECTED SECTION.
*
*    METHODS adjust_numbers REDEFINITION.
*
*ENDCLASS.
*
*CLASS lsc_zr_cs02_customers_m IMPLEMENTATION.
*
*  METHOD adjust_numbers.
*
*    LOOP AT mapped-_customers ASSIGNING FIELD-SYMBOL(<fs_customer>).
*      TRY.
*          cl_numberrange_runtime=>number_get(
*              EXPORTING
*                object            = 'ZCSTIDNUM2'
*                nr_range_nr       = '01'
*              IMPORTING
*                number            = DATA(lv_number)
*            ).
*          IF sy-subrc = 0.
*            <fs_customer>-Customerid = lv_number+14(6).
*
*          ELSE.
*            RAISE EXCEPTION TYPE cx_number_ranges.
*          ENDIF.
*        CATCH cx_root.
*      ENDTRY.
*    ENDLOOP.
*    LOOP AT mapped-_order ASSIGNING FIELD-SYMBOL(<order>).
*      TRY.
*          cl_numberrange_runtime=>number_get(
*              EXPORTING
*                object            = 'ZORDERID02'
*                nr_range_nr       = '01'
*              IMPORTING
*                number            = lv_number
*            ).
*          IF sy-subrc = 0.
*            <order>-Orderid = lv_number+14(6).
*          ELSE.
*            RAISE EXCEPTION TYPE cx_number_ranges.
*          ENDIF.
*        CATCH cx_root.
*      ENDTRY.
*
*    ENDLOOP.
*
*  ENDMETHOD.
*
*ENDCLASS.

CLASS lhc__Customers DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS:
        get_instance_authorizations FOR INSTANCE AUTHORIZATION
            IMPORTING keys REQUEST requested_authorizations FOR _Customers RESULT result,

        get_global_authorizations FOR GLOBAL AUTHORIZATION
            IMPORTING REQUEST requested_authorizations FOR _Customers RESULT result,
        CheckEmail FOR VALIDATE ON SAVE
            IMPORTING keys FOR _Customers~CheckEmail,
        GetCity FOR DETERMINE ON SAVE
            IMPORTING keys FOR _Customers~GetCity,
        GetCurrencyTarget FOR DETERMINE ON SAVE
            IMPORTING keys FOR _Customers~GetCurrencyTarget,
        GetDefaultValues FOR DETERMINE ON MODIFY
            IMPORTING keys FOR _Customers~GetDefaultValues,
        SetLastDate FOR DETERMINE ON MODIFY
            IMPORTING keys FOR _Customers~SetLastDate,
        CheckCompany FOR VALIDATE ON SAVE
            IMPORTING keys FOR _Customers~CheckCompany,
        ShowStatistics FOR MODIFY
            IMPORTING keys FOR ACTION _Customers~ShowStatistics RESULT result,
*        updateSalesVolume FOR DETERMINE ON SAVE
*            IMPORTING keys FOR _Order~updateSalesVolume.
        CancelOrders FOR MODIFY
            IMPORTING keys FOR ACTION _Customers~CancelOrders RESULT result.

ENDCLASS.

CLASS lhc__Customers IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD CheckEmail.

    DATA customers TYPE TABLE FOR READ RESULT zr_cs02_customers_m.
    DATA lv_email TYPE string.
    DATA reported_record LIKE LINE OF reported-_customers.
    DATA failed_record LIKE LINE OF failed-_customers.

    READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
    ENTITY _Customers
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
        APPEND reported_record TO reported-_customers.
        failed_record-%tky = customer-%tky.
        APPEND failed_record TO failed-_customers.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
  METHOD GetCity.

    DATA customers TYPE TABLE FOR READ RESULT zr_cs02_customers_m.
    READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
    ENTITY _Customers
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

    DATA customers_upd TYPE TABLE FOR UPDATE zr_cs02_customers_m.
    customers_upd = CORRESPONDING #( customers ).

    MODIFY ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
    ENTITY _Customers
    UPDATE
    FIELDS ( city )
    WITH customers_upd
    REPORTED DATA(reported_records).

    reported-_customers = CORRESPONDING #( reported_records-_customers ).

  ENDMETHOD.
  METHOD GetCurrencyTarget.
    TRY.

        DATA customers_upd TYPE TABLE FOR UPDATE zr_cs02_customers_m.
        DATA customers TYPE TABLE FOR READ RESULT zr_cs02_customers_m.

        READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
            ENTITY _Customers
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

        MODIFY ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
            ENTITY _Customers
            UPDATE
            FIELDS ( Currency SalesVolumeTarget CurrencyTarget ChangeRateDate )
            WITH customers_upd
            REPORTED DATA(reported_records).

        reported-_customers = CORRESPONDING #( reported_records-_customers ).
*    DATA(my_reported) = reported_records-zrcs02customers.

      CATCH cx_root INTO DATA(ex).
        DATA(temp) = ex->get_text( ).
    ENDTRY.

  ENDMETHOD.
  METHOD GetDefaultValues.
    DATA cust_read TYPE TABLE FOR READ RESULT zr_cs02_customers_m.
    DATA cust_upd TYPE TABLE FOR UPDATE zr_cs02_customers_m.

    READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
        ENTITY _Customers
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

    MODIFY ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
        ENTITY _Customers
        UPDATE
        FIELDS ( Country Language )
        WITH cust_upd
        REPORTED DATA(reported_data).

    reported-_customers = CORRESPONDING #( reported_data-_customers ).

  ENDMETHOD.

  METHOD SetLastDate.
    DATA cust_read TYPE TABLE FOR READ RESULT zr_cs02_customers_m.
    DATA cust_upd TYPE TABLE FOR UPDATE zr_cs02_customers_m.

    READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
        ENTITY _Customers
        ALL FIELDS
        WITH CORRESPONDING #( keys )
        RESULT cust_read.

    LOOP AT cust_read INTO DATA(row).
      IF row-LastDate IS INITIAL.
        row-LastDate = cl_abap_context_info=>get_system_date( ).
        APPEND CORRESPONDING #( row ) TO cust_upd.
      ENDIF.
    ENDLOOP.

    MODIFY ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
        ENTITY _Customers
        UPDATE
        FIELDS ( LastDate )
        WITH cust_upd
        REPORTED DATA(rep_dat).

    reported-_customers = CORRESPONDING #( rep_dat-_customers ).

  ENDMETHOD.

  METHOD CheckCompany.

    DATA customers TYPE TABLE FOR READ RESULT zr_cs02_customers_m.
    DATA reported_record LIKE LINE OF reported-_customers.
    DATA failed_record LIKE LINE OF failed-_customers.

    READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
     ENTITY _Customers
     FIELDS ( LastName FirstName Company Street City Postcode )
     WITH CORRESPONDING #( keys )
     RESULT customers.

    LOOP AT customers INTO DATA(customer).

      SELECT SINGLE
        FROM zr_cs02_customers_m
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
        APPEND reported_record TO reported-_customers.
        failed_record-%tky = customer-%tky.
        APPEND failed_record TO failed-_customers.
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

          DATA orders_read TYPE TABLE FOR READ RESULT zr_cs02_custorders_s.
          READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
          ENTITY _Order
          ALL FIELDS
          WITH CORRESPONDING #( lt_orders )
          RESULT orders_read.

          DATA(number_upd) = 0.
          DATA orders_upd TYPE TABLE FOR UPDATE zr_cs02_custorders_s.
          LOOP AT orders_read INTO DATA(ls_order).
            ls_order-Status = 'ST'.
            APPEND CORRESPONDING #( ls_order ) TO orders_upd.
            number_upd += 1.
          ENDLOOP.

          MODIFY ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
          ENTITY _order
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

    TRY.
        DATA temp TYPE REF TO object.
        CREATE OBJECT temp TYPE (lv_classname).
        DATA(lo_class_descr) = CAST cl_abap_classdescr( cl_abap_typedescr=>describe_by_name( lv_classname ) ).
      CATCH cx_sy_create_object_error INTO DATA(ex).
        lv_classname = 'ZCL_CS02_STATISTICS_02'.
        lo_class_descr = CAST cl_abap_classdescr( cl_abap_typedescr=>describe_by_name( lv_classname ) ).
        DATA(default_msg) = new_message(
                                       id       = 'ZMESSAGE02'
                                       number   = '008'
                                       severity = if_abap_behv_message=>severity-success
                                     ).
        APPEND default_msg TO reported-%other.
    ENDTRY.

    READ TABLE lo_class_descr->interfaces
        WITH KEY name = 'ZIF_STATISTICS02'
        INTO DATA(qwert).
    IF sy-subrc <> 0.
      lv_classname = 'ZCL_CS02_STATISTICS_02'.
      lo_class_descr = CAST cl_abap_classdescr( cl_abap_typedescr=>describe_by_name( lv_classname ) ).
      default_msg = new_message(
                                     id       = 'ZMESSAGE02'
                                     number   = '008'
                                     severity = if_abap_behv_message=>severity-success
                                   ).
      APPEND default_msg TO reported-%other.
    ENDIF.

*    Read Entities of keys
    READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
    ENTITY _Customers
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

  ENDMETHOD.

ENDCLASS.


CLASS lhc__order DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS updateSalesVolume FOR DETERMINE ON SAVE
      IMPORTING keys FOR _Order~updateSalesVolume.

ENDCLASS.

CLASS lhc__order IMPLEMENTATION.

  METHOD updateSalesVolume.
    DATA orders_read TYPE TABLE FOR READ RESULT zr_cs02_custorders_s.
    DATA cust_upd TYPE TABLE FOR UPDATE zr_cs02_customers_m.

    READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
    ENTITY _Order
    FIELDS ( Customerid Orderid OrderTotal Currency )
    WITH CORRESPONDING #( keys )
    RESULT orders_read.

    LOOP AT orders_read INTO DATA(order_row).
      DATA(today) = cl_abap_context_info=>get_system_date( ).

*      SELECT FROM zcs02_custorders
*      FIELDS SUM(
*              CAST( currency_conversion(
*                  amount = order_total,
*                  source_currency = currency,
*                  target_currency = 'EUR',
*                  exchange_rate_date = @today
*              ) AS DEC( 12,2 ) )
*           ) AS Total
*      WHERE customerid = @order_row-Customerid
*          AND status <> 'ST'
*          AND order_total <> 0
*      INTO @DATA(result).

      READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
        ENTITY _Customers BY \_Order
        FIELDS ( OrderTotal Currency Status )
        WITH VALUE #( ( Customerid = order_row-Customerid ) )
        RESULT DATA(orders_for_customer).

      DATA result TYPE zsales_volume02.
      clear result.

      LOOP AT orders_for_customer INTO DATA(ls_order).
        IF ls_order-Status <> 'ST' AND ls_order-OrderTotal <> 0.
          DATA loc_amount TYPE zsales_volume02.
          TRY.
              cl_exchange_rates=>convert_to_local_currency(
                  EXPORTING
                      foreign_amount = ls_order-ordertotal
                      foreign_currency = ls_order-currency
                      local_currency = 'EUR'
                      date = today
                  IMPORTING
                      local_amount = loc_amount
            ).
              result += loc_amount.
            CATCH cx_exchange_rates.
              "handle exception
          ENDTRY.

        ENDIF.
      ENDLOOP.

      DATA customer_read TYPE TABLE FOR READ RESULT zr_cs02_customers_m.

      READ ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
      ENTITY _Customers
      ALL FIELDS
      WITH VALUE #( ( Customerid = order_row-Customerid ) )
      RESULT customer_read.

      IF lines( customer_read ) > 0.
        DATA(cust_row) = customer_read[ 1 ].
        READ TABLE cust_upd WITH KEY Customerid = cust_row-Customerid INTO DATA(temp).
        IF sy-subrc = 0.
          temp-SalesVolume = result.
          temp-Currency = 'EUR'.
          MODIFY TABLE cust_upd FROM temp.
        ELSE.
          cust_row-SalesVolume = result.
          cust_row-Currency = 'EUR'.
          APPEND CORRESPONDING #( cust_row ) TO cust_upd.
        ENDIF.
      ENDIF.

    ENDLOOP.

    SORT cust_upd BY Customerid.
    DELETE ADJACENT DUPLICATES FROM cust_upd.

    MODIFY ENTITIES OF zr_cs02_customers_m IN LOCAL MODE
    ENTITY _Customers
    UPDATE
    FIELDS ( SalesVolume Currency )
    WITH cust_upd
    REPORTED DATA(reported_data).

*    reported-_customers = CORRESPONDING #( reported_data ).

  ENDMETHOD.

ENDCLASS.
