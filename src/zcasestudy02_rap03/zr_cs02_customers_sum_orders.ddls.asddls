@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View für Anzahl der Bestellungen'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_CS02_CUSTOMERS_SUM_ORDERS
with parameters 
    p_customerid: zcustomerid02
//    p_status: zstatus02


  as select from    zcs02_custorders
    
{
      
      @UI.lineItem: [{ position: 30, label: 'Anzahl der Bestellungen' }]
      @EndUserText.label: 'Anzahl der Bestellungen'
      count( * ) as OrderCount
    
     
}
where customerid=$parameters.p_customerid and status<> 'ST'



