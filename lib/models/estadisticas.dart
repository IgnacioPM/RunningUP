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
    });

    String idtiempoReco;
    String tiempo;
    String fecha;
    String recorridoIdrecorrido;

    factory Estadisticas.fromJson(Map<String, dynamic> json) => Estadisticas(
        idtiempoReco: json["idtiempo_reco"],
        tiempo: json["tiempo"],
        fecha: json["Fecha"],
        recorridoIdrecorrido: json["recorrido_idrecorrido"],
    );

    Map<String, dynamic> toJson() => {
        "idtiempo_reco": idtiempoReco,
        "tiempo": tiempo,
        "Fecha": fecha,
        "recorrido_idrecorrido": recorridoIdrecorrido,
    };
}
