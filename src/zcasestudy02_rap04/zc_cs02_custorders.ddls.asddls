@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCS02_CUSTORDERS'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS02_CUSTORDERS
  provider contract transactional_query
  as projection on ZR_CS02_CUSTORDERS
  association [1..1] to ZR_CS02_CUSTORDERS as _BaseEntity on $projection.Orderid = _BaseEntity.Orderid
{
  key Orderid,
      Customerid,
      OrderDate,
      @Semantics: {
        amount.currencyCode: 'Currency'
      }
      OrderTotal,
      Discount,
      Info,
      @ObjectModel.text.element: [ 'Description' ]
      @EndUserText.label: 'Status'
      @Consumption.valueHelpDefinition: [{
        entity.name: 'ZCS02_C_STATUS_VALUE_HELP',
        entity.element: 'Status'        
      }]
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
