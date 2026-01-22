@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for default value keys'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZR_CS02_CUSTTAB_VALUE_HELP
  as select from    DDCDS_CUSTOMER_DOMAIN_VALUE(
                      p_domain_name : 'ZDKEY_NAME2') as Values
    left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                      p_domain_name : 'ZDKEY_NAME2') as Texts on  Texts.domain_name    = Values.domain_name
                                                             and Texts.value_position = Values.value_position
                                                             and Texts.language       = $session.system_language
{
      //      @ObjectModel.text.element: [ 'Description' ]
      //      @UI.textArrangement: #TEXT_ONLY
  key Values.value_low as FieldName,

      //      @UI.hidden: true
      Texts.text       as Description
}
