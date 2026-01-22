@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help für die Sprache'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCS02_LANGUAGE_VAL_HLP as select from I_LanguageText
{
    @Consumption.valueHelpDefault.display: false
    key Language,
    @Consumption.valueHelpDefault.display: true
    key LanguageCode,
    @Consumption.valueHelpDefault.display: true
    LanguageName,
    /* Associations */
    _Language,
    _LanguageCode
}
where Language = $session.system_language
