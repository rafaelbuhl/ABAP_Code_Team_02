@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help'
@ObjectModel.resultSet.sizeCategory: #XS
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCS02_C_STATUS_VALUE_HELP
  as select from    DDCDS_CUSTOMER_DOMAIN_VALUE(
                      p_domain_name : 'ZDSTATUS2') as Values
    left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                      p_domain_name : 'ZDSTATUS2') as Texts on  Texts.domain_name    = Values.domain_name
                                                             and Texts.value_position = Values.value_position
                                                             and Texts.language       = $session.system_language
{
//            @ObjectModel.text.element: [ 'Description' ]
            //@UI.textArrangement: #TEXT_ONLY
  key Values.value_low as Status,

      //      @UI.hidden: true
      @Semantics.text: true
      Texts.text       as Description
}
