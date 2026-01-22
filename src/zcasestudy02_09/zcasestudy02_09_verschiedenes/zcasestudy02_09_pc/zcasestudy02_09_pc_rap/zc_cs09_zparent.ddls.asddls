@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCS09_ZPARENT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS09_ZPARENT
  provider contract transactional_query
  as projection on ZR_CS09_ZPARENT
  association [1..1] to ZR_CS09_ZPARENT as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Name,
  LastName,
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
