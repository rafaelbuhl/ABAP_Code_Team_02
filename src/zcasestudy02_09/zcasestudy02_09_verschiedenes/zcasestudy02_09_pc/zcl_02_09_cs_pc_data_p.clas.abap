CLASS zcl_02_09_cs_pc_data_p DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_pc_data_p IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Dieses Programm beffüllt die Datenbanktabelle zcs09_zparent mit entsprechenden Daten.

    "Werkzeuge: Eine interne Tabelle vom Type der Datenbanktabelle zcs09_zparent
    "           Eine Struktur für das füllen der internen Tabelle
    DATA:   lt_parent TYPE TABLE OF zcs09_zparent,
            ls_parent LIKE LINE OF lt_parent.

    "Daten für den ersten Datensatz
    ls_parent-id = '01'.
    ls_parent-name = 'Vorname 1'.
    ls_parent-last_name = 'Nachname 1'.
    "Hinzufügen der ersten Datensatz in der internen Tabelle
    APPEND ls_parent TO lt_parent.

    "Daten für den zweiten Datensatz
    ls_parent-id = '02'.
    ls_parent-name = 'Vorname 2'.
    ls_parent-last_name = 'Nachname 2'.
    "Hinzufügen der ersten Datensatz in der internen Tabelle
    APPEND ls_parent TO lt_parent.

    "Daten für den zweiten Datensatz
    ls_parent-id = '03'.
    ls_parent-name = 'Vorname 3'.
    ls_parent-last_name = 'Nachname 3'.
    "Hinzufügen der ersten Datensatz in der internen Tabelle
    APPEND ls_parent TO lt_parent.

    "Daten für den zweiten Datensatz
    ls_parent-id = '04'.
    ls_parent-name = 'Vorname 4'.
    ls_parent-last_name = 'Nachname 4'.
    "Hinzufügen der ersten Datensatz in der internen Tabelle
    APPEND ls_parent TO lt_parent.

    "Sicherstellung das die Datenbanktabelle leer ist.
    DELETE FROM zcs09_zparent.

    "Die Datenbanktabelle befüllen von der internen Tabelle
    INSERT zcs09_zparent FROM TABLE @lt_parent.

    IF sy-subrc = 0.
        out->write( 'Die Datenbanktabelle zcs09_zparent wurde erfolgreich befüllt!' ).
    ELSE.
        out->write( 'ACHTUNG: Die Datenbanktabelle zcs09_zparent konnte nicht befüllt! werden!' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
