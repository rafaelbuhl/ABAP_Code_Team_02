CLASS zcl_02_09_cs_import_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*** Definition



    "Werkzeug A: eine Tabelle mit ein Arbeitsbereich
    DATA gt_import TYPE TABLE OF char256.
    DATA gt_import_wa TYPE char256.

    "Werkzeug B: Struktur für Datenexport der Tabelle und ein ent Arbeitsbereich
        TYPES: BEGIN OF gtt_export,
                 company  TYPE char256,
                 street   TYPE char256,
                 postcode TYPE char256,
                 city     TYPE char256,
                 medium   TYPE char256,
                 val1     TYPE char256,
                 val2     TYPE char256,
               END OF gtt_export.

    DATA gt_export TYPE TABLE OF gtt_export.
    DATA gt_export_wa TYPE gtt_export.


    " Werkzeug C: eine sortierte Tabelle um Duplikate aus der export Tabelle zu entfernen
    DATA gt_export_sorted TYPE SORTED TABLE OF gtt_export
        WITH UNIQUE KEY company street postcode city.
    DATA gt_export_sorted_wa LIKE LINE OF gt_export_sorted.




*** Declaration






*** Processing


    " Schritt 1/3: Daten aus der Datenbank Tabelle in einer internen Tabelle lesen
    SELECT
    FROM ztl_02_09_cs
    FIELDS import
    INTO TABLE @gt_import.


    " Schritt 2.1/3: Datenverarbeitung. Daten verteilen, bereinigen und sie in einer export Tabelle schreiben

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


    "Schritt 2.2/3: Duplikate entfernen

    LOOP AT gt_export into gt_export_wa.

        CLEAR gt_export_wa.
        CLEAR gt_export_sorted_wa.
        gt_export_sorted_wa = gt_export_wa.
        INSERT gt_export_sorted_wa INTO TABLE gt_export_sorted.

    ENDLOOP.




    " Schritt 3/3: Daten aus der internen Tabelle in einer Datenbankltabelle schreiben

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

    out->write(   data = gt_export
                  name = 'Interne Exporttabelle' ).

    out->write(   data = gt_export_sorted
                 name = 'Interne Sortierte Exporttabelle. Ohne Duplikate.' ).


  ENDMETHOD.
ENDCLASS.
