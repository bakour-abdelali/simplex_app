// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/screen/reslet_controller.dart';

// ignore: must_be_immutable
class ResalteScreen extends StatelessWidget {
  const ResalteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(ReseltController(simplaxModle));
    return Scaffold(
      appBar: AppBar(
        title: Text("Resalte"),
      ),
      body: GetBuilder<ReseltController>(
          init: ReseltController(),
          builder: (reseltController) {
            // بناء الجدول من البيانات
            return ListView.builder(
                itemCount: reseltController.simplaxModle.length,
                itemBuilder: (context, indexCard) {
                  return Card(
                    child: Table(
                      children: [
                        TableRow(children: [
                          const Text("hb/B"),
                          ...List.generate(
                            reseltController
                                .simplaxModle.last.matriex.last.length,
                            (index) => Text("X$index"),
                          ),
                          ...List.generate(
                              reseltController.simplaxModle.last
                                      .variableArtfsial.last.length +
                                  1, (index) {
                            if (index !=
                                reseltController.simplaxModle.last
                                    .variableArtfsial.last.length) {
                              return Text("T$index");
                            } else {
                              return Text("C");
                            }
                          })
                        ]),
                        ...List.generate(
                            reseltController.simplaxModle.last.variableArtfsial
                                    .last.length +
                                1, (i) {
                          if (i ==
                              reseltController.simplaxModle.last
                                  .variableArtfsial.last.length) {
                            return TableRow(
                              children: [
                                ...List.generate(
                                    reseltController.simplaxModle[indexCard]
                                            .factionObjactive.length +
                                        1, (j) {
                                  if (j == 0) {
                                    return Text("D");
                                  } else {
                                    return Text(
                                        "${reseltController.simplaxModle[indexCard].factionObjactive[j - 1]}");
                                  }
                                })
                              ],
                            );
                          }

                          return TableRow(
                            children: [
                              ...List.generate(
                                  reseltController.simplaxModle.last.matriex
                                          .last.length +
                                      reseltController.simplaxModle.last
                                          .variableArtfsial.last.length +
                                      2, (j) {
                                int c = reseltController
                                        .simplaxModle.last.matriex.last.length +
                                    reseltController.simplaxModle.last
                                        .variableArtfsial.last.length;

                                if (j == 0) {
                                  return Text("T$i");
                                } else if (reseltController.simplaxModle.last
                                        .matriex.last.length >=
                                    j) {
                                  return Text(
                                    "${reseltController.simplaxModle[indexCard].matriex[i][j - 1]} ",
                                    style: TextStyle(
                                        color: reseltController.isPivo(
                                                indexCard, i, j - 1)
                                            ? Colors.red
                                            : Colors.black),
                                  );
                                } else if (j == c + 1) {
                                  return Text(
                                      "${reseltController.simplaxModle[indexCard].contrante[i]}");
                                }
                                //  else  () {
                                // return Text(
                                //     "${reseltController.simplaxModle[indexCard].variableArtfsial[i][j - reseltController.simplaxModle.last.variableArtfsial.last.length]}");
                                // }

                                else {
                                  print("j == $j");
                                  return Text(
                                      "${reseltController.simplaxModle[indexCard].variableArtfsial[i][j - (reseltController.simplaxModle.last.matriex.last.length + 1)]}");
                                }
                              })
                            ],
                          );
                        }),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
