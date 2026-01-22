@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View für Bestellungen'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZR_CS02_CUSTORDERS_06 as select from zcs02_custorders
association to parent ZR_CS02_CUSTOMERS_06_MS as _Customer on $projection.Customerid= _Customer.Customerid
{
    key orderid as Orderid,
    customerid as Customerid,
    order_date as OrderDate,
    @Semantics.amount.currencyCode: 'currency'
    order_total as OrderTotal,
    discount as Discount,
    info as Info,
    status as Status,
    currency as Currency,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    _Customer
}
