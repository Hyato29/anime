import 'package:dicoding_project/provider/model/anime_model.dart';
import 'package:flutter/material.dart';

import '../../../widgets/favorite_button.dart';

class WebScreenHome extends StatelessWidget {
  final Anime anime;
  const WebScreenHome({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            height: 130,
            color: Colors.white,
            padding: EdgeInsets.only(right: 18, left: 18, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 200, child: Text(anime.genre, maxLines: 2)),
                  ],
                ),
                Center(
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 227, 227, 3),
                          shape: BoxShape.circle),
                      child: const FavoriteButton()),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                      height: 500,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          anime.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Judul  :  ${anime.name}"),
                          Text("Rating :  ${anime.rating}"),
                          Text("Durasi :  ${anime.durasi}"),
                          Text("Rilis  :  ${anime.tglRilis}"),
                          Text("Studio :  ${anime.studio}"),
                          Text("Genre  :  ${anime.genre}"),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                anime.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: anime.imageList.map((assets) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      height: 500,
                      child: Image.asset(
                        assets,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ])));
  }
}
