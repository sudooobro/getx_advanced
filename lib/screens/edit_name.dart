import 'package:getx_fun_fact/controllers/restuarants_controller.dart';
import 'package:getx_fun_fact/widget/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditName extends StatelessWidget {
  final restoController = RestuarantController.to;

  @override
  Widget build(BuildContext context) {
    print("EditName screen building...");
    return Scaffold(
      appBar: AppBar(
        title: Text("Test your edit name"),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.keyboard_backspace)),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            GetBuilder<RestuarantController>(
              builder: (restoController) => Text(
                restoController.name,
                style: TextStyle(fontSize: 48),
              ),
            ),
            SizedBox(height: 16),
            RoundedInput(
              hintText: "Restauarant Name",
              onSubmit: (value) => restoController.setName(value),
            )
          ],
        ),
      ),
    );
  }
}
