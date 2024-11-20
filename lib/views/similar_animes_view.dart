import 'package:anime_world_tutorial/common/styles/text_styles.dart';
import 'package:anime_world_tutorial/models/anime_node.dart';
import 'package:anime_world_tutorial/widgets/anime_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SimilarAnimesView extends StatelessWidget {
  const SimilarAnimesView({
    super.key,
    required this.animes,
    required this.label,
  });
  final List<AnimeNode> animes;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: Text(
            label,
            style: TextStyles.largeText,
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: animes.length,
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) {
              final anime = animes.elementAt(index);
              return AnimeTile(
                anime: anime,
              );
            },
          ),
        )
      ],
    );
  }
}
