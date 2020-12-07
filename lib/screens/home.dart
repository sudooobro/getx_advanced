import 'package:getx_fun_fact/controllers/restuarants_controller.dart';
import 'package:getx_fun_fact/widget/card_info.dart';
import 'package:getx_fun_fact/widget/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final restoController = RestuarantController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("GetX Tutorial")),
      drawer: SideDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InfoCard(
                title: "General",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GetBuilder<RestuarantController>(
                        builder: (restoController) => Text(
                              restoController.name,
                              style: TextStyle(fontSize: 22),
                            )),
                    SizedBox(height: 4),
                    Obx(
                      () => Text(
                        "Followers: ${restoController.followerCount.value.toString()}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 4),
                    Obx(() => restoController.isOpen.value == true
                        ? RestoStatus(
                            status: 'Open',
                            mycolor: Colors.green,
                          )
                        : RestoStatus(status: 'Closed', mycolor: Colors.red))
                  ],
                ),
              ),
              InfoCard(
                title: "Followers",
                body: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: restoController.followerList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        child: restoController.followerList.length == null
                            ? Text('')
                            : Text(
                                restoController.followerList[index],
                                style: TextStyle(fontSize: 16),
                              ),
                        padding: EdgeInsets.all(8),
                      );
                    },
                  ),
                ),
              ),
              InfoCard(
                title: "Reviews",
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      child: Text(
                        "Good",
                        style: TextStyle(fontSize: 16),
                      ),
                      padding: EdgeInsets.all(8),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestoStatus extends StatelessWidget {
  final String status;
  final Color mycolor;
  const RestoStatus({
    Key key,
    this.status,
    this.mycolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(status, style: TextStyle(color: mycolor, fontSize: 18));
  }
}
