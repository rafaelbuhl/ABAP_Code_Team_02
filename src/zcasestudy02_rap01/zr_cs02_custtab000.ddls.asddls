@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZCS02_CUSTTAB'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_CS02_CUSTTAB000
  as select from zcs02_custtab
{
  key uuid as UUID,
  name as Name,
  default_value as DefaultValue,
  @UI.selectionField: [{ position: 20 }]
  active as Active,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
