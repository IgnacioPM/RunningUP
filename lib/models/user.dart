// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

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
        this.pesoKilos,
        this.alturaCentimetros,
        this.sexo,
    });

    String iduser;
    String email;
    String password;
    String name;
    String ap1;
    String ap2;
    String pesoKilos;
    String alturaCentimetros;
    String sexo;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        iduser: json["iduser"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        ap1: json["ap1"],
        ap2: json["ap2"],
        pesoKilos: json["Peso_Kilos"],
        alturaCentimetros: json["Altura_Centimetros"],
        sexo: json["Sexo"],
    );

    Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "email": email,
        "password": password,
        "name": name,
        "ap1": ap1,
        "ap2": ap2,
        "Peso_Kilos": pesoKilos,
        "Altura_Centimetros": alturaCentimetros,
        "Sexo": sexo,
    };
}
