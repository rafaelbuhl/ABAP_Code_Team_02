CLASS zcl_02_09_cs_import_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*** Definition



        " Interne Tabelle für die Übernahme der Import Felder aus der Import Tabelle ZTL_02_09_CS
        DATA gt_import TYPE TABLE OF string.

        " Struktur für die Verwendung als Arbeitsbereich bei der Übernahme der Datenelemente der Import Tabelle ZTL_02_09_CS

        TYPES: BEGIN OF gtt_import,
            company TYPE string,
            street TYPE string,
            postcode TYPE string,
            city TYPE string,
            medium TYPE string,
            il_val1 TYPE string,
            il_val2 TYPE string,
            END OF gtt_import.

        " Interne Tabelle für die temporäre  übernahme der Datenelemente der Import Tabelle ZTL_02_09_CS
        DATA gt_import_split TYPE STANDARD TABLE OF gtt_import.

*        DATA il_company TYPE string.
*        DATA il_street TYPE string.
*        DATA il_postcode TYPE string.
*        DATA il_city TYPE string.
*        DATA il_medium TYPE string.
*        DATA il_val1 TYPE string.
*        DATA il_val2 TYPE string.


*** Declaration

    DATA import_line TYPE string VALUE '"Ariana Automobile Fried Fedai";"Hammer Str. 62";"22043";"Hamburg";"Telefax";"040";"6521006"'.


*** Processing

    " Kopieren der Datensätze für das Feld Import aus der Tabelle 'ztl_02_09_cs' in einer internen Tabelle 'gt_import'
*    SELECT
*    FROM ztl_02_09_cs
*    FIELDS import
*    INTO TABLE @gt_import.

*    Split import_line AT ';'
*        INTO
*            il_company
*            il_street
*            il_postcode
*            il_city
*            il_medium
*            il_val1
*            il_val2
*            .

*        LOOP AT lt_my_table INTO ls_my_line.
*          " Verarbeitung der Zeile
*          Modify table from wa.
*
*        ENDLOOP.


*** Output

  out->write(   data = gt_import
                name = 'Globale Importtabelle' ).

*  out->write( il_company ).
*  out->write( il_street ).
*    out->write( il_postcode ).

  ENDMETHOD.
ENDCLASS.
