@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Max Umsatz pro Kunde'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCS02CUSTOMERS_C_MAX 
with parameters
p_currency_target : zcurrency_target02
 as select from ZCS02CUSTOMERS_R as a right outer join ZR_CS02_CUSTORDERS as c on a.Customerid = c.Customerid
{
    key a.Customerid,
    a.Salutation,
    a.LastName,
    a.FirstName,
    a.Company,
    a.Postcode,

    @Semantics.amount.currencyCode: 'CurrencyTarget'
    max(currency_conversion( amount => c.OrderTotal, 
                             source_currency => c.Currency, 
                             target_currency => $parameters.p_currency_target, 
                             exchange_rate_date => $session.system_date )) as MaximalumsatzTarget,

    $parameters.p_currency_target as CurrencyTarget 

}
group by a.Customerid,
    a.Salutation,
    a.LastName,
    a.FirstName,
    a.Company,
    a.Postcode
    
