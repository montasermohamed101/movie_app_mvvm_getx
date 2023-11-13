import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_mvvm_getx/data/base_error.dart';
import 'package:movie_app_mvvm_getx/data/repo/home_repo_impl.dart';
import 'package:movie_app_mvvm_getx/domain/repo/home_repo.dart';

import '../../model/movie_model.dart';

class HomeViewModel extends GetxController{

  HomeRepo repo = HomeRepoImpl();
  @override
  void onInit() {
    super.onInit();
    print("HomeViewModel onInit called");
    getMovies();
    getNextRandomImage();
  }

  List<Adventure> forYou = [];
  List<Adventure> action = [];
  List<Adventure> comedy = [];
  List<Adventure> drama = [];
  List<Adventure> adventure = [];
  List<Adventure> animation = [];
  Adventure? getNextRandomImage() {
    if (forYou.isNotEmpty) {
      Random random = Random();
      int randomNumber = random.nextInt(forYou.length);
      return forYou[randomNumber];
    }
    return null;
  }

  getMovies() async {
    Either<BaseError, Movie> either = await repo.getMovies();

    either.fold((error) {
      print(error.message);
    }, (response) {
      forYou = response.foryou;
      action = response.action;
      drama = response.drama;
      comedy = response.comedy;
      adventure = response.adventure;
      animation = response.animation;

      if (forYou?.isNotEmpty == true &&
          action?.isNotEmpty == true &&
          drama?.isNotEmpty == true &&
          comedy?.isNotEmpty == true &&
          adventure?.isNotEmpty == true &&
          animation?.isNotEmpty == true) {
        update(); // Trigger UI update
      }

    });
  }



}