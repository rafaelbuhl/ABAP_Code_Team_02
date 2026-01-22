
CLASS zcl_cs02_sum_orders_ms DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cs02_sum_orders_ms IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~calculate.



    DATA: lt_original TYPE TABLE OF ZC_CS02_CUSTOMERS_M.

    lt_original = CORRESPONDING #( it_original_data ).
    LOOP AT lt_original ASSIGNING FIELD-SYMBOL(<fs>) .
      SELECT SINGLE OrderCount FROM ZR_CS02_CUSTOMERS_SUM_ORD_MS( p_customerid = @<fs>-Customerid )
        INTO  @DATA(lv_ordercount).
      <fs>-ordercount = lv_ordercount.
    ENDLOOP.
    ct_calculated_data = CORRESPONDING #( lt_original ).
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.

ENDCLASS.
