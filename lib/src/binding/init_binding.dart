import 'package:get/get.dart';
import 'package:youtube_clone/src/controller/app_controller.dart';
import 'package:youtube_clone/src/repository/youtube_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(YoutubeRepository(), permanent: true);
  }

}