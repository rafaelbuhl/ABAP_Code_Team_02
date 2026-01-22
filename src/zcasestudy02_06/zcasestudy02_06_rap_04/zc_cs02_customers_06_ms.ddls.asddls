@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection-View für ZR_CS02_CUSTOMERS_06_MS'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_CS02_CUSTOMERS_06_MS
provider contract transactional_query
 as projection on ZR_CS02_CUSTOMERS_06_MS as _Customer
{
    key Customerid,
    Salutation,
    LastName,
    FirstName,
    Company,
    Street,
    City,
    Country,
    Postcode,
    AccLock,
    LastDate,
    @Semantics.amount.currencyCode: 'Currency'
    SalesVolume,
    @Semantics.amount.currencyCode: 'CurrencyTarget'
    SalesVolumeTarget,
    ChangeRateDate,
    Fax,
    Phone,
    Email,
    Url,
    Currency,
    CurrencyTarget,
    Language,
    Weblogin,
    Webpw,
    Memo,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
//    Zzvip,
    /* Associations */
    _Order : redirected to composition child ZC_CS02_CUSTORDERS_06
}
