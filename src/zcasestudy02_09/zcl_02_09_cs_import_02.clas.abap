CLASS zcl_02_09_cs_import_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*** Definition



        DATA gt_import TYPE TABLE OF string.
*        DATA gt_import_split TYPE TABLE OF string.


*** Declaration

    DATA import_line TYPE string VALUE '"Ariana Automobile Fried Fedai";"Hammer Str. 62";"22043";"Hamburg";"Telefax";"040";"6521006"'.


*** Processing

    " Kopieren der Datensätze für das Feld Import aus der Tabelle 'ztl_02_09_cs' in einer internen Tabelle 'gt_import'
    SELECT
    FROM ztl_02_09_cs
    FIELDS import
    INTO TABLE @gt_import.




*** Output

  out->write(   data = gt_import
                name = 'Globale Importtabelle' ).


  ENDMETHOD.
ENDCLASS.
