class UserDTO {
  String uid;
  String? displayName;
  String? photoUrl;

  UserDTO({
    required this.uid,
    this.displayName,
    this.photoUrl,
  });
}