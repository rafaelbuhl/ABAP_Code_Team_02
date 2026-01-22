CLASS zcx_cs02_import_error DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    DATA field_name TYPE string READ-ONLY.
    DATA field_value TYPE string READ-ONLY.

    CONSTANTS:
      BEGIN OF value_too_long,
        msgid TYPE symsgid VALUE 'ZMESSAGE02',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'field_name',
        attr2 TYPE scx_attrname VALUE 'field_value',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF value_too_long,
      BEGIN OF email_not_valid,
        msgid TYPE symsgid VALUE 'ZMESSAGE02',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'field_value',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF email_not_valid,
      BEGIN OF phone_not_valid,
        msgid TYPE symsgid VALUE 'ZMESSAGE02',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'field_value',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF phone_not_valid.

    METHODS constructor
      IMPORTING
        !textid        LIKE if_t100_message=>t100key OPTIONAL
        !previous      LIKE previous OPTIONAL
        iv_field_name  LIKE field_name OPTIONAL
        iv_field_value LIKE field_value OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_cs02_import_error IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor(
    previous = previous
    ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    IF iv_field_name IS NOT INITIAL.
      me->field_name = iv_field_name.
    ENDIF.

    IF iv_field_value IS NOT INITIAL.
      field_value = iv_field_value.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
