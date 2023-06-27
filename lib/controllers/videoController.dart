import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class VideoController extends GetxController {
  final String VideoURL;

  VideoController(this.VideoURL);

  late VideoPlayerController playerController;
  ChewieController? chewieController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initilizePlayer();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    playerController.dispose();
    chewieController?.dispose();
  }

  Future<void> initilizePlayer() async {
    playerController = VideoPlayerController.network(VideoURL);
    await Future.wait([playerController.initialize()]);
    chewieController = ChewieController(
        videoPlayerController: playerController,
        autoPlay: true,
        looping: true,
        materialProgressColors: ChewieProgressColors(
            playedColor: Colors.black,
            handleColor: Colors.black,
            backgroundColor: Colors.black45,
            bufferedColor: Colors.black45),
        placeholder: Container(
          color: Colors.white,
        ),
        autoInitialize: true);
    update();
    // playerController.setLooping(true);
    // playerController.setVolume(1);
  }
}
