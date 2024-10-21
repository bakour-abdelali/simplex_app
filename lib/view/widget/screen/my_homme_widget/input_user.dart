import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:simplex_app/controller/screen/my_homme_controller.dart';

import '../../input_field.dart';

class InputUser extends GetView<MyHommeController> {
  const InputUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              //width: 200,
              child: NumberInputField(
                controller: controller.numberVariablReal,
                label: 'Nombre variables',
                isReal: false,
                onChanged: (val) {
                  val != '' ? val : "0";

                  controller.generateFactionObjactive(val);
                },
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
              //  width: 200,
              child: NumberInputField(
            label: 'Nombre des sous-contraints',
            controller: controller.numberEquations,
            isReal: false,
            onChanged: (val) {
              val != '' ? val : "0";

              controller.generateMatriex();
            },
          )),
          // const SizedBox(width: 15),
        ],
      ),
    );
  }
}
