CLASS zcl_02_09_cs_import_27 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_27 IMPLEMENTATION.


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


    "Schritt 1: Daten Lesen. Daten aus der Datenbank Tabelle ZTL_02_09_CS in einer internen Tabelle lesen
    "Werkzeuge: eine interne Tabelle (standard, nicht sortiert) mit ein Arbeitsbereich (nicht sortiert)
    DATA lt_import TYPE TABLE OF char256.
    DATA lt_import_wa TYPE char256.

    "Logik: Daten lesen aus einer DB-Tabelle ztl_02_09_cs
    SELECT
    FROM ztl_02_09_cs "Datenbanktabellenname innerhalb von ABAP SQL -> klein geschrieben
    FIELDS import
    INTO TABLE @lt_import.


    "Schritt 2: Daten schneiden, bereinigen und für weitere Verarbeitung bereitstellen
    "Werkzeuge: Struktur für die Zieltabelle und ein Arbeitsbereich
    TYPES: BEGIN OF ltt_split,
                 company  TYPE zcompany09,
                 street   TYPE zstreet09,
                 postcode TYPE zpostcode09,
                 city     TYPE zcity09,
                 medium   TYPE zmemo09,
                 val1     TYPE zmemo09,
                 val2     TYPE zmemo09,
               END OF ltt_split.


    DATA lt_splitted TYPE TABLE OF ltt_split.
    DATA lt_splitted_wa TYPE ltt_split.



    "Daten schneiden, bereinigen und bereitstellen
    LOOP AT lt_import INTO lt_import_wa.

        "Schneiden
        SPLIT lt_import_wa AT ';' INTO
            lt_splitted_wa-company
            lt_splitted_wa-street
            lt_splitted_wa-postcode
            lt_splitted_wa-city
            lt_splitted_wa-medium
            lt_splitted_wa-val1
            lt_splitted_wa-val2.

        "Bereinigen
        REPLACE ALL OCCURRENCES OF '"' IN lt_splitted_wa-company  WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN lt_splitted_wa-street   WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN lt_splitted_wa-postcode WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN lt_splitted_wa-city     WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN lt_splitted_wa-medium   WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN lt_splitted_wa-val1     WITH ''.
        REPLACE ALL OCCURRENCES OF '"' IN lt_splitted_wa-val2     WITH ''.

        "Bereitstellen
        APPEND lt_splitted_wa TO lt_splitted.

    ENDLOOP.

*    out->write( '------------------Bis diese Stelle ist der Code korrekt, Anzahl der Datensätze ist richtig------------------' ).

    "Schritt 3: Mapping zwischen verschiedenen Felder: Medium wird auf email, telephon und fax verteilt
    "Werkzeuge: neue Tabelle vom TYP ZCS09_CUSTOMERS und ein Arbeitsbereich
    TYPES: BEGIN OF ltt_split_mapped,
                 company  TYPE zcompany09,
                 street   TYPE zstreet09,
                 city     TYPE zcity09,
                 postcode TYPE zpostcode09,
                 fax      TYPE zfax09,
                 phone    TYPE zphone09,
                 email    TYPE zemail09,
               END OF ltt_split_mapped.

    DATA lt_splitted_mapped TYPE TABLE OF ltt_split_mapped.
    DATA lt_splitted_mapped_wa TYPE ltt_split_mapped.




    "Logik: Verteilung der inhalte von Medium auf fax, phone, email.
    "
    LOOP AT lt_splitted INTO lt_splitted_wa.


        "Identische Elemente
        lt_splitted_mapped_wa-company = lt_splitted_wa-company.
        lt_splitted_mapped_wa-street = lt_splitted_wa-street.
        lt_splitted_mapped_wa-city = lt_splitted_wa-city.
        lt_splitted_mapped_wa-postcode = lt_splitted_wa-postcode.

        "Unterschiedliche Elemente
        " Wenn das Feld Medium Telefax enthählt, dann sind die Werte von val1 & val2 eine Faxnummer
        IF lt_splitted_wa-medium = 'Telefax'.
            lt_splitted_mapped_wa-fax = lt_splitted_wa-val1 && lt_splitted_wa-val2.

        " Wenn das Feld Medium Email enthählt, dann ist der Wert von val1 eine emailadresse
        ELSEIF lt_splitted_wa-medium = 'Email'.
             lt_splitted_mapped_wa-email = lt_splitted_wa-val1.

        " Wenn das Feld Medium D1Fu oder Q enthält, dann ist der Wert von val1 & val2 eine Telefonnummer
        ELSEIF lt_splitted_wa-medium = 'D1Fu'
            OR lt_splitted_wa-medium = 'Q'.
             lt_splitted_mapped_wa-phone =  lt_splitted_wa-val1 && lt_splitted_wa-val2.

        ELSE.
        " Wenn das Feld Medium andere Werte enthält oder leer ist, dann ist der Wert von val1 & val2 auch eine Telefonnummer
            lt_splitted_mapped_wa-phone = lt_splitted_wa-val1 &&  lt_splitted_wa-val2.

        ENDIF.

        INSERT lt_splitted_mapped_wa INTO TABLE lt_splitted_mapped.

        CLEAR lt_splitted_mapped_wa.

    ENDLOOP.

