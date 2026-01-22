CLASS zcl_cs02_statistics_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES zif_statistics02.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_cs02_statistics_01 IMPLEMENTATION.


  METHOD zif_statistics02~averagesales.

    SELECT SINGLE FROM zcs02_custtab
    FIELDS default_value
    WHERE  name = 'FISCALYEAR'
        AND active = 'X'
    INTO @DATA(lv_fiscal_year).

    SELECT FROM zcs02_custorders
    FIELDS customerid,
        CAST( AVG( currency_conversion( amount = order_total,
                                source_currency = currency,
                                target_currency = 'EUR',
                                exchange_rate_date = order_date
                                 ) ) AS DEC( 12,2 ) ) AS Average,
             'EUR' AS Currency,
             COUNT( orderid ) AS NumberOfOrders
     WHERE customerid = @i_customer AND
            substring( order_date, 1, 4 ) = @lv_fiscal_year AND
            order_total <> 0 AND
            status <> 'ST'
    GROUP BY customerid
    INTO TABLE @DATA(lt_result).

    IF lines( lt_result ) = 1.
      r_average_sales = |{ lt_result[ 1 ]-average } { lt_result[ 1 ]-currency }|.
    ENDIF.

  ENDMETHOD.


  METHOD zif_statistics02~daysales.

    SELECT SINGLE FROM zcs02_custtab
     FIELDS default_value
     WHERE  name = 'FISCALYEAR'
         AND active = 'X'
     INTO @DATA(lv_fiscal_year).

    DATA: lv_today         TYPE d,
          lv_start_of_year TYPE d,
          lv_day_number    TYPE i.

    lv_today = cl_abap_context_info=>get_system_date( ).
    lv_start_of_year = lv_today(4) && '0101'.
    lv_day_number = lv_today - lv_start_of_year + 1.

    SELECT FROM zcs02_custorders
    FIELDS
    CAST(
        CAST(
            CAST( SUM( currency_conversion( amount = order_total,
                                            source_currency = currency,
                                            target_currency = 'EUR',
                                            exchange_rate_date = order_date
                                          ) ) AS DEC( 12,2 ) ) AS FLTP ) /
            CAST(  @lv_day_number AS FLTP ) AS DEC( 12,2 ) ) AS DaySales,
            'EUR' AS Currency
        WHERE substring( order_date, 1, 4 ) = @lv_fiscal_year AND
            order_total <> 0 AND
            status <> 'ST'
        INTO TABLE @DATA(lt_result).

    IF lines( lt_result ) = 1.
      r_day_sales = |{ lt_result[ 1 ]-daysales } { lt_result[ 1 ]-currency }|.
    ENDIF.
  ENDMETHOD.


  METHOD zif_statistics02~maxsales.

    SELECT FROM zcs02_custorders
      FIELDS customerid,
             MAX( cast(  currency_conversion( amount = order_total,
                                              source_currency = currency,
                                              target_currency = 'EUR',
                                              exchange_rate_date = order_date ) as dec( 12,2 ) ) ) AS MaxSales,
              'EUR' AS Currency
              WHERE customerid = @i_customer AND status <> 'ST'
              GROUP BY customerid
              INTO TABLE @DATA(lt_result).

    IF lines( lt_result ) = 1.
      r_max_sales =  |{ lt_result[ 1 ]-maxsales } { lt_result[ 1 ]-currency }|.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
