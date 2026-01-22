@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Liste der Umsätze pro Kunde mit Association'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCS02CUSTOMER_C_LIST
  //  with parameters
  //    p_targetcurrency : zcurrency_target02,
  //    @Environment.systemField: #SYSTEM_DATE
  //    p_conversiondate : zchange_rate_date02
  as select from ZCS02CUSTOMERS_R
  association [0..*] to ZR_CS02_CUSTORDERS as _Orders on $projection.Customerid = _Orders.Customerid
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

      _Orders.Orderid,
      @Semantics.amount.currencyCode: 'Currency'
      _Orders.OrderTotal,
      //      @Semantics.amount.currencyCode: 'CurrencyTarget'
      //      currency_conversion( amount => _Orders.OrderTotal,
      //          source_currency => _Orders.Currency,
      //          target_currency => $parameters.p_targetcurrency,
      //          exchange_rate_date => $parameters.p_conversiondate )  as OrderTotal,
      _Orders.Currency,
      //      $parameters.p_targetcurrency                              as CurrencyTarget,
      //      @Semantics.amount.currencyCode: 'MaxOrderCurrency'
      //      max( currency_conversion( amount => _Orders.OrderTotal,
      //          source_currency => _Orders.Currency,
      //          target_currency => $parameters.p_targetcurrency,
      //          exchange_rate_date => $parameters.p_conversiondate )) as MaxOrder,
      //      $projection.CurrencyTarget                                as MaxOrderCurrency,
      _Orders

}
//group by
//  Customerid,
//  Salutation,
//  LastName,
//  FirstName,
//  Company,
//  Street,
//  City,
//  Country,
//  _Orders.Orderid,
//  _Orders.OrderTotal,
//  _Orders.Currency
