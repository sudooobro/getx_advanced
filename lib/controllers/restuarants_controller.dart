import 'package:get/get.dart';

class RestuarantController extends GetxController {
  String name = "Pizza Chock";
  final followerCount = 0.obs;
  final isOpen = true.obs;
  final followerList = [].obs;
  final reviews = <String, String>{}.obs;

  static RestuarantController get to => Get.find<RestuarantController>();

  Worker everWorker;
  @override
  void onInit() {
    super.onInit();
    everWorker = ever(followerList, (List list) {
      followerCount((list.length));
      if (list.length >= 5) everWorker.dispose();
    });
    // ever(followerList, (value) => print('Follower List $value'));
    once(followerList,
        (value) => print('Follower list updated first time $value'));
    debounce(followerCount, (value) => print('debounce Count : $value'),
        time: Duration(seconds: 3));
    interval(followerCount, (value) => print('interval Count : $value'),
        time: Duration(seconds: 3));
  }

  setName(String restoName) {
    //Call API
    //Set name from API data

    name = restoName;
    update();
  }

  increment() {
    followerCount(followerCount.value + 1);
  }

  decrement() {
    followerCount(followerCount.value - 1);
  }

  setIsOpen(bool open) {
    isOpen(open);
    // open = isOpen;
    // update();
  }

  setFollowerList(List<String> list) {
    followerList.assignAll(list);
  }

  addFollower(String name) {
    followerList.add(name);
  }

  removeFollower(int index) {
    followerList.removeAt(index);
  }

  // addReview(String name, String review) {
  //   reviews.add(name, review);
  // }

  removeReview(String name) {
    reviews.remove(name);
  }
}
