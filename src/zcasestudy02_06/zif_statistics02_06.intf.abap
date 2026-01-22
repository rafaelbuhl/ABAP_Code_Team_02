INTERFACE zif_statistics02_06
  PUBLIC .

  TYPES:BEGIN OF tt_elements,
        customerid type zcustomerid02,
        order_total type zorder_total02,
        END OF tt_elements.
  TYPES lt_elements TYPE STANDARD TABLE OF tt_elements.
  METHODS:
     AverageSales IMPORTING it_requested_calc_elements type lt_elements
                       RETURNING VALUE(rv_avg_sales) type d,
     MaxSales     IMPORTING iv_requested_calc_elements type lt_elements
                       RETURNING VALUE(rv_max_sales) type d,
     DaySales     IMPORTING iv_requested_calc_elements type lt_elements
                       RETURNING VALUE(rv_day_sales) type d.
ENDINTERFACE.
