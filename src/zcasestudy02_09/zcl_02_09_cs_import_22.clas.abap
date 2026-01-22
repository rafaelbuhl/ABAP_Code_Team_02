CLASS zcl_02_09_cs_import_22 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_22 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*****************
* Beschreibung: *
*****************
    "Dieses Programm macht folgendes:
    "   a. liest die Daten aus der Tabelle 'ZTL_02_09_CS'
    "   b. verarbeitet die Daten in internen Tabellen, und
    "   c. schreibt die Ergebnisdaten in die Datenbanktabelle 'ZCS09_CUSTOMERS' wieder zurück



*** Definition
   "Variabeln und andere Werkzeuge werden vor der entsprechenden Schritte lokal definiert.







*** Declaration
    "Variabeln und andere Werkzeuge werden vor der entsprechenden Schritte lokal deklariert.





*** Processing


    "Schritt 1/3: Daten Lesen. Daten aus der Datenbank Tabelle ZTL_02_09_CS in einer internen Tabelle lesen
    "Werkzeuge: eine interne Tabelle (standard, nicht sortiert) mit ein Arbeitsbereich (nicht sortiert)
    DATA gt_import TYPE TABLE OF char256.
    DATA gt_import_wa TYPE char256.

    "Logik: Daten lesen
    SELECT
    FROM ztl_02_09_cs "Datenbanktabellenname innerhalb von ABAP SQL -> klein geschrieben
    FIELDS import
    INTO TABLE @gt_import.


    "Schritt 2.1/3: Datenverarbeitung. Daten verteilen, bereinigen und sie in einer Tabelle speichern
    "Werkzeuge: Struktur für die Zieltabelle und ein Arbeitsbereich
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



    "Logik: Datenverarbeitung

        " Daten verteilen
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

        " Daten bereinigen
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-company  WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-street   WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-postcode WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-city     WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-medium   WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-val1     WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN gt_export_wa-val2     WITH ''.

        APPEND gt_export_wa TO gt_export.

    ENDLOOP.


    "Schritt 2.2/3: Duplikate entfernen indem die daten in einer sortierten Tabelle reingeschrieben werden
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
*    "Schritt 2.3/3: Mapping zwischen Spalten: Medium wird auf email, telephon und fax verteilt
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



*    "Logik: Verteilung der inhalte von Medium auf fax, phone, email
    LOOP AT gt_export_sorted INTO gt_export_sorted_wa.

*        CLEAR gt_export_sorted_final_wa.

        gt_export_sorted_final_wa-company = gt_export_sorted_wa-company.
        gt_export_sorted_final_wa-street = gt_export_sorted_wa-street.
        gt_export_sorted_final_wa-city = gt_export_sorted_wa-city.
        gt_export_sorted_final_wa-postcode = gt_export_sorted_wa-postcode.

        IF gt_export_sorted_wa-medium = 'Telefax'.
            gt_export_sorted_final_wa-fax = gt_export_sorted_wa-val1 && ' ' && gt_export_sorted_wa-val2.

        ELSEIF gt_export_sorted_wa-medium = ''
            OR gt_export_sorted_wa-medium = 'Q'
            OR gt_export_sorted_wa-medium = 'D1Fu'.
             gt_export_sorted_final_wa-phone =  gt_export_sorted_wa-val1 && ' ' && gt_export_sorted_wa-val2.

        ELSE.
            gt_export_sorted_final_wa-email = gt_export_sorted_wa-val1 && ' ' && gt_export_sorted_wa-val2.

        ENDIF.


        INSERT gt_export_sorted_final_wa INTO TABLE gt_export_sorted_final.

    ENDLOOP.


    "Logik: Entfernung von Duplikate
    DELETE ADJACENT DUPLICATES FROM gt_export_sorted_final COMPARING street city postcode.











    "Schritt 3/3: Daten aus der internen Tabelle in die DB Tabelle 'ZCS09_CUSTOMERS' schreiben
    "Werkzeuge: zähler für customerid (Schlüsselfeld in der DB-Tabelle)
    DATA ZCS09_CUSTOMERS_WA TYPE ZCS09_CUSTOMERS.
    DATA lv_customerid_counter_n TYPE n LENGTH 6 VALUE '000000'.
    DATA lv_customerid_counter_i TYPE i VALUE 1.

    DELETE FROM ZCS09_CUSTOMERS.

    LOOP AT gt_export_sorted_final INTO gt_export_sorted_final_wa.

      lv_customerid_counter_n = lv_customerid_counter_i.
      ZCS09_CUSTOMERS_WA-customerid = lv_customerid_counter_n.

      ZCS09_CUSTOMERS_WA-company = gt_export_sorted_final_wa-company.
      ZCS09_CUSTOMERS_WA-street = gt_export_sorted_final_wa-street.
      ZCS09_CUSTOMERS_WA-city = gt_export_sorted_final_wa-city.
      ZCS09_CUSTOMERS_WA-postcode = gt_export_sorted_final_wa-postcode.
      ZCS09_CUSTOMERS_WA-fax = gt_export_sorted_final_wa-fax.
      ZCS09_CUSTOMERS_WA-phone = gt_export_sorted_final_wa-phone.
      ZCS09_CUSTOMERS_WA-email = gt_export_sorted_final_wa-email.

      INSERT INTO ZCS09_CUSTOMERS VALUES @ZCS09_CUSTOMERS_WA.

      CLEAR ZCS09_CUSTOMERS_WA.
      lv_customerid_counter_i += 1 .

    ENDLOOP.





*** Output
*
*    out->write(   data = gt_import
*                  name = 'Interne Importtabelle' ).
*
*out->write( '-----------------------------------------------------------------------------------------------------' ).
*
    out->write(   data = gt_export
                  name = 'Interne Exporttabelle' ).


    out->write( '-----------------------------------------------------------------------------------------------------' ).



    out->write(   data = gt_export_sorted
                 name = 'Interne Sortierte Exporttabelle. Ohne Duplikate.' ).

out->write( '-----------------------------------------------------------------------------------------------------' ).

     out->write(   data = gt_export_sorted_final
                 name = 'Vorbereitetet Tabelle' ).



  ENDMETHOD.
ENDCLASS.
