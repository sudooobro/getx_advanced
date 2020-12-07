import 'package:getx_fun_fact/controllers/restuarants_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleStatus extends StatelessWidget {
  final restoController = RestuarantController.to;

  @override
  Widget build(BuildContext context) {
    print("ToggleStatus screen building...");

    return Scaffold(
      appBar: AppBar(title: Text("Test Status Toggle")),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Is the restuarant open?",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Obx(
                () => Switch(
                  onChanged: (value) => restoController.setIsOpen(value),
                  activeColor: Colors.purple,
                  value: restoController.isOpen.value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
