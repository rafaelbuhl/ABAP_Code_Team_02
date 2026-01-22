@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZTL02_09_CS'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TL02_09_CS
  provider contract transactional_query
  as projection on ZR_TL02_09_CS
  association [1..1] to ZR_TL02_09_CS as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  Import,
  @Semantics: {
    user.createdBy: true
  }
   @UI.hidden: true
  LocalCreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
   @UI.hidden: true
  LocalCreatedAt,
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
