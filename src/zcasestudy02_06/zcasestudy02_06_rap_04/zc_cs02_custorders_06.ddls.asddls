@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection-View für ZR_CS02_CUSTORDERS_06'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_CS02_CUSTORDERS_06 as projection on ZR_CS02_CUSTORDERS_06 as _Order
{
    key Orderid,
    Customerid,
    OrderDate,
    @Semantics.amount.currencyCode: 'Currency'
    OrderTotal,
    Discount,
    Info,
    Status,
    Currency,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Customer : redirected to parent ZC_CS02_CUSTOMERS_06_MS
}
