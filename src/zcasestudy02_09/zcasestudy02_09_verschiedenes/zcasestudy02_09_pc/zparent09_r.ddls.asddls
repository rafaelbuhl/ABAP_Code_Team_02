@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for r_zcs09_zparent Table'
@Metadata.ignorePropagatedAnnotations: true
define view entity zparent09_r as select from zcs09_zparent
{
    key id as Id,
    name as Name,
    last_name as LastName
  
}
