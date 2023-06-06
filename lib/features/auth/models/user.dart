class User {
  final String id;
  final String token;
  final String fullname;
  final String document;

  User({
    required this.id,
    required this.token,
    required this.fullname,
    required this.document,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['objectId'] as String,
      token: map['token'] as String,
      fullname: map['fullname'] as String,
      document: map['document'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'objectId': id,
      'sessionToken': token,
      'fullname': fullname,
      'document': document,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, token: $token, fullname: $fullname, document: $document)';
  }
}
