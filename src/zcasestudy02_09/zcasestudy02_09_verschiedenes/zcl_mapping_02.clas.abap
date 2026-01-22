CLASS zcl_mapping_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mapping_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

" Definition von Zwei unterschiedliche Strukturen

    TYPES: BEGIN OF from_struc,
    company TYPE string,
    street TYPE string,
    postcode TYPE string,
    place TYPE string,
    medium TYPE string,
    value1 TYPE string,
    value2 TYPE string,
    END OF from_struc.


    TYPES: BEGIN OF to_struc,
    company TYPE string,
    street TYPE string,
    postcode TYPE string,
    place TYPE string,
    phone TYPE string,
    fax TYPE string,
    email TYPE string,
    memo TYPE string,
    END OF to_struc.

" Strukturvariabln definieren

    DATA source_struc TYPE from_struc.
    DATA goal_struc TYPE to_struc.

" Strukturvariabln befüllen
     source_struc-company = 'company01'.
     source_struc-street = 'street01'.
     source_struc-postcode = 'postcode01'.
     source_struc-place = 'place01'.
     source_struc-medium = 'medium01'.
     source_struc-value1 = 'value01'.
     source_struc-value2 = 'value02'.

     goal_struc-company = 'company02'.
     goal_struc-street = 'street02'.
     goal_struc-postcode = 'postcode02'.
     goal_struc-place = 'place02'.
     goal_struc-phone = 'phone02'.
     goal_struc-fax = 'fax01'.
     goal_struc-email = 'email01'.
     goal_struc-memo = 'memo01'.



" Ausgabe vor dem Mapping

    out->write(  name = 'source struc'
                data = source_struc ).

    out->write(  name = 'goal struc'
                data = goal_struc ).


    out->write( '-------------------------------------------------------------' ).

" Mapping
    goal_struc = CORRESPONDING #( source_struc MAPPING

                                    company = company
                                    street = street
                                    postcode = postcode
                                    place = place
                                    memo = medium
                                    ).


" Ausgabe nach dem Mapping

 out->write(    name = 'mapped goal struc'
                data = goal_struc ).



  ENDMETHOD.

ENDCLASS.
