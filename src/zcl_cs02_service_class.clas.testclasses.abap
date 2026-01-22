*"* use this source file for your ABAP unit test classes
CLASS ltcl_test DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION LONG.

  PRIVATE SECTION.

    METHODS: test_validate_email_valid        FOR TESTING,
             test_email_inv_missing_at        FOR TESTING,
             test_email_inv_char              FOR TESTING,
             test_email_inv_space             FOR TESTING,
             test_email_inv_miss_tld          FOR TESTING,
             test_email_inv_empty_field       FOR TESTING,
             test_email_valid_upper_lower     FOR TESTING.


ENDCLASS.

CLASS ltcl_test IMPLEMENTATION.

* Positiver TestfÄlle:
* Testfall 1 : gültige Email
  METHOD test_validate_email_valid.
    DATA is_valid TYPE abap_bool.
    TRY.
        is_valid = zcl_cs02_service_class=>is_valid_email( iv_email = 'test@gmail.com' ).
        cl_abap_unit_assert=>assert_true( act = is_valid ).
      CATCH cx_abap_invalid_value.
    ENDTRY.
  ENDMETHOD.

* Testfall 2 : Groß-/Kleinschreibung
  METHOD test_email_valid_upper_lower.
    DATA is_valid TYPE abap_bool.
    TRY.
        is_valid = zcl_cs02_service_class=>is_valid_email( iv_email = 'teSt@gmaIl.com' ).
        cl_abap_unit_assert=>assert_true( act = is_valid ).
      CATCH cx_abap_invalid_value.

    ENDTRY.
  ENDMETHOD.

* Negative Testfälle:
* Testfall 1 : Fehlt @ Zeichen
  METHOD test_email_inv_missing_at.
    DATA is_valid TYPE abap_bool.
    TRY.
        is_valid = zcl_cs02_service_class=>is_valid_email( iv_email = 'testgmail.com' ).
        cl_abap_unit_assert=>assert_false( act = is_valid ).
      CATCH cx_abap_invalid_value.
    ENDTRY.

  ENDMETHOD.
* Testfall 2 : ungültiges Zeichen
  METHOD test_email_inv_char.
    DATA is_valid TYPE abap_bool.
    TRY.
        is_valid = zcl_cs02_service_class=>is_valid_email( iv_email = 'test@gma!!il.com' ).
        cl_abap_unit_assert=>assert_false( act = is_valid ).
      CATCH cx_abap_invalid_value.
    ENDTRY.

  ENDMETHOD.
* Testfall 3 : Leerzeichen
  METHOD test_email_inv_space.
    DATA is_valid TYPE abap_bool.
    TRY.
        is_valid = zcl_cs02_service_class=>is_valid_email( iv_email = ' test@gmail.com' ).
        cl_abap_unit_assert=>assert_false( act = is_valid ).
      CATCH cx_abap_invalid_value.

    ENDTRY.
  ENDMETHOD.

* Testfall 4 : fehlender TLD (Top-Level Domain)
  METHOD test_email_inv_miss_tld.
    DATA is_valid TYPE abap_bool.
    TRY.
        is_valid = zcl_cs02_service_class=>is_valid_email( iv_email = 'test@gmail' ).
        cl_abap_unit_assert=>assert_false( act = is_valid ).
      CATCH cx_abap_invalid_value.

    ENDTRY.
  ENDMETHOD.

* Testfall 5 : Leeres Feld
  METHOD test_email_inv_empty_field.
    DATA is_valid TYPE abap_bool.
    TRY.
        is_valid = zcl_cs02_service_class=>is_valid_email( iv_email = '' ).
        cl_abap_unit_assert=>assert_false( act = is_valid ).
      CATCH cx_abap_invalid_value.

    ENDTRY.
  ENDMETHOD.

ENDCLASS.
