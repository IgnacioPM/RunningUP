// To parse this JSON data, do
//
//     final compas = compasFromJson(jsonString);

import 'dart:convert';

List<Compas> compasFromJson(String str) => List<Compas>.from(json.decode(str).map((x) => Compas.fromJson(x)));

String compasToJson(List<Compas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Compas {
    Compas({
        this.idcompas,
        this.nombre,
        this.apellidoPaterno,
        this.apellidoMaterno,
        this.emailC,
    });

    String idcompas;
    String nombre;
    String apellidoPaterno;
    String apellidoMaterno;
    String emailC;

    factory Compas.fromJson(Map<String, dynamic> json) => Compas(
        idcompas: json["idcompas"],
        nombre: json["Nombre"],
        apellidoPaterno: json["Apellido_Paterno"],
        apellidoMaterno: json["Apellido_Materno"],
        emailC: json["email_c"],
    );

    Map<String, dynamic> toJson() => {
        "idcompas": idcompas,
        "Nombre": nombre,
        "Apellido_Paterno": apellidoPaterno,
        "Apellido_Materno": apellidoMaterno,
        "email_c": emailC,
    };
}
