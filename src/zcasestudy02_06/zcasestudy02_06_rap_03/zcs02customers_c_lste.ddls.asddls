@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Liste der Umsätze pro Kunde'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCS02CUSTOMERS_C_LSTE
with parameters
p_customerid : zcustomerid02
 as select from ZCS02CUSTOMERS_R_test association [0..*] to ZR_CS02_CUSTORDERS as _Orders on $projection.Customerid = _Orders.Customerid
{
    key Customerid,
    Salutation,
    LastName,
    FirstName,
    Company,
    
    @Semantics.amount.currencyCode: 'Currency'
    SalesVolume,
    @Semantics.amount.currencyCode: 'CurrencyTarget'
    SalesVolumeTarget,
    ChangeRateDate,
    
    Currency,
    CurrencyTarget,
    
    _Orders.Orderid,

    
    _Orders
}
where Customerid = $parameters.p_customerid
