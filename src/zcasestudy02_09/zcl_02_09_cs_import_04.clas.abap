CLASS zcl_02_09_cs_import_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*** Definition


    " Interne Tabelle für die Übernahme der Import Felder aus der Import Tabelle ZTL_02_09_CS
    DATA gt_import TYPE TABLE OF string.

    " Struktur für die Verwendung als Arbeitsbereich bei der Übernahme der Datenelemente der Import Tabelle ZTL_02_09_CS

    TYPES: BEGIN OF gtt_import,
             company  TYPE string,
             street   TYPE string,
             postcode TYPE string,
             city     TYPE string,
             medium   TYPE string,
             val1  TYPE string,
             val2  TYPE string,
           END OF gtt_import.

    DATA: lt_string_table TYPE TABLE OF string,
      ls_customer     TYPE gtt_import,
      lt_customers    TYPE TABLE OF gtt_import.


*** Declaration


    " Kopieren der Datensätze für das Feld Import aus der Tabelle 'ztl_02_09_cs' in einer internen Tabelle 'gt_import'
    SELECT
    FROM ztl_02_09_cs
    FIELDS import
    INTO TABLE @gt_import.



*** Processing

*   LOOP AT lt_string_table INTO DATA(lv_line).
*  " Entfernen der Anführungszeichen und Aufteilen der CSV-Zeile
*  SPLIT lv_line AT '";"' INTO
*    ls_customer-company
*    ls_customer-street
*    ls_customer-postcode
*    ls_customer-city
*    ls_customer-medium
*    ls_customer-val1
*    ls_customer-val2.
*
*  " Entfernen der verbleibenden Anführungszeichen
*  REPLACE ALL OCCURRENCES OF '"' IN ls_customer-company WITH ''.
*  REPLACE ALL OCCURRENCES OF '"' IN ls_customer-medium WITH ''.
*
*  " Hinzufügen des Datensatzes zur internen Tabelle lt_customers
*  APPEND ls_customer TO lt_customers.
*ENDLOOP.
*
*" Einfügen der Daten in die Datenbanktabelle customers
*LOOP AT lt_customers INTO ls_customer.
*  INSERT INTO ztl_02_09_import  VALUES @ls_customer.
*  IF sy-subrc <> 0.
*    WRITE: / 'Einfügen fehlgeschlagen für:', ls_customer-name.
*  ELSE.
*    WRITE: / 'Einfügen erfolgreich für:', ls_customer-name.
*  ENDIF.
*ENDLOOP.



*** Output

*    out->write(   data = gt_import
*                  name = 'Globale Importtabelle' ).

*  out->write( il_company ).
*  out->write( il_street ).
*    out->write( il_postcode ).

  ENDMETHOD.
ENDCLASS.
