import 'package:dicoding_project/provider/anime_package.dart';
import 'package:flutter/material.dart';

import '../../provider/model/anime_model.dart';
import '../../responsive/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          final Anime anime = animeList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) {
                  return DetailScreen(
                    anime: anime,
                  );
                }));
              },
              child: Card(
                elevation: 5,
                color: Color.fromARGB(255, 227, 227, 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(anime.imageAsset)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            anime.name,
                            style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  anime.rating.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Text(
                        anime.genre,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
