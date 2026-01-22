@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customerid Value helper'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCS02_C_CUSTOMER_VALUE_HELP as select from ZR_CS02_CUSTOMERS
{
    key Customerid,
    Salutation,
    LastName,
    FirstName,
    Company,
    Street,
    City,
    Country,
    Postcode
//    AccLock,
//    LastDate,
//    SalesVolume,
//    SalesVolumeTarget,
//    ChangeRateDate,
//    Fax,
//    Phone,
//    Email,
//    Url,
//    Currency,
//    CurrencyTarget,
//    Language,
//    Weblogin,
//    Webpw,
//    Memo,
//    CreatedBy,
//    CreatedAt,
//    LocalLastChangedBy,
//    LocalLastChangedAt,
//    LastChangedAt
}
