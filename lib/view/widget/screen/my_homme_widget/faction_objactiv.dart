import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:simplex_app/controller/screen/my_homme_controller.dart';
import 'package:simplex_app/view/widget/input_field.dart';

class FactionObjactiv extends GetView<MyHommeController> {
  const FactionObjactiv({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.factionObjactive.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.all(10),
        height: 77,
        child: Row(
          children: [
            const Text("Max(Z) = "),
            ...List.generate(
                controller.factionObjactive.length,
                (index) => Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: NumberInputField(
                          label: 'X$index',
                          controller: controller.factionObjactive[index],
                          isReal: false,
                          onChanged: (val) {},
                        ),
                      ),
                    ))
          ],
        ),
      );
    } else
      return SizedBox();
  }
}
