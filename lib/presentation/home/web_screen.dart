import 'package:dicoding_project/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

import '../../provider/anime_package.dart';
import '../../responsive/detail_screen.dart';

// ignore: must_be_immutable
class WebScreen extends StatelessWidget {
  int gridCount;
  WebScreen({required this.gridCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: gridCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: animeList.map((anime) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) {
                    return DetailScreen(
                      anime: anime,
                    );
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 227, 3),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              anime.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              anime.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(anime.rating.toString())
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                anime.genre,
                                maxLines: 2,
                                style: TextStyle(fontSize: 12),
                              )),
                          FavoriteButton()
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
