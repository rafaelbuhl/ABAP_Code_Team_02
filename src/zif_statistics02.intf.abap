"! Interface für die Auswertung der Bestellungen
INTERFACE zif_statistics02
  PUBLIC .

*  types:
*      zt_customers02 type table of zcustomerid02,
*      zt_stat_result type table of string.

  METHODS:
  "! Implementierung für die Berechnung des durchschnittlichen Umsatzes pro Bestellung/Kunde/Geschäftsjahr.
  "!
  "! @parameter i_customer      | Die eindeutige Kunden-ID, die zur Berechnung des durchschnittlichen Umsatzes verwendet wird.
  "! @parameter r_average_sales | Der berechnete durchschnittliche Umsatz pro Bestellung/Kunde/Geschäftsjahr.
    AverageSales
      IMPORTING
                i_customer             TYPE zcustomerid02
      RETURNING VALUE(r_average_sales) TYPE string,

  "! Implementierung zur Ermittlung des maximalen Umsatzes pro Kunde. Soll geschäftsjahrunabhängig berechnet werden.
  "!
  "! @parameter i_customer    | Die eindeutige Kunden-ID, die zur Ermittlung des maximalen Umsatzes verwendet wird.
  "! @parameter r_max_sales   | Der maximal erzielte Umsatz pro Kunde.
    MaxSales
      IMPORTING
                i_customer         TYPE zcustomerid02
      RETURNING VALUE(r_max_sales) TYPE string,
  "! Implementierung zur Berechnung des Tagesumsatzes. Soll kundenunabhängig berechnet werden.
  "!
  "! @parameter r_day_sales  | Der berechnete Tagesumsatz.
    DaySales
*      IMPORTING
*                i_customer         TYPE zcustomerid02
      RETURNING VALUE(r_day_sales) TYPE string.


ENDINTERFACE.
