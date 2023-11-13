import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoViewModel extends GetxController {
  ChewieController? chewieController;
  late VideoPlayerController videoPlayerController;
  bool isLoading = true;
  String? error;

  Future<void> initializeVideo(String videoUrl) async {
    try {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await videoPlayerController.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
      );

      isLoading = false;
      update();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    chewieController?.dispose();
    videoPlayerController.pause();
    videoPlayerController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    chewieController?.dispose();
    videoPlayerController.pause();
    videoPlayerController.dispose();
    super.dispose();
  }
}
