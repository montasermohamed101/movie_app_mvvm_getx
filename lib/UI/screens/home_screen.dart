import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/controller/home_controller.dart';
import '../widgets/genre.dart';
import '../widgets/header.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  GetBuilder(
      init: HomeViewModel(),
      builder: (viewModel) => Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(viewModel: viewModel),
              Genre(title: "Action", movies: viewModel.action),
              Genre(title: "Drama", movies: viewModel.drama),
              Genre(title: "Comedy", movies: viewModel.comedy),
              Genre(title: "Adventure", movies: viewModel.adventure),
              Genre(title: "Animation", movies: viewModel.animation),
            ],
          ),
        ),
      ),
    );

  }
}
