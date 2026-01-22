@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for zchild09 Table'
@Metadata.ignorePropagatedAnnotations: true
define view entity zchild09_R as select from zcs09_zchild association [0..1] to zparent09_r as _Child
    on $projection.Id = _Child.Id
{
    
    @EndUserText.quickInfo: 'Child ID'
    key child_id as ChildId,
    @EndUserText.quickInfo: 'Parent ID'
    key id as Id,
    description as Description,
    
    _Child
    
}

