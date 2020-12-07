import 'package:getx_fun_fact/controllers/menu_controller.dart';
import 'package:getx_fun_fact/widget/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_fun_fact/model/menu.dart';

// ignore: must_be_immutable
class UpdateMenu extends StatelessWidget {
  TextEditingController nameInputController = TextEditingController();
  TextEditingController colorInputController = TextEditingController();
  TextEditingController locationInputController = TextEditingController();

  final restoController = MenuController.to;

  @override
  Widget build(BuildContext context) {
    print("UpdateMenu screen building...");

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Menu"),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.keyboard_backspace)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInput(
              hintText: "Name",
              onSubmit: (value) => restoController.setMenuName(value),
              editingController: nameInputController,
            ),
            SizedBox(height: 16),
            RoundedInput(
              hintText: "Color",
              onSubmit: (value) => restoController.setMenuColor(value),
              editingController: colorInputController,
            ),
            SizedBox(height: 16),
            RoundedInput(
              hintText: "Location",
              onSubmit: (value) => restoController.setMenuLocation(value),
              editingController: locationInputController,
            ),
            SizedBox(height: 16),
            FlatButton(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => restoController.setMenu(Menu(
                name: nameInputController.text,
                color: colorInputController.text,
                location: locationInputController.text,
              )),
              color: Colors.deepOrange,
            ),
            SizedBox(height: 16),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(restoController.menu.value.name),
                  SizedBox(height: 16),
                  Text(restoController.menu.value.color),
                  SizedBox(height: 16),
                  Text(restoController.menu.value.location),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
