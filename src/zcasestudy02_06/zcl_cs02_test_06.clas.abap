CLASS zcl_cs02_test_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING
             VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
            VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING
             VALUE(result_index) TYPE i.


    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs02_test_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA input_string_1 TYPE string VALUE 'stressed'.
  DATA output_string_1 TYPE string.
  output_string_1 = reverse( input_string_1 ).
  out->write( output_string_1 ).


  ENDMETHOD.

METHOD fill_itab.
    DATA lt_initial_data TYPE itab_data_type.
    lt_initial_data = VALUE #( ( group = 'A' Number = 10 description = 'Group A-2' )
                              (  group = 'B' Number = 5 description = 'Group B')
                              (  group = 'A' Number = 6 description = 'Group A-1')
                              (  group = 'C' Number = 22 description = 'Group C-1')
                              (  group = 'A' Number = 13 description = 'Group A-3')
                              (  group = 'C' Number = 500 description = 'Group C-2')  ).
    initial_data = lt_initial_data.

  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.
     DATA ls_initial_data TYPE LINE OF itab_data_type.
     ls_initial_data-group = 'A'.
     ls_initial_data-number = 19.
     ls_initial_data-description = 'Group A-4'.
     APPEND ls_initial_data to updated_data.
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    SORT updated_data by group ASCENDING number DESCENDING.

  ENDMETHOD.

  METHOD search_itab.
    DATA(temp_data) = initial_data.
       LOOP AT temp_data INTO DATA(ls_row).
        IF ls_row-number = 6.
            result_index = sy-tabix.

            EXIT.
        ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.


