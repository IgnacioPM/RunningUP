import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
    Users({
        this.iduser,
        this.email,
        this.password,
        this.name,
        this.ap1,
        this.ap2,
    });

    String iduser;
    String email;
    String password;
    String name;
    String ap1;
    String ap2;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        iduser: json["iduser"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        ap1: json["ap1"],
        ap2: json["ap2"],
    );

    Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "email": email,
        "password": password,
        "name": name,
        "ap1": ap1,
        "ap2": ap2,
    };
}
