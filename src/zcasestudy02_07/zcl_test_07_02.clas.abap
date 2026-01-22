CLASS zcl_test_07_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_07_02 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA new_row TYPE ztl_02_casestudy.

    TRY.
        new_row = VALUE #(
            uuid = cl_system_uuid=>create_uuid_x16_static( )
            import = '"Dijid GmbH #2";"Bramfelder Chaussee 261";"22177";"Hamburg";"";"040";"6417042"'
        ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.

    INSERT INTO ztl_02_casestudy VALUES @new_row.

  ENDMETHOD.

ENDCLASS.
