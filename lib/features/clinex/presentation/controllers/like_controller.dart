
import 'package:get/get.dart';

class LikeController extends GetxController {
  var isLiked = false.obs;

  void toggleLike() {
    isLiked.value = !isLiked.value;
  }
}