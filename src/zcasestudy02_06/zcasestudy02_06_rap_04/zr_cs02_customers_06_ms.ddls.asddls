@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View für Customers Master Slave'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZR_CS02_CUSTOMERS_06_MS as select from zcs02_customers
composition [0..*] of ZR_CS02_CUSTORDERS_06 as _Order
{
    key customerid as Customerid,
    salutation as Salutation,
    last_name as LastName,
    first_name as FirstName,
    company as Company,
    street as Street,
    city as City,
    country as Country,
    postcode as Postcode,
    acc_lock as AccLock,
    last_date as LastDate,
    @Semantics.amount.currencyCode: 'Currency'
    sales_volume as SalesVolume,
    @Semantics.amount.currencyCode: 'CurrencyTarget'
    sales_volume_target as SalesVolumeTarget,
    change_rate_date as ChangeRateDate,
    fax as Fax,
    phone as Phone,
    email as Email,
    url as Url,
    currency as Currency,
    currency_target as CurrencyTarget,
    language as Language,
    weblogin as Weblogin,
    webpw as Webpw,
    memo as Memo,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
//    zzvip as Zzvip,
    _Order // Make association public
}
