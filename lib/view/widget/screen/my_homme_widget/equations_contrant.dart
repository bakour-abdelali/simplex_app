import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:simplex_app/controller/screen/my_homme_controller.dart';

import '../../input_field.dart';

class EquationsContrante extends GetView<MyHommeController> {
  const EquationsContrante({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.matriex.isNotEmpty) {
      if (controller.matriex.isNotEmpty) {
        if (int.parse(controller.numberEquations.text == ""
                ? "0"
                : controller.numberEquations.text) >=
            int.parse(controller.numberVariablReal.text == ""
                ? "0"
                : controller.numberVariablReal.text)) {
          return Column(
            children: [
              ...List.generate(controller.matriex.length, (i) {
                return Row(
                  children: [
                    ...List.generate(
                        controller.matriex[0].length,
                        (j) => Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                child: NumberInputField(
                                  controller: controller.matriex[i][j],
                                  onChanged: (val) {
                                    // controller.matriex
                                  },
                                  label: "X$i $j",
                                ),
                              ),
                            )),
                    const Text("<="),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: NumberInputField(
                          controller: controller.contrante[i],
                          onChanged: (val) {
                            // controller.matriex
                          },
                          label: "",
                        ),
                      ),
                    )
                  ],
                );
              })
            ],
          );
        }
        return Container();
      } else {
        return Text("");
      }
    } else {
      return SizedBox();
    }
  }
}
