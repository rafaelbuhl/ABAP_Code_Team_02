*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_conv DEFINITION.

  PUBLIC SECTION.
    METHODS entferne_anfuehrungszeichen
      IMPORTING iv_import        TYPE c
      RETURNING VALUE(rv_import) TYPE string.

    TYPES: BEGIN OF st_import_split,
             company   TYPE zcompany02,
             street TYPE zstreet02,
             Postcode     TYPE zpostcode02,
             City     TYPE zcity02,
             Medium  TYPE c LENGTH 255,
             Value1  TYPE c LENGTH 255,
             Value2  TYPE c LENGTH 255,
           END OF st_import_split.

    DATA: lt_import_conv TYPE TABLE OF st_import_split,
          ls_import_conv TYPE st_import_split.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_conv IMPLEMENTATION.

  METHOD entferne_anfuehrungszeichen.
    DATA lv_conv_output TYPE c LENGTH 255.

    rv_import = iv_import.
    REPLACE ALL OCCURRENCES OF `"` IN rv_import WITH ``.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_entferne_duplikate DEFINITION.

ENDCLASS.

CLASS lcl_entferne_duplikate IMPLEMENTATION.

ENDCLASS.
