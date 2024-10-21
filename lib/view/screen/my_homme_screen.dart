import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplex_app/view/widget/screen/my_homme_widget/faction_objactiv.dart';

import '../../controller/screen/my_homme_controller.dart';
import '../widget/screen/my_homme_widget/equations_contrant.dart';
import '../widget/screen/my_homme_widget/input_user.dart';

class MyHommeScreen extends StatelessWidget {
  const MyHommeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      MyHommeController(),
      permanent: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mini projact"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GetBuilder<MyHommeController>(builder: (c) {
          return ElevatedButton(
            child: Text("resalte"),
            onPressed: c.isCanGoTo()
                ? () {
                    c.goToResalte();
                  }
                : null,
          );
        }),
      ),
      body: GetBuilder<MyHommeController>(builder: (controller) {
        return ListView(
          children: [
            const InputUser(),
            const SizedBox(height: 30),
            FactionObjactiv(),
            EquationsContrante(),
          ],
        );
      }),
    );
  }
}
