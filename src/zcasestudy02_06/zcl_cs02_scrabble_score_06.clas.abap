CLASS zcl_cs02_scrabble_score_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cs02_scrabble_score_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  data: input type string VALUE 'cabbage',
        result type i value 0.

  input = to_upper( input ).

  data(input_length) = strlen( input ).

  DO input_length TIMES.
  DATA(count_index) = sy-index - 1.

  DATA(buchstabe) = substring( val = input off = count_index len = 1 ).
  CASE buchstabe.
  WHEN 'A' or 'E' or 'I' or 'O' or 'U' or 'L' or 'N' or 'R' or 'S' or 'T'.
  result += 1.
  WHEN 'D' or 'G'.
  result += 2.
  WHEN 'B' or 'C' or 'M' or 'P'.
  result += 3.
  WHEN 'F' or 'H' or 'V' or 'W' or 'Y'.
  result += 4.
  WHEN 'K'.
  result += 5.
  WHEN 'J' or 'X'.
  result += 8.
  WHEN 'Q' or 'Z'.
  result += 10.
  ENDCASE.
  ENDDO.


  out->write( result  ).



  ENDMETHOD.
ENDCLASS.
