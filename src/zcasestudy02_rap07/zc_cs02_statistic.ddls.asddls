@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCS02_STATISTIC'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS02_STATISTIC
  provider contract transactional_query
  as projection on ZR_CS02_STATISTIC
  association [1..1] to ZR_CS02_STATISTIC as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  Name,
  InterfaceName,
  Type,
  IsActive,
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
