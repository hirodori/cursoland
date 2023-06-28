class LocalUser {
  final String imagePath;
  final String name;
  final String email;

  const LocalUser({
    required this.imagePath,
    required this.name,
    required this.email,
  });

  LocalUser copy({
    String? imagePath,
    String? name,
    String? email,
  }) =>
      LocalUser(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  static LocalUser fromJson(Map<String, dynamic> json) => LocalUser(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
      };
}
