@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection-View für ZR_CS02_CUSTOMERS_M'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CS02_CUSTOMERS_M
provider contract transactional_query
 as projection on ZR_CS02_CUSTOMERS_M 
 association [1..1] to ZR_CS02_CUSTOMERS_M as _Customer on $projection.Customerid = _Customer.Customerid
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
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CS02_SUM_ORDERS_MS'
    @EndUserText.label: 'Anzahl der Bestellungen'
    virtual OrderCount : abap.int4,
    Fax,
    Phone,
    Email,
     @UI.lineItem: [ {
    position: 180 ,
    label: 'Link zu Details',
    type: #WITH_URL, 
    url: 'Url' 
  } ]
    Url,
    Currency,
    CurrencyTarget,
    Language,
    Weblogin,
    Webpw,
    Memo,
    @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
    LastChangedAt,
    _Customer,
//    Zzvip,
    /* Associations */
    _Order : redirected to composition child ZC_CS02_CUSTORDERS_S
}
