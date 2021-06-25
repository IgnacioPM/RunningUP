// To parse this JSON data, do
//
//     final estadisticas = estadisticasFromJson(jsonString);

import 'dart:convert';

List<Estadisticas> estadisticasFromJson(String str) => List<Estadisticas>.from(json.decode(str).map((x) => Estadisticas.fromJson(x)));

String estadisticasToJson(List<Estadisticas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Estadisticas {
    Estadisticas({
        this.idtiempoReco,
        this.tiempo,
        this.fecha,
        this.recorridoIdrecorrido,
        this.userIduser,
        this.userName,
    });

    String idtiempoReco;
    String tiempo;
    DateTime fecha;
    String recorridoIdrecorrido;
    String userIduser;
    String userName;

    factory Estadisticas.fromJson(Map<String, dynamic> json) => Estadisticas(
        idtiempoReco: json["idtiempo_reco"],
        tiempo: json["tiempo"],
        fecha: DateTime.parse(json["Fecha"]),
        recorridoIdrecorrido: json["recorrido_idrecorrido"],
        userIduser: json["user_iduser"],
        userName: json["user_name"],
    );

    Map<String, dynamic> toJson() => {
        "idtiempo_reco": idtiempoReco,
        "tiempo": tiempo,
        "Fecha": fecha.toIso8601String(),
        "recorrido_idrecorrido": recorridoIdrecorrido,
        "user_iduser": userIduser,
        "user_name": userName,
    };
}
