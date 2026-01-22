class ZCL_CS02_OTHERS definition
  public
  create public .

public section.
    INTERFACES if_oo_adt_classrun .
protected section.
private section.
ENDCLASS.



CLASS ZCL_CS02_OTHERS IMPLEMENTATION.

  METHOD IF_OO_ADT_CLASSRUN~MAIN.

*    SELECT SINGLE FROM zcs02_custtab
*    FIELDS default_value
*    WHERE  name = 'FISCALYEAR'
*        AND active = 'X'
*    INTO @DATA(lv_fiscal_year).
*
*  DATA: lv_today TYPE d,
*      lv_start_of_year TYPE d,
*      lv_day_number TYPE i.
*
*lv_today = cl_abap_context_info=>get_system_date( ).
* lv_start_of_year = lv_today(4) && '0101'.
*    lv_day_number = lv_today - lv_start_of_year + 1.
*
*
*    SELECT FROM zcs02_custorders
*    FIELDS
*    CAST(
*
*    CAST(
*            CAST( sum( currency_conversion( amount = order_total,
*                                            source_currency = currency,
*                                            target_currency = 'EUR',
*                                            exchange_rate_date = order_date
*                                          ) ) AS DEC( 12,2 ) ) as fltp ) /
*            CAST(  @lv_day_number as fltp ) as dec( 12,2 ) ) AS Average
*
*
*        WHERE substring( order_date, 1, 4 ) = @lv_fiscal_year AND
*            order_total <> 0 AND
*            status <> 'ST'
*        INTO TABLE @DATA(lt_result).
*customerid = '000029' and


        SELECT FROM zcs02_custorders
    FIELDS customerid,
           max( currency_conversion( amount = order_total,
                                            source_currency = currency,
                                            target_currency = 'EUR',
                                            exchange_rate_date = order_date )  ) as MaxSales,
            'EUR' AS Currency
            WHERE  status <> 'ST'
            GROUP BY customerid
            INTO TABLE @DATA(lt_result).

*   IF lines( lt_result ) = 1.
*       DATA(r_max_sales) =  |{ lt_result[ 1 ]-maxsales } { lt_result[ 1 ]-currency }|.
*   ENDIF.

    out->write( lt_result ).
*    out->write( lv_today ).
  ENDMETHOD.

ENDCLASS.
