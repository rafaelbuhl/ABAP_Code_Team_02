@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help für Customer RAP'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCS02_COUNTRY_VAL_HLP as select from I_CountryText
{
    @Consumption.valueHelpDefault.display: true
    key Country,
    @Consumption.valueHelpDefault.display: false
    key Language,
    @Consumption.valueHelpDefault.display: true
    CountryName
}
where Language = $session.system_language
