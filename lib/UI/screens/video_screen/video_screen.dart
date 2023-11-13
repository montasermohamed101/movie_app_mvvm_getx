import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/controller/video_controller.dart';

class VideoScreen extends StatelessWidget {
  final String videoUrl;

  VideoScreen({required this.videoUrl});

  VideoViewModel viewModel = VideoViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.initializeVideo(videoUrl);

    return GetBuilder(
      init: viewModel,
      builder: (controller) {
      if (controller.isLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.error != null) {
        return Center(
          child: Text('Error: ${controller.error}'),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              children: [
                controller.isLoading ?
                CircularProgressIndicator() :
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(
                    controller: viewModel.chewieController!,
                  ),
                ),
              ],
            ),
          ),
        );
      }
      }
    );
  }
}


