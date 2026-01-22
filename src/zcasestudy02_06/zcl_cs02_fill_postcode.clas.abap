CLASS zcl_cs02_fill_postcode DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: lt_tab TYPE TABLE OF zcs02_postcode,
          ls_tab TYPE zcs02_postcode.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs02_fill_postcode IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    ls_tab = VALUE #( postcode = '22041' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22043' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22045' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22047' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22049' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22081' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22083' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22089' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22111' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22113' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22117' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22119' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22143' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22145' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22149' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22177' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22159' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22175' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22179' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22297' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22299' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22301' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22303' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22305' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22309' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22335' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22337' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22339' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22395' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22391' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22397' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22359' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22393' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22417' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22399' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22415' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22419' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22457' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22459' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22453' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22523' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22525' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22529' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22549' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22547' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22767' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22589' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22765' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22761' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22763' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22607' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22769' city = 'Hamburg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22844' city = 'Norderstedt' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22846' city = 'Norderstedt' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22851' city = 'Norderstedt' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22850' city = 'Norderstedt' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22848' city = 'Norderstedt' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22869' city = 'Schenefeld' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22885' city = 'Barsbüttel' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22927' city = 'Großhansdorf' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22929' city = 'Schönberg' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22949' city = 'Ammersbek' ).
*    APPEND ls_tab TO lt_tab.
*    ls_tab = VALUE #( postcode = '22956' city = 'Grönwohld' ).
    APPEND ls_tab TO lt_tab.
    ls_tab = VALUE #( postcode = '22946' city = 'Trittau' ).
    APPEND ls_tab TO lt_tab.
    ls_tab = VALUE #( postcode = '22880' city = 'Wedel' ).
    APPEND ls_tab TO lt_tab.
    ls_tab = VALUE #( postcode = '22926' city = 'Ahrensburg' ).
    APPEND ls_tab TO lt_tab.
    ls_tab = VALUE #( postcode = '22941' city = 'Bargteheide' ).
    APPEND ls_tab TO lt_tab.

    out->write( lt_tab ).
    INSERT zcs02_postcode FROM TABLE @lt_tab.

  ENDMETHOD.
ENDCLASS.
