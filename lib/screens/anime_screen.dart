import 'package:anime_world_tutorial/common/styles/paddings.dart';
import 'package:anime_world_tutorial/views/featured_animes.dart';
import 'package:flutter/material.dart';

import '../widgets/top_animes_widget.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Anime Time"),
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            //featured animes (10)
            SizedBox(
              height: 300,
              child: TopAnimesList(),
            ),
            //Top anime
            Padding(
              padding: Paddings.noBottomPadding,
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "all", label: 'Top Ranking'),
                  ),
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "airing", label: 'Top Aring Anime'),
                  ),
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "upcoming", label: 'Top Upcoming Animev'),
                  ),
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                        rankingType: "tv", label: 'Top Anime TV Series'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
