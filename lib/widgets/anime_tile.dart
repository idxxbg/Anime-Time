import 'package:anime_world_tutorial/common/styles/text_styles.dart';
import 'package:anime_world_tutorial/models/anime_node.dart';
import 'package:anime_world_tutorial/screens/anime_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeTile extends StatelessWidget {
  const AnimeTile({super.key, required this.anime});
  final AnimeNode anime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (_) => AnimeDetailsScreen(id: anime.id)));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: anime.mainPicture.medium,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            anime.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyles.smallText,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
