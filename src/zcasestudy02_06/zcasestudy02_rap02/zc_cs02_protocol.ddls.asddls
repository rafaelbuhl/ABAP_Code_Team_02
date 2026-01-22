@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZCS02_PROTOCOL'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS02_PROTOCOL
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_CS02_PROTOCOL
  association [1..1] to ZR_CS02_PROTOCOL as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Category,
  Text,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
