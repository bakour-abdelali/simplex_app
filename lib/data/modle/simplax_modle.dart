// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:simplex_app/data/modle/pive_modle.dart';

class SimplaxModle {
  List<double> factionObjactive;
  List<List<double>> matriex;
  List<List<double>> variableArtfsial;
  List<double> contrante;
  PiveModle? pivo;

  SimplaxModle(
      {required this.factionObjactive,
      required this.matriex,
      required this.variableArtfsial,
      required this.contrante,
      this.pivo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'factionObjactive': factionObjactive,
      'matriex': matriex,
      'variableArtfsial': variableArtfsial,
      'contrante': contrante,
      'pivo': pivo,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SimplaxModle(factionObjactive: $factionObjactive, matriex: $matriex, variableArtfsial: $variableArtfsial, contrante: $contrante, pivo:()';
  }

  @override
  bool operator ==(covariant SimplaxModle other) {
    if (identical(this, other)) return true;

    return listEquals(other.factionObjactive, factionObjactive) &&
        listEquals(other.matriex, matriex) &&
        listEquals(other.variableArtfsial, variableArtfsial) &&
        listEquals(other.contrante, contrante) &&
        other.pivo == pivo;
  }

  @override
  int get hashCode {
    return factionObjactive.hashCode ^
        matriex.hashCode ^
        variableArtfsial.hashCode ^
        contrante.hashCode ^
        pivo.hashCode;
  }
}
