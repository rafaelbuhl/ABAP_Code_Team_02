CLASS zcl_02_09_cs_import_00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_00 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*****************
* Beschreibung: *
*****************
    "Dieses Programm macht folgendes:
    "   a. liest die Daten aus der Tabelle 'ZTL_02_09_CS'
    "   b. verarbeitet die Daten, und
    "   c. schreibt die Ergebnisdaten in die Datenbanktabelle 'ZCS09_CUSTOMERS'



*    DATA gt_import TYPE TABLE OF string.
*    DATA gt_import_wa TYPE string.
*
*    "Logik: Daten lesen
*    SELECT
*    FROM ztl_02_09_cs
*    FIELDS import
*    INTO TABLE @gt_import.
*
*    DATA gt_zkunde TYPE SORTED TABLE OF zcs09_customers
*        WITH UNIQUE KEY company street postcode city.

*    DATA gs_zkunde LIKE LINE OF gt_zkunde.
*
*    LOOP AT gt_import INTO gt_import_wa.
*        MOVE-CORRESPONDING gt_import_wa TO gs_zkunde.
*        INSERT gs_zkunde INTO TABLE gt_zkunde.
*    ENDLOOP.
*







*** Output

*    out->write(   data = gt_import
*                  name = 'Interne Importtabelle' ).




  ENDMETHOD.
ENDCLASS.
