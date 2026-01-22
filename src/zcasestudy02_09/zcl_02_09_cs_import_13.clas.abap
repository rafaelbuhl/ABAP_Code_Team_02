CLASS zcl_02_09_cs_import_13 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_13 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*****************
* Beschreibung: *
*****************
    " Dieses Programm macht folgendes:
    "   a. liest die Daten aus der Tabelle 'ZTL_02_09_CS'
    "   b. verarbeitet die Daten, und
    "   c. schreibt die Ergebnisdaten in die Datenbanktabelle 'ZCS09_CUSTOMERS'



*** Definition








*** Declaration






*** Processing


    " Schritt a/c: Daten Lesen. Daten aus der Datenbank Tabelle ZTL_02_09_CS in einer internen Tabelle lesen

    "Werkzeuge: eine interne Tabelle mit ein Arbeitsbereich fürs Importieren
    DATA gt_import TYPE TABLE OF char256.
    DATA gt_import_wa TYPE char256.

    "Logik
    SELECT
    FROM ztl_02_09_cs
    FIELDS import
    INTO TABLE @gt_import.


    " Schritt b.1/c: Datenverarbeitung. Daten verteilen, bereinigen und sie in einer export Tabelle schreiben
    "Werkzeuge: Struktur, Zwei Tabellen mit Zwei Arbeitsbereiche für die interne Datenverarbeitung
    TYPES: BEGIN OF gtt_export,
                 company  TYPE char256,
                 street   TYPE char256,
                 postcode TYPE char256,
                 city     TYPE char256,
                 medium   TYPE char256,
                 val1     TYPE char256,
                 val2     TYPE char256,
               END OF gtt_export.

    DATA gt_export_sorted TYPE SORTED TABLE OF gtt_export
        WITH UNIQUE KEY company street postcode city.
    DATA gt_export_sorted_wa LIKE LINE OF gt_export_sorted.

    DATA gt_export TYPE TABLE OF gtt_export.
    DATA gt_export_wa TYPE gtt_export.



    "Logik
    LOOP AT gt_import INTO gt_import_wa.

        CLEAR gt_export_wa.

        SPLIT gt_import_wa AT '";"' INTO
            gt_export_wa-company
            gt_export_wa-street
            gt_export_wa-postcode
            gt_export_wa-city
            gt_export_wa-medium
            gt_export_wa-val1
            gt_export_wa-val2.

        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-company  WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-street   WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-postcode WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-city     WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-medium   WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-val1     WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-val2     WITH ''.

        APPEND gt_export_wa TO gt_export.

    ENDLOOP.


    "Schritt b.2/c: Duplikate entfernen indem die daten in einer sortierten Tabelle reingeschrieben werden
    "Logik
    LOOP AT gt_export into gt_export_wa.

        CLEAR gt_export_sorted_wa.
        gt_export_sorted_wa = gt_export_wa.
        INSERT gt_export_sorted_wa INTO TABLE gt_export_sorted.

    ENDLOOP.




    " Schritt c/c: Daten aus der internen Tabelle in einer Datenbankltabelle schreiben
    " Logik
*   try.
*       INSERT zcs09_cusmrs_pre FROM TABLE @gt_export.
*       IF sy-subrc <> 0.
*        out->write( 'Einfügen fehlgeschlagen' ).
*      ELSE.
*        out->write(  'Einfügen erfolgreich' ).
*      ENDIF.
*  CATCH cx_root INTO DATA(any).
*
*  out->write( 'Allgemeiner Fehler:' ).
*  out->write( any->get_text( ) ).
*
*  ENDTRY.





*** Output

*    out->write(   data = gt_import
*                  name = 'Interne Importtabelle' ).

*    out->write(   data = gt_export
*                  name = 'Interne Exporttabelle' ).

    out->write(   data = gt_export_sorted
                 name = 'Interne Sortierte Exporttabelle. Ohne Duplikate.' ).


  ENDMETHOD.
ENDCLASS.
