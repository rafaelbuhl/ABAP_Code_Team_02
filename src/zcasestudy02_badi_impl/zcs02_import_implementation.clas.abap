CLASS zcs02_import_implementation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES zif_cs02_import_statistics .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcs02_import_implementation IMPLEMENTATION.


  METHOD zif_cs02_import_statistics~counter.
    DATA lv_protocoll TYPE zcs02_protocol.
    TRY.
        lv_protocoll-id = cl_system_uuid=>create_uuid_x16_static( ).
        lv_protocoll-text = |{ iv_count } entries have been changed.|.
        GET TIME STAMP FIELD lv_protocoll-created_at.
        INSERT INTO zcs02_protocol VALUES @lv_protocoll.
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
  ENDMETHOD.


  METHOD zif_cs02_import_statistics~import_data.
    SELECT SINGLE FROM zcs02_customers FIELDS * WHERE customerid = @iv_customerid INTO @cs_result.
    CONCATENATE 'BADI Implementation was called' cs_result-memo INTO cs_result-memo SEPARATED BY '; '.
  ENDMETHOD.
ENDCLASS.
