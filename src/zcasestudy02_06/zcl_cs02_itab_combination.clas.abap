CLASS zcl_cs02_itab_combination DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
        TYPES: BEGIN OF alphatab_type,
             cola TYPE string,
             colb TYPE string,
             colc TYPE string,
           END OF alphatab_type.
    TYPES alphas TYPE STANDARD TABLE OF alphatab_type.

    TYPES: BEGIN OF numtab_type,
             col1 TYPE string,
             col2 TYPE string,
             col3 TYPE string,
           END OF numtab_type.
    TYPES nums TYPE STANDARD TABLE OF numtab_type.

    TYPES: BEGIN OF combined_data_type,
             colx TYPE string,
             coly TYPE string,
             colz TYPE string,
           END OF combined_data_type.
    TYPES combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.

*    METHODS perform_combination
*      IMPORTING
*        alphas             TYPE alphas
*        nums               TYPE nums
*      RETURNING
*        VALUE(combined_data) TYPE combined_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs02_itab_combination IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA alphas TYPE STANDARD TABLE OF alphatab_type.
  DATA nums TYPE STANDARD TABLE OF numtab_type.
  DATA combined_data TYPE STANDARD TABLE OF combined_data_type.
  DATA ls_combined_data TYPE LINE OF combined_data.

  alphas = VALUE #( ( cola = 'A' colb = 'B' colc = 'C' )
                    ( cola = 'D' colb = 'E' colc = 'F' )
                    ( cola = 'G' colb = 'H' colc = 'I' ) ).

  nums = VALUE #( ( col1 = '1' col2 = '2' col3 = '3' )
                    ( col1 = '4' col2 = '5' col3 = '6' )
                    ( col1 = '7' col2 = '8' col3 = '9' ) ).

  LOOP AT alphas INTO DATA(ls_alpha).
  READ TABLE nums INTO DATA(ls_num) INDEX sy-tabix.
    IF sy-subrc = 0.
    ls_combined_data-colx = ls_alpha-cola && ls_num-col1.
    ls_combined_data-coly = ls_alpha-colb && ls_num-col2.
    ls_combined_data-colz = ls_alpha-colc && ls_num-col3.
   APPEND  ls_combined_data to combined_data.
   ENDIF.
   ENDLOOP.

      out->write( combined_data )  .
  ENDMETHOD.


ENDCLASS.
