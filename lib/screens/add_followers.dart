import 'package:getx_fun_fact/controllers/restuarants_controller.dart';
import 'package:getx_fun_fact/widget/rounded_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFollowers extends StatelessWidget {
  final restoController = RestuarantController.to;

  @override
  Widget build(BuildContext context) {
    print("AddFollowers screen building...");

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Follower List"),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.keyboard_backspace)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            RoundedInput(
              hintText: "Follower Name",
              onSubmit: (value) => restoController.addFollower(value),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: restoController.followerList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${restoController.followerList[index]}"),
                    leading: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => restoController.removeFollower(index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
