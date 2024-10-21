import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplex_app/data/modle/simplax_modle.dart';

import '../../view/screen/resalte_screen.dart';
// simplex app

class MyHommeController extends GetxController {
  late TextEditingController numberEquations;
  late TextEditingController numberVariablReal;
  List<TextEditingController> factionObjactive = [];
  List<List<TextEditingController>> matriex = [];
  List<List<double>> variableArtfsial = [];
  List<TextEditingController> contrante = [];
  List<List<double>> createMatriex(SimplaxModle s) {
    List<List<double>> newMatriex = [];
    List<double> newFactionObjactiv = [];
    List<double> newContrant = [];
    List<List<double>> newVariablArtfatiol = [];

    newMatriex = s.matriex;
    newFactionObjactiv = s.factionObjactive;
    newContrant = s.contrante;
    newVariablArtfatiol = s.variableArtfsial;

    for (int i = 0; i < newVariablArtfatiol.length; i++) {
      newMatriex[i].addAll(newVariablArtfatiol[i]);
    }
    for (int i = 0; i < newContrant.length; i++) {
      newMatriex[i].add(newContrant[i]);
    }
    newMatriex.add(newFactionObjactiv);

    return newMatriex;
  }

  void generateConrrante() {
    contrante.clear();
    List.generate(
        matriex.length, (index) => contrante.add(TextEditingController()));
  }

  void generateVariableArtacial() {
    variableArtfsial.clear();
    for (int i = 0; i < matriex.length; i++) {
      List<double> list = [];
      for (int j = 0; j < matriex.length; j++) {
        if (j == i) {
          list.add(1);
        } else {
          list.add(0);
        }
      }
      variableArtfsial.add(list);
    }
  }

  // generate
  void generateFactionObjactive(String val) {
    if (val != '' && int.parse(val) != 0) {
      factionObjactive = [
        ...List.generate(int.parse(numberVariablReal.text),
            (index) => TextEditingController(text: 0.0.toString()))
      ];
    } else {
      factionObjactive.clear();
    }
    generateMatriex();

    update();
  }

  void generateMatriex() {
    matriex.clear();

    if (numberEquations.text.isNotEmpty && numberVariablReal.text.isNotEmpty) {
      if (int.parse(numberVariablReal.text) != 0 &&
          int.parse(numberEquations.text) != 0) {
        for (int i = 0; i < int.parse(numberEquations.text); i++) {
          List<TextEditingController> list = [];
          for (int j = 0; j < int.parse(numberVariablReal.text); j++) {
            list.add(TextEditingController());
          }
          matriex.add(list);
        }
        generateVariableArtacial();
        generateConrrante();
      }
    }
    update();
  }

  isCanGoTo() {
    if (matriex.isNotEmpty &&
        factionObjactive.isNotEmpty &&
        contrante.isNotEmpty) {
      return true;
    }
    {
      return false;
    }
  }

  getMatriex() {
    List<List<double>> data = [];
    for (int i = 0; i < matriex.length; i++) {
      List<double> list = [];
      for (int j = 0; j < matriex[i].length; j++) {
        list.add(double.parse(matriex[i][j].text));
      }
      data.add(list);
    }
    return data;
  }

  goToResalte() {
    final s = SimplaxModle(
        variableArtfsial: variableArtfsial,
        matriex: getMatriex(),
        factionObjactive: [
          ...List.generate(factionObjactive.length,
              (index) => double.parse(factionObjactive[index].text)),
          ...List.generate(int.parse(numberEquations.text) + 1, (_) => 0)
        ],
        contrante: [
          ...List.generate(
            contrante.length,
            (index) => double.parse(contrante[index].text),
          )
        ]);

    Get.to(() => const ResalteScreen(), arguments: {"m": s});
  }

  @override
  void onInit() {
    numberVariablReal = TextEditingController();
    numberEquations = TextEditingController();

    super.onInit();
  }
}
