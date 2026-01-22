CLASS zcl_my_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_my_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Definition
  DATA gv_slogan TYPE string.

* Declaration
  gv_slogan = 'SAP! the best run!'.

* Implimentation

  out->write(
      data   = gv_slogan
      name = 'Slogan:' ).


  ENDMETHOD.
ENDCLASS.
