@Metadata.allowExtensions: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-View für Customer Orders'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zcs02cust_orders_r 
with parameters p_customerid : zcustomerid02
as select from zcs02_custorders
association [1..1] to ZCS02CUSTOMERS_R as _Customers
on $projection.Customerid = _Customers.Customerid
{
    key orderid as Orderid,
    customerid as Customerid,
    order_date as OrderDate,
    @Semantics.amount.currencyCode: 'Currency'
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
    _Customers
        
}

where customerid = $parameters.p_customerid
