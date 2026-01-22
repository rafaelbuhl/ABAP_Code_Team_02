CLASS zcl_test_07_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_07_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA: customers_upd TYPE TABLE FOR UPDATE zr_cs02_customers,
*          keys          TYPE TABLE OF zr_cs02_customers.
*
*    APPEND VALUE #( customerid = '000209' ) TO keys.
*
*    READ ENTITIES OF zr_cs02_customers IN LOCAL MODE
*        ENTITY ZrCs02Customers
*        FIELDS ( Customerid Currency CurrencyTarget SalesVolume SalesVolumeTarget ChangeRateDate )
*        WITH CORRESPONDING #( keys )
*        RESULT DATA(customers).
*
*    LOOP AT customers INTO DATA(customer).
*
*      IF customer-ChangeRateDate IS INITIAL.
*        customer-ChangeRateDate = cl_abap_context_info=>get_system_date(  ).
*      ENDIF.
*
*      SELECT SINGLE
*      company,
*              currency_conversion( amount = @customer-SalesVolume,
*                                   source_currency = @customer-Currency,
*                                   target_currency = @customer-CurrencyTarget,
*                                   exchange_rate_date = @customer-ChangeRateDate,
*                                   on_error = @sql_currency_conversion=>c_on_error-fail ) AS SalesVolumeTarget
*
*          FROM zr_cs02_customers
*          INTO  @DATA(customer_result).
*
*      IF sy-subrc = 0.
*
*        customer-SalesVolumeTarget = customer_result-salesvolumetarget.
*
**        MODIFY customers FROM customer INDEX sy-tabix.
*      ENDIF.
*
**      customers_upd = CORRESPONDING #( customers ).
*      APPEND CORRESPONDING #( customer ) TO customers_upd.
*
*    ENDLOOP.
*
*    MODIFY ENTITIES OF zr_cs02_customers IN LOCAL MODE
*        ENTITY ZrCs02Customers
*        UPDATE
*        FIELDS ( SalesVolumeTarget CurrencyTarget  )
*        WITH CORRESPONDING #(  customers_upd )
*        REPORTED DATA(reported_records).
*
**      reported-zrcs02customers = CORRESPONDING #( reported_records-zrcs02customers ).
*    DATA(my_reported) = reported_records-zrcs02customers.

*    SELECT SINGLE FROM zcs02_custtab
*    FIELDS default_value
*    WHERE  name = 'FISCALYEAR'
*        AND active = 'X'
*    INTO @DATA(lv_fiscal_year).
*
*    SELECT FROM zcs02_custorders
*    FIELDS customerid,
*        CAST( AVG( currency_conversion( amount = order_total,
*                                source_currency = currency,
*                                target_currency = 'EUR',
*                                exchange_rate_date = order_date
*                                 ) ) AS DEC( 12,2 ) ) AS Average,
*             'EUR' AS Currency,
*             COUNT( orderid ) AS NumberOfOrders
*     WHERE customerid = '000010' AND
*            substring( order_date, 1, 4 ) = @lv_fiscal_year AND
*            order_total <> 0 AND
*            status <> 'ST'
*    GROUP BY customerid
*    INTO TABLE @DATA(lt_result).
*
*    data(r_average_sales) = |{ lt_result[ 1 ]-average } { lt_result[ 1 ]-currency }|.
*
*    out->write( r_average_sales ).

*    Read class to be used
*    select ...
*    DATA(lv_classname) = 'ZCL_CS02_STATISTICS_01'.
*    DATA lo_type_descr TYPE REF TO cl_abap_typedescr.
**    DATA lo_class_descr TYPE REF TO cl_abap_classdescr.
*    data(lo_class_descr) = CAST cl_abap_classdescr( cl_abap_typedescr=>describe_by_name( lv_classname ) ).
**    data(lo_obj_desc) = cl_abap_objectdescr=>describe_by_name( lv_classname ).
*
*    DATA(temp) = lo_class_descr->describe_by_name( 'ZIF_STATISTICS02' ).
*    DATA(temp2) = lo_class_descr->describe_by_name( 'IF_OO_ADT_CLASSRUN' ).
*
*    TRY.
*        DATA(test1) = lo_class_descr->get_interface_type( 'ZIF_STATISTICS02' ).
*        READ TABLE lo_class_descr->interfaces
*        WITH KEY name = 'ZIF_STATISTICS02'
*        INTO DATA(qwert).
*        IF sy-subrc <> 0.
*          out->write( 'not found' ).
*        ENDIF.
*        READ TABLE lo_class_descr->interfaces
*        WITH KEY name = 'ZIF_STATISTICS02fgrdg'
*        INTO DATA(qwertz).
*        IF sy-subrc <> 0.
*          out->write( 'not found' ).
*        ENDIF.
**        result data(lt_interfaces).
**        data(test2) = lo_class_descr->get_ddic_object( ).
**        lo_class_descr->get_interface_type( 'IF_OO_ADT_CLASSRUN' ).
*      CATCH cx_root INTO DATA(ex).
*        out->write( ex->get_text( ) ).
*    ENDTRY.



*    data values type table of zcs02_statistic.
*    data value type zcs02_statistic.
*    TRY.
*        values = VALUE #( ( uuid = cl_system_uuid=>create_uuid_x16_static( )
*                            type = 'CLASS'
*                            name = 'ZCL_CS02_STATISTICS_01'
*                            is_active = 'X' )
*                          ( uuid = cl_system_uuid=>create_uuid_x16_static( )
*                            type = 'INTERFACE'
*                            name = 'ZIF_STATISTICS02'
*                            is_active = 'X' )
*                    ).
*        loop at values into value.
*            insert into zcs02_statistic values @value.
*        endloop.
*
*      CATCH cx_uuid_error.
*        "handle exception
*    ENDTRY.

*    delete from zcs02_orders_d_s .


*    TRY.
*        cl_numberrange_intervals=>create(
*          EXPORTING
*            interval  = VALUE #( (
*                nrrangenr = '01'
*                fromnumber = '000100'
*                tonumber = '099999'
*                procind = 'I'
*                ) )
*            object    = 'ZORDERID02'
*        ).
*      CATCH cx_root into data(ex).
*        out->write( ex ).
*    ENDTRY.

*cl_exchange_rates=>convert_to_local_currency

  ENDMETHOD.

ENDCLASS.
