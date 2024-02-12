/// id : "ephkey_1Oir5yK8qLiqn108rAebIGRv"
/// object : "ephemeral_key"
/// associated_objects : [{"id":"cus_PXnf7k5r0aLWG4","type":"customer"}]
/// created : 1707711978
/// expires : 1707715578
/// livemode : false
/// secret : "ek_test_YWNjdF8xT2gyWmNLOHFMaXFuMTA4LGQ5SFN0Z2x5M1JQM2p4ZWFHV3BhWE44YmthNjNxQVY_00d2ZZT3SB"

class EphemeralKeyModel {
  EphemeralKeyModel({
      String? id, 
      String? object, 
      List<AssociatedObjects>? associatedObjects, 
      num? created, 
      num? expires, 
      bool? livemode, 
      String? secret,}){
    _id = id;
    _object = object;
    _associatedObjects = associatedObjects;
    _created = created;
    _expires = expires;
    _livemode = livemode;
    _secret = secret;
}

  EphemeralKeyModel.fromJson(dynamic json) {
    _id = json['id'];
    _object = json['object'];
    if (json['associated_objects'] != null) {
      _associatedObjects = [];
      json['associated_objects'].forEach((v) {
        _associatedObjects?.add(AssociatedObjects.fromJson(v));
      });
    }
    _created = json['created'];
    _expires = json['expires'];
    _livemode = json['livemode'];
    _secret = json['secret'];
  }
  String? _id;
  String? _object;
  List<AssociatedObjects>? _associatedObjects;
  num? _created;
  num? _expires;
  bool? _livemode;
  String? _secret;
EphemeralKeyModel copyWith({  String? id,
  String? object,
  List<AssociatedObjects>? associatedObjects,
  num? created,
  num? expires,
  bool? livemode,
  String? secret,
}) => EphemeralKeyModel(  id: id ?? _id,
  object: object ?? _object,
  associatedObjects: associatedObjects ?? _associatedObjects,
  created: created ?? _created,
  expires: expires ?? _expires,
  livemode: livemode ?? _livemode,
  secret: secret ?? _secret,
);
  String? get id => _id;
  String? get object => _object;
  List<AssociatedObjects>? get associatedObjects => _associatedObjects;
  num? get created => _created;
  num? get expires => _expires;
  bool? get livemode => _livemode;
  String? get secret => _secret;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['object'] = _object;
    if (_associatedObjects != null) {
      map['associated_objects'] = _associatedObjects?.map((v) => v.toJson()).toList();
    }
    map['created'] = _created;
    map['expires'] = _expires;
    map['livemode'] = _livemode;
    map['secret'] = _secret;
    return map;
  }

}

/// id : "cus_PXnf7k5r0aLWG4"
/// type : "customer"

class AssociatedObjects {
  AssociatedObjects({
      String? id, 
      String? type,}){
    _id = id;
    _type = type;
}

  AssociatedObjects.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
  }
  String? _id;
  String? _type;
AssociatedObjects copyWith({  String? id,
  String? type,
}) => AssociatedObjects(  id: id ?? _id,
  type: type ?? _type,
);
  String? get id => _id;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    return map;
  }

}