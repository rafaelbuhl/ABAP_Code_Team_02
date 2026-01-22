CLASS zcl_02_09_cs_pc_data_c DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_09_cs_pc_data_c IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Dieses Programm beffüllt die Datenbanktabelle zcs09_zchild mit entsprechenden Daten.

    "Werkzeuge: Eine interne Tabelle vom Type der Datenbanktabelle zcs09_zchild
    "           Eine Struktur für das füllen der internen Tabelle
    DATA:   lt_child TYPE TABLE OF zcs09_zchild,
            ls_child LIKE LINE OF lt_child.

    "Daten für den ersten Datensatz
    ls_child-child_id = '01'.
    ls_child-id = '01'.
    ls_child-description = 'Kind 1'.
    "Hinzufügen der ersten Datensatz in der internen Tabelle
    APPEND ls_child TO lt_child.

    "Daten für den zweiten Datensatz
    ls_child-child_id = '02'.
    ls_child-id = '01'.
    ls_child-description = 'Kind 2'.
    "Hinzufügen der ersten Datensatz in der internen Tabelle
    APPEND ls_child TO lt_child.

    "Daten für den zweiten Datensatz
    ls_child-child_id = '03'.
    ls_child-id = '02'.
    ls_child-description = 'Kind 3'.
    "Hinzufügen der ersten Datensatz in der internen Tabelle
    APPEND ls_child TO lt_child.

    "Daten für den zweiten Datensatz
    ls_child-child_id = '04'.
    ls_child-id = '03'.
    ls_child-description = 'Kind 4'.
    "Hinzufügen der ersten Datensatz in der internen Tabelle
    APPEND ls_child TO lt_child.


    "Sicherstellung das die Datenbanktabelle leer ist.
    DELETE FROM zcs09_zchild.

    "Die Datenbanktabelle befüllen von der internen Tabelle
    INSERT zcs09_zchild FROM TABLE @lt_child.

    IF sy-subrc = 0.
        out->write( 'Die Datenbanktabelle zcs09_zchild wurde erfolgreich befüllt!' ).
    ELSE.
        out->write( 'ACHTUNG: Die Datenbanktabelle zcs09_zchild konnte nicht befüllt! werden!' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
