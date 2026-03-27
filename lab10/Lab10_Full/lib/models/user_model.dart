class UserModel {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String image;
  final String accessToken;
  final String loginType; // 'api' or 'google'

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.accessToken,
    this.loginType = 'api',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      image: json['image'] ?? '',
      accessToken: json['accessToken'] ?? '',
      loginType: 'api',
    );
  }

  factory UserModel.fromFirebase(dynamic user) {
    return UserModel(
      id: 0,
      username: user.email?.split('@')[0] ?? 'google_user',
      email: user.email ?? '',
      firstName: user.displayName?.split(' ')[0] ?? '',
      lastName: user.displayName?.split(' ').skip(1).join(' ') ?? '',
      image: user.photoURL ?? '',
      accessToken: 'firebase_token',
      loginType: 'google',
    );
  }

  String get fullName => '$firstName $lastName'.trim().isEmpty ? username : '$firstName $lastName';
}
