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
        this.useriduser,

    });

    String idtiempoReco;
    String tiempo;
    String fecha;
    String recorridoIdrecorrido;
    String useriduser;


    factory Estadisticas.fromJson(Map<String, dynamic> json) => Estadisticas(
        idtiempoReco: json["idtiempo_reco"],
        tiempo: json["tiempo"],
        fecha: json["Fecha"],
        recorridoIdrecorrido: json["recorrido_idrecorrido"],
        useriduser: json["user_iduser"],

    );

    Map<String, dynamic> toJson() => {
        "idtiempo_reco": idtiempoReco,
        "tiempo": tiempo,
        "Fecha": fecha,
        "recorrido_idrecorrido": recorridoIdrecorrido,
        "user_iduser": useriduser,

    };
}
