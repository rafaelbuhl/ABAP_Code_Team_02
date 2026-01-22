CLASS zcl_cs02_cds_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs02_cds_select IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT * FROM ZCS02CUSTOMERS_C_MAX(  p_currency_target = 'EUR' )
  ORDER BY Customerid
  INTO TABLE @DATA(lt_result).

*  out->write( lt_result ).

  SELECT * FROM ZCS02CUSTOMER_C_LIST

  WHERE Orderid is not initial
  ORDER BY Customerid
  INTO TABLE @DATA(lt_result2).

  out->write( lt_result2 ).



  ENDMETHOD.
ENDCLASS.
