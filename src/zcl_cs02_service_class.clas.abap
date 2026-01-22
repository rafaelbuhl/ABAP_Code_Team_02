CLASS zcl_cs02_service_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    CLASS-METHODS:
      is_valid_email
        IMPORTING iv_email          TYPE string
        RETURNING VALUE(r_is_valid) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS:
      cust_key    TYPE string       VALUE 'EMAILREGEX',
      cust_active TYPE c LENGTH 1   VALUE 'X'.
ENDCLASS.



CLASS zcl_cs02_service_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  ENDMETHOD.

  METHOD is_valid_email.
*    DATA(gv_pattern) = '^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$'.
    SELECT SINGLE FROM zcs02_custtab
      FIELDS default_value
      WHERE name = @cust_key
      AND active = @cust_active
      INTO @DATA(gv_pattern).
    IF matches( val = iv_email pcre = gv_pattern ).
      r_is_valid = abap_true.
    ELSE.
      r_is_valid = abap_false.
    ENDIF.
  ENDMETHOD.



ENDCLASS.
