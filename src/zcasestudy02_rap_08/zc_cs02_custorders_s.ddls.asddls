@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection-View für ZR_CS02_CUSTORDERS'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_CS02_CUSTORDERS_S as projection on ZR_CS02_CUSTORDERS_S as _Order
{
    key Orderid,
    Customerid,
    OrderDate,
    @Semantics.amount.currencyCode: 'Currency'
    OrderTotal,
    Discount,
    Info,
    @ObjectModel.text.element: [ 'Description' ]
    @UI.textArrangement: #TEXT_ONLY
    Status,
    _Status.Description as Description,
      @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
    Currency,
    @Semantics.user.createdBy: true
    CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    CreatedAt,
    @Semantics.user.localInstanceLastChangedBy: true
    LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangedAt,
    /* Associations */
    _Customer : redirected to parent ZC_CS02_CUSTOMERS_M
}
