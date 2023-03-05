
class User {
  final String name;
  final String email;
  final String username;
  final String imageUrl;

  User({required this.name, required this.email, required this.username, required this.imageUrl});

  Map<String, dynamic> toJson() => <String, dynamic> {
    'name': name,
    'email': email,
    'username': username,
    'imageUrl': imageUrl,
  };

  static User fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    email: json['email'],
    username: json['username'],
    imageUrl: json['imageUrl'],
  );
}
