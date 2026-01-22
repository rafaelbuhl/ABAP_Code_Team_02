CLASS zcl_02_09_cs_import_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*****************
* Beschreibung: *
*****************
    "Dieses Programm macht folgendes:
    "   a. liest die Daten aus der Tabelle 'ZTL_02_09_CS'
    "   b. verarbeitet die Daten, und
    "   c. schreibt die Ergebnisdaten in die Datenbanktabelle 'ZCS09_CUSTOMERS'



*** Definition








*** Declaration






*** Processing


    "Schritt a/c: Daten Lesen. Daten aus der Datenbank Tabelle ZTL_02_09_CS in einer internen Tabelle lesen
    "Werkzeuge: eine interne Tabelle mit ein Arbeitsbereich fürs Importieren
    DATA gt_import TYPE TABLE OF char256.
    DATA gt_import_wa TYPE char256.

    "Logik: Daten lesen
    SELECT
    FROM ztl_02_09_cs
    FIELDS import
    INTO TABLE @gt_import.


    "Schritt b.1/c: Datenverarbeitung. Daten verteilen, bereinigen und sie in einer export Tabelle schreiben
    "Werkzeuge: Struktur, Zwei Tabellen (standard und sortiert) mit Zwei Arbeitsbereiche (standard und sortiert) für die interne Datenverarbeitung
    TYPES: BEGIN OF gtt_export,
                 company  TYPE zcompany09,
                 street   TYPE zstreet09,
                 postcode TYPE zpostcode09,
                 city     TYPE zcity09,
                 medium   TYPE zmemo09,
                 val1     TYPE zmemo09,
                 val2     TYPE zmemo09,
               END OF gtt_export.


    DATA gt_export TYPE TABLE OF gtt_export.
    DATA gt_export_wa TYPE gtt_export.



    "Logik
    LOOP AT gt_import INTO gt_import_wa.

        CLEAR gt_export_wa.

        SPLIT gt_import_wa AT ';' INTO
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
    "Werkzeuge: Interne Sortierte Tabelle und ein Arbeitsbereich
     DATA gt_export_sorted TYPE SORTED TABLE OF gtt_export
            WITH UNIQUE KEY company street postcode city medium val1 val2.
     DATA gt_export_sorted_wa LIKE LINE OF gt_export_sorted.

    "Logik
    LOOP AT gt_export into gt_export_wa.

*        CLEAR gt_export_sorted_wa.
        gt_export_sorted_wa = gt_export_wa.
        INSERT gt_export_sorted_wa INTO TABLE gt_export_sorted.

    ENDLOOP.
*
*    "Schritt b.3/c: Spalten: Medium, auf email, telephon und fax verteilen
*    "Werkzeuge: neue Tabelle vom TYP ZCS09_CUSTOMERS und ein Arbeitsbereich
    TYPES: BEGIN OF gtt_export_final,
                 company  TYPE zcompany09,
                 street   TYPE zstreet09,
                 city     TYPE zcity09,
                 postcode TYPE zpostcode09,
                 fax      TYPE zfax09,
                 phone    TYPE zphone09,
                 email    TYPE zemail09,
               END OF gtt_export_final.
    DATA gt_export_sorted_final TYPE TABLE OF gtt_export_final.
    DATA gt_export_sorted_final_wa TYPE gtt_export_final.
*
*    "Logik
    LOOP AT gt_export_sorted INTO gt_export_sorted_wa.

*        CLEAR gt_export_sorted_final_wa.

        gt_export_sorted_final_wa-company = gt_export_sorted_wa-company.
        gt_export_sorted_final_wa-street = gt_export_sorted_wa-street.
        gt_export_sorted_final_wa-city = gt_export_sorted_wa-city.
        gt_export_sorted_final_wa-postcode = gt_export_sorted_wa-postcode.

        IF gt_export_sorted_wa-medium = 'Telefax'.
            gt_export_sorted_final_wa-fax = gt_export_sorted_wa-val1 && ' ' && gt_export_sorted_wa-val2.

        ELSEIF gt_export_sorted_wa-medium = '' OR gt_export_sorted_wa-medium = 'Q' OR gt_export_sorted_wa = 'D1Fu'.
             gt_export_sorted_final_wa-phone =  gt_export_sorted_wa-val1 && ' ' && gt_export_sorted_wa-val2.

        ELSE.
            gt_export_sorted_final_wa-email = gt_export_sorted_wa-val1 && ' ' && gt_export_sorted_wa-val2.

        ENDIF.


        INSERT gt_export_sorted_final_wa INTO TABLE gt_export_sorted_final.

    ENDLOOP.










    "Schritt c/c: Daten aus der internen Tabelle in die DB Tabelle 'ZCS09_CUSTOMERS' schreiben
    "Logik
*   try.
*       INSERT ZCS09_CUSTOMERS FROM TABLE @gt_export_sorted.
*       IF sy-subrc = 0.
*        out->write( 'Einfügen erfolgreich' ).
*      ELSE.
*        out->write(  'Einfügen fehlgeschlagen' ).
*      ENDIF.
*  CATCH cx_root INTO DATA(any).
*
*  out->write( 'Allgemeiner Fehler:' ).
*  out->write( any->get_text( ) ).
*
*  ENDTRY.





*** Output
*
*    out->write(   data = gt_import
*                  name = 'Interne Importtabelle' ).
*
*out->write( '-----------------------------------------------------------------------------------------------------' ).
*
*    out->write(   data = gt_export
*                  name = 'Interne Exporttabelle' ).
*
*
*    out->write( '-----------------------------------------------------------------------------------------------------' ).



    out->write(   data = gt_export_sorted
                 name = 'Interne Sortierte Exporttabelle. Ohne Duplikate.' ).

out->write( '-----------------------------------------------------------------------------------------------------' ).

     out->write(   data = gt_export_sorted_final
                 name = 'Vorbereitetet Tabelle' ).



  ENDMETHOD.
ENDCLASS.
