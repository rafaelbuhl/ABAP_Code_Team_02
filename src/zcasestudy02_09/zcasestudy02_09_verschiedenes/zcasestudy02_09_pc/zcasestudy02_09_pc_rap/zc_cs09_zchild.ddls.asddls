@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCS09_ZCHILD'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS09_ZCHILD
  provider contract transactional_query
  as projection on ZR_CS09_ZCHILD
  association [1..1] to ZR_CS09_ZCHILD as _BaseEntity on $projection.ChildID = _BaseEntity.ChildID and $projection.ID = _BaseEntity.ID
{
  key ChildID,
  key ID,
  Description,
  @Semantics: {
    user.createdBy: true
  }
  @UI.hidden: true
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  @UI.hidden: true
  CreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  @UI.hidden: true
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
    @UI.hidden: true
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
    @UI.hidden: true
    LastChangedAt,
  _BaseEntity
}
