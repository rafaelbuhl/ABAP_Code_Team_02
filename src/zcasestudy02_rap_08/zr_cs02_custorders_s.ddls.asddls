@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View für Bestellungen'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZR_CS02_CUSTORDERS_S as select from zcs02_custorders
association to parent ZR_CS02_CUSTOMERS_M as _Customer on $projection.Customerid= _Customer.Customerid
association [1..1] to ZCS02_C_STATUS_VALUE_HELP as _Status on $projection.Status = _Status.Status
{
    key orderid as Orderid,
    customerid as Customerid,
    order_date as OrderDate,
    @Semantics.amount.currencyCode: 'currency'
    order_total as OrderTotal,
    discount as Discount,
    info as Info,
    status as Status,
          @Consumption.valueHelpDefinition: [ {
        entity.name: 'I_CurrencyStdVH',
        entity.element: 'Currency',
        useForValidation: true
      } ]
    currency as Currency,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    _Customer,
    _Status
}
