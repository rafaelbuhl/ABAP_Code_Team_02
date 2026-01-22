INTERFACE zif_cs02_import_statistics
  PUBLIC.

*** DIES IST ENTSCHEIDEND: Markiert das Interface als BAdI-fähig
**********************************************************************
  INTERFACES if_badi_interface.

*** Definition der Methode für die Statistik
**********************************************************************
  METHODS:
    counter
      IMPORTING iv_count TYPE i,
    import_data
      IMPORTING
        is_raw        TYPE zcl_cs02_daten_import_07=>zt07_import_split
        is_customer   TYPE zcs02_customers
        io_error      TYPE REF TO zcx_cs02_import_error
        iv_customerid TYPE zcustomerid02
      CHANGING
        cs_result     TYPE zcs02_customers.

ENDINTERFACE.