*out->write( '------------------Bis diese Stelle ist der Code korrekt, Anzahl der Datensätze ist richtig------------------' ).


*    "Logik: Entfernung von Duplikate
     DATA lt_sorted TYPE TABLE OF ltt_split_mapped.
     lt_sorted = lt_splitted_mapped.

     " Sortieren der Datensätze nach Firma, straße, Stadt und Postleitzahl
     SORT lt_sorted BY company street city postcode.
     out->write( lt_sorted ).
      out->write( 'Wie ist der code und die entsprechende Datensätze?' ).
*     out->write( '------------------Bis diese Stelle ist der Code korrekt, Anzahl der Datensätze ist richtig------------------' ).
*    DELETE ADJACENT DUPLICATES FROM lt_splitted_mapped COMPARING street city postcode.
*
*





*
***    "Schritt 2/3: Duplikate entfernen indem die daten in einer sortierten Tabelle reingeschrieben werden
***    "Werkzeuge: Interne Sortierte Tabelle und ein Arbeitsbereich
***     DATA lt_splitted_sorted TYPE SORTED TABLE OF ltt_split
***            WITH UNIQUE KEY company street postcode city medium val1 val2.
***     DATA lt_splitted_sorted_wa LIKE LINE OF lt_splitted_sorted.
***
***    "Logik
***    LOOP AT lt_splitted into lt_splitted_wa.
***
****        CLEAR lt_splitted_sorted_wa.
***        lt_splitted_sorted_wa = lt_splitted_wa.
***        INSERT lt_splitted_sorted_wa INTO TABLE lt_splitted_sorted.
***
***    ENDLOOP.
**

*
*
*
*
*
*
*
*
*
*    "Schritt 3/3: Daten aus der internen Tabelle in die DB Tabelle 'ZCS09_CUSTOMERS' schreiben
*    "Werkzeuge: zähler für customerid (Schlüsselfeld in der DB-Tabelle)
*    DATA ZCS09_CUSTOMERS_WA TYPE ZCS09_CUSTOMERS.
*    DATA lv_customerid_counter_n TYPE n LENGTH 6 VALUE '000000'.
*    DATA lv_customerid_counter_i TYPE i VALUE 1.
*
*    DELETE FROM ZCS09_CUSTOMERS.
*
*    LOOP AT lt_splitted_mapped INTO lt_splitted_mapped_wa.
*
*      lv_customerid_counter_n = lv_customerid_counter_i.
*      ZCS09_CUSTOMERS_WA-customerid = lv_customerid_counter_n.
*
*      ZCS09_CUSTOMERS_WA-company = lt_splitted_mapped_wa-company.
*      ZCS09_CUSTOMERS_WA-street = lt_splitted_mapped_wa-street.
*      ZCS09_CUSTOMERS_WA-city = lt_splitted_mapped_wa-city.
*      ZCS09_CUSTOMERS_WA-postcode = lt_splitted_mapped_wa-postcode.
*      ZCS09_CUSTOMERS_WA-fax = lt_splitted_mapped_wa-fax.
*      ZCS09_CUSTOMERS_WA-phone = lt_splitted_mapped_wa-phone.
*      ZCS09_CUSTOMERS_WA-email = lt_splitted_mapped_wa-email.
*
*      INSERT INTO ZCS09_CUSTOMERS VALUES @ZCS09_CUSTOMERS_WA.
*
*      CLEAR ZCS09_CUSTOMERS_WA.
*      lv_customerid_counter_i += 1 .
*
*    ENDLOOP.





*** Output

*    out->write(   data = lt_import
*                  name = 'Interne Importtabelle' ).
*
*out->write( '-----------------------------------------------------------------------------------------------------' ).
*
*    out->write(   data = lt_splitted
*                  name = 'Interne Exporttabelle' ).
*
*
*    out->write( '-----------------------------------------------------------------------------------------------------' ).
*
*
*
*    out->write(   data = lt_splitted_sorted
*                 name = 'Interne Sortierte Exporttabelle. Ohne Duplikate.' ).
*
*out->write( '-----------------------------------------------------------------------------------------------------' ).
*
*     out->write(   data = lt_splitted_mapped
*                 name = 'Vorbereitetet Tabelle' ).



  ENDMETHOD.
ENDCLASS.
