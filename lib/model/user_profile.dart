class UserProfile {
  final String id;
  final String username;
  final String email;

  UserProfile({required this.id, required this.username, required this.email});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }
}
