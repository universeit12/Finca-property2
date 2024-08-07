import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {

  var videoPlayerController =
      VideoPlayerController.network('') // empty URL initially
          .obs; // Observable variable

  void initializeVideo(String url) {
    videoPlayerController.value = VideoPlayerController.network(url);

    videoPlayerController.value.initialize().then((_) {
      update(); // Notify listeners when initialization is done
    });
  }
}
