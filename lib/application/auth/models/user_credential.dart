import 'dart:convert';

class UserCredential {
    final String refresh;
    final String access;
    final User user;

    UserCredential({
        required this.refresh,
        required this.access,
        required this.user,
    });

    // factory UserCredential.fromRawJson(String str) => UserCredential.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserCredential.fromJson(Map<String, dynamic> json) => UserCredential(
        refresh: json["refresh"],
        access: json["access"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "user": user.toJson(),
    };
}

class User {
    final int id;
    final String email;
    final String role;
    final String name;

    User({
        required this.id,
        required this.email,
        required this.role,
        required this.name,
    });

    // factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        role: json["role"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "role": role,
        "name": name,
    };
}
