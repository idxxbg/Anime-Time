import 'package:anime_world_tutorial/models/anime.dart';
import 'package:anime_world_tutorial/screens/anime_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnimesGridList extends StatelessWidget {
  const AnimesGridList({super.key, required this.title, required this.animes});
  final String title;
  final Iterable<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      itemCount: animes.length,
      itemBuilder: (context, index) {
        final anime = animes.elementAt(index);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => AnimeDetailsScreen(id: anime.node.id),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: anime.node.mainPicture.medium,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
