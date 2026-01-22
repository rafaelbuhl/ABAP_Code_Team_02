@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCS02_CUSTOMERS'
}

@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS02_CUSTOMERS
  provider contract transactional_query
  as projection on ZR_CS02_CUSTOMERS
  association [1..1] to ZR_CS02_CUSTOMERS as _BaseEntity on $projection.Customerid = _BaseEntity.Customerid
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
  @Semantics: {
    amount.currencyCode: 'Currency'
  }
  SalesVolume,
  @Semantics: {
    amount.currencyCode: 'CurrencyTarget'
  }
  SalesVolumeTarget,
  ChangeRateDate,
//  @ObjectModel.readOnly: true
//  @ObjectModel.virtualElement
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CS02_SUM_ORDERS'
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
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
  Currency,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
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
  _BaseEntity
}
