CLASS zcl_02_09_cs_import_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_import_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  "Grundlagen Datenverarbitung mit Datenbanktabellen in der ABAP Cloud Sprache


*** Definition

    " Also grundsätzlich bräuchten:
        " Zwei Tabellen. Eine für import und eine für export
        " Zwei Arbeitsbereiche für importtabelle und eine für export Tabelle

    DATA: gt_import TYPE TABLE OF ztl_02_09_cs,         "Tabelle für import
          gt_export TYPE TABLE OF ztl_02_09_cs_out,     "Tabelle für export
          wa_import TYPE ztl_02_09_cs,                  "Tabellenzeile/Arbeitsbereih für import
          wa_export TYPE ztl_02_09_cs_out.              "Tabellenzeile/Arbeitsbereih für export





*** Declaration








*** Processing

    "1. Daten aus einer Quelll DATENBANKTABELLE in einer INTERNEN Tabelle kopieren
    SELECT * FROM ztl_02_09_cs INTO TABLE @gt_import.

    "2. a. Datensätze der Import Tabelle pro zeile im Arbeitsbereich lesen
    "   b. Zeile Bearbeiten
    "   c. Zeile im Export Tabelle speichern
    "   d. Export Tabelle in die Datenbanktabelle schreiben
    LOOP AT gt_import INTO wa_import.

        CLEAR wa_export.
        wa_export-import            = to_upper( wa_import-import ).
        wa_export-client            = to_lower( wa_import-client ). "systemfeld
*        wa_export-uuid              = wa_import-uuid.              "systemfeld
*        wa_export-last_changed_at   = wa_import-last_changed_at.   "systemfeld

        APPEND wa_export TO gt_export.

    ENDLOOP.

"    INSERT ztl_02_09_cs_out FROM TABLE @gt_export.





*** Output

    out->write( gt_import ).
    out->write( gt_export ).


  ENDMETHOD.
ENDCLASS.
