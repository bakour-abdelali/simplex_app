import 'package:get/get.dart';
import 'package:simplex_app/data/modle/pive_modle.dart';
import 'package:simplex_app/data/modle/simplax_modle.dart';

class ReseltController extends GetxController {
  late final SimplaxModle simplax;
  List<SimplaxModle> simplaxModle = [];
  List<PiveModle> pivoModel = [];
  bool isPivo(int step, int i, int j) {
    // 0 1 2
    if (step >= pivoModel.length) {
      return false;
    } else if (pivoModel[step].i == i && pivoModel[step].j == j) {
      return true;
    } else {
      return false;
    }
  }

  Map getPvio() {
    final p = PiveModle(
        i: getI(deepCopy(simplaxModle.last)),
        j: getJ(deepCopy(simplaxModle.last)));
    return {"element": simplaxModle.last.matriex[p.i][p.j], "dimensions": p};
  }

  SimplaxModle reverseCreateMatrix(List<List<double>> matriex) {
    List<double> factionObjactiv = List<double>.from(matriex.removeLast());
    List<double> contrante = matriex.map((row) => row.removeLast()).toList();
    int totalColumns = matriex[0].length;
    int numArtificialColumns = simplaxModle.last.variableArtfsial[0].length;

    List<List<double>> variableArtfsial = matriex
        .map((row) =>
            row.sublist(totalColumns - numArtificialColumns, totalColumns))
        .toList();

    List<List<double>> originalMatriex = matriex
        .map((row) => row.sublist(0, totalColumns - numArtificialColumns))
        .toList();

    return deepCopy(SimplaxModle(
      matriex: originalMatriex,
      factionObjactive: factionObjactiv,
      contrante: contrante,
      variableArtfsial: variableArtfsial,
    ));
  }

  List<List<double>> createMatriex(SimplaxModle s) {
    List<List<double>> newMatriex = [];
    List<double> newFactionObjactiv = [];
    List<double> newContrant = [];
    List<List<double>> newVariablArtfatiol = [];

    newMatriex = List.from(s.matriex);
    newFactionObjactiv = List.from(s.factionObjactive);
    newContrant = List.from(s.contrante);
    newVariablArtfatiol = List.from(s.variableArtfsial);

    for (int i = 0; i < newVariablArtfatiol.length; i++) {
      newMatriex[i].addAll(List.from(newVariablArtfatiol[i]));
    }
    for (int i = 0; i < newContrant.length; i++) {
      newMatriex[i].add(newContrant[i]);
    }
    newMatriex.add(newFactionObjactiv);

    return newMatriex;
  }

  SimplaxModle accountSimplax(int i) {
    List<List<double>> newList = [
      ...createMatriex(deepCopy(simplaxModle[i - 1]))
    ];
    PiveModle p = simplaxModle[i - 1].pivo!;
    List<double> listPivo = [];

    for (int i = 0; i < newList[p.i].length; i++) {
      listPivo.add(newList[p.i][i] / newList[p.i][p.j]);
    }

    newList[p.i].replaceRange(0, newList[p.i].length, listPivo);
    for (int i = 0; i < newList.length; i++) {
      print("i == p.i?  i=$i Pi=${p.i}  ");
      if (i != p.i) {
        List<double> liste = [];
        for (int j = 0; j < newList[i].length; j++) {
          double account = (-newList[i][p.j] * listPivo[j]) + newList[i][j];

          liste.add(account);
        }

        newList[i].replaceRange(0, newList[i].length, List.from(liste));
      }
    }

    return deepCopy(reverseCreateMatrix(newList));
  }

  bool isCompletAcounte() {
    List<double> objectiveFunctionRow = simplaxModle.last.factionObjactive
        .sublist(0, simplaxModle.last.matriex.last.length);

    return objectiveFunctionRow.any((element) => element > 0);
  }

  void calculationProcess() {
    int i = 1;

    while (isCompletAcounte()) {
      simplaxModle[i - 1].pivo = getPvio()['dimensions'];
      pivoModel.add(simplaxModle[i - 1].pivo!);

      SimplaxModle newSimplax = accountSimplax(i);
      simplaxModle.add(deepCopy(
          newSimplax)); // Use deepCopy to add a completely new instance.

      i++;
    }
    // simplaxModle.removeAt(0);
    // simplaxModle.add(simplax);
  }

  int getJ(SimplaxModle s) {
    int index = 0;
    double max = s.factionObjactive[0];
    for (int i = 1; i < s.factionObjactive.length; i++) {
      if (max < s.factionObjactive[i]) {
        max = s.factionObjactive[i];
        index = i;
      }
    }
    return index;
  }

  int getI(SimplaxModle s) {
    int index = getJ(s);
    List<double> r = [
      ...List.generate(
          s.matriex.length, (i) => s.contrante[i] / s.matriex[i][index])
    ];
    double min = r[0];
    int indexJ = 0;
    for (int j = 1; j < r.length; j++) {
      if (r[j] < min) {
        min = r[j];
        indexJ = j;
      }
    }
    return indexJ;
  }

  @override
  void onInit() {
    simplax = Get.arguments['m'];
    simplaxModle.add(deepCopy(simplax));

    calculationProcess();

    super.onInit();
  }

  SimplaxModle deepCopy(SimplaxModle s) {
    List<List<double>> listMatrex =
        s.matriex.map((list) => List<double>.from(list)).toList();
    List<List<double>> listVar =
        s.variableArtfsial.map((list) => List<double>.from(list)).toList();
    return SimplaxModle(
      matriex: listMatrex,
      factionObjactive: List<double>.from(s.factionObjactive),
      variableArtfsial: listVar,
      contrante: List<double>.from(s.contrante),
    );
  }
}
