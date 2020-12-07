import 'package:getx_fun_fact/controllers/restuarants_controller.dart';
import 'package:getx_fun_fact/widget/rounded_input.dart';
import 'package:flutter/material.dart';

class AddReviews extends StatelessWidget {
  final nameInputController = TextEditingController();
  final reviewInputController = TextEditingController();
  final restoController = RestuarantController.to;

  @override
  Widget build(BuildContext context) {
    print("AddReviews screen building...");

    return Scaffold(
      appBar: AppBar(title: Text("Test Reviews")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            RoundedInput(
                hintText: "Name",
                onSubmit: (value) => print(value),
                editingController: nameInputController),
            SizedBox(height: 16),
            RoundedInput(
              editingController: reviewInputController,
              hintText: "Review",
              onSubmit: (value) => print(value),
            ),
            SizedBox(
              height: 16,
            ),
            FlatButton(child: Text('Submit'), onPressed: () {}),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Reviews ${(index + 1)}"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
