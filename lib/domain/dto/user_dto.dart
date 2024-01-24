class UserDTO {
  String id;
  String uid;
  String email;
  String? displayName;
  String? photoUrl;

  UserDTO({
    required this.id,
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
  });
}