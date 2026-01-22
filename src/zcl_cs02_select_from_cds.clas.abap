CLASS zcl_cs02_select_from_cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs02_select_from_cds IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT * FROM zcs02customer_c_list
*    fields Customerid, Salutation, FirstName, LastName, Company, Street, City, Country,
*        \_Orders-Orderid, \_Orders-OrderTotal, \_Orders-Currency
    WHERE Orderid IS NOT INITIAL
    ORDER BY Customerid
    INTO TABLE @DATA(lt_res).

    out->write( lt_res ).
    CLEAR lt_res.
    out->write( |----------------------------------------------------------| ).

    SELECT * FROM zcs02customers_c_max( p_currency_target = 'EUR' )
    ORDER BY MaximalumsatzTarget
    INTO TABLE @DATA(lt_max).

    out->write( lt_max ).
  ENDMETHOD.
ENDCLASS.
