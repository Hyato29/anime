import 'package:dicoding_project/presentation/home/views/detail_screen_home.dart';
import 'package:dicoding_project/presentation/home/views/web_screen_home.dart';
import 'package:flutter/material.dart';

import '../provider/model/anime_model.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  Anime anime;
  DetailScreen({required this.anime, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return WebScreenHome(anime: anime);
        } else {
          return DetailScreenHome(anime: anime);
        }
      },
    );
  }
}
