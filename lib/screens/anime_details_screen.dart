import 'package:anime_world_tutorial/api/get_anime_details_api.dart';
import 'package:anime_world_tutorial/common/extensions/extensions.dart';
import 'package:anime_world_tutorial/common/styles/paddings.dart';
import 'package:anime_world_tutorial/common/styles/text_styles.dart';
import 'package:anime_world_tutorial/common/widget/back_button_widget.dart';
import 'package:anime_world_tutorial/common/widget/net_work_image_view.dart';
import 'package:anime_world_tutorial/common/widget/read_more_text.dart';
import 'package:anime_world_tutorial/core/screens/error_screen.dart';
import 'package:anime_world_tutorial/core/widgets/loader.dart';
import 'package:anime_world_tutorial/models/anime_details.dart';
import 'package:anime_world_tutorial/models/picture.dart';
import 'package:anime_world_tutorial/views/similar_animes_view.dart';
import 'package:anime_world_tutorial/widgets/infor_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeDetailsApi(id: id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Loader());
        }
        if (snapshot.data != null) {
          final anime = snapshot.data;
          return Scaffold(
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _builAnimeImageWidget(imageUrl: anime!.mainPicture.large),
                      Padding(
                        padding: Paddings.noBottomPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildAnimeTitle(
                              name: anime.title,
                              englishName: anime.alternativeTitles.en,
                            ),
                            const SizedBox(height: 20),

                            // Anime tom tat
                            ReadMoreText(longText: anime.synopsis),
                            const SizedBox(height: 20),

                            // Anime Infor
                            _buildAinmeInfor(anime: anime),
                            const SizedBox(height: 20),

                            anime.background.isNotEmpty
                                ? Column(
                                    children: [
                                      _buildAnimeBackground(
                                        background: anime.background,
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  )
                                : const SizedBox.shrink(),

                            // Anime Image Gallery
                            _builAnimeImageGallery(images: anime.pictures),
                            const SizedBox(height: 20),

                            // Similar Animes
                            SimilarAnimesView(
                              animes: anime.recommendations
                                  .map((animeRec) => animeRec.node)
                                  .toList(),
                              label: 'Recommendations',
                            ),
                            const SizedBox(height: 20),

                            // Similar Animes
                            SimilarAnimesView(
                              animes: anime.relatedAnime
                                  .map((animeReLated) => animeReLated.node)
                                  .toList(),
                              label: 'Related Anime',
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const BackButtonWidget(),
              ],
            ),
          );
        }
        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }

  _builAnimeImageWidget({required String imageUrl}) {
    return Hero(
      tag: imageUrl,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        height: 400,
        width: double.infinity,
      ),
    );
  }

  Widget _buildAnimeTitle({
    required String name,
    required String englishName,
  }) =>
      Builder(
        builder: (context) {
          return Text(
            englishName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      );

  Widget _buildAinmeInfor({
    required AnimeDetails anime,
  }) {
    String studio = anime.studios.map((studio) => studio.name).join(',');
    String genre = anime.genres.map((genres) => genres.name).join(',');
    String ortherNames =
        anime.alternativeTitles.synonyms.map((title) => title).join(',');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InforText(label: 'Genres', infor: genre),
        InforText(label: 'Start date', infor: anime.startDate),
        InforText(label: 'End date', infor: anime.endDate),
        InforText(label: 'Episodes', infor: anime.numEpisodes.toString()),
        InforText(
            label: 'Average Episode Duration',
            infor: anime.averageEpisodeDuration.toMinute()),
        InforText(label: 'Status', infor: anime.status),
        InforText(label: 'Rating', infor: anime.rating),
        InforText(label: 'Studios', infor: studio),
        InforText(label: 'Other Names', infor: ortherNames),
        InforText(label: 'English Name', infor: anime.alternativeTitles.en),
        InforText(label: 'Japanese Name', infor: anime.alternativeTitles.ja),
      ],
    );
  }

  Widget _buildAnimeBackground({required String background}) {
    return WhiteContainer(child: Builder(builder: (context) {
      return Text(
        background,
        style: Theme.of(context).textTheme.bodyMedium,
      );
    }));
  }

  Widget _builAnimeImageGallery({
    required List<Picture> images,
  }) {
    return Column(
      children: [
        const Text('Image Gallery', style: TextStyles.mediumText),
        GridView.builder(
          itemCount: images.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 9 / 16,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final image = images[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => NetWorkImageView(
                        imageUrl: image.large,
                        index: index,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: '${image.large} + $index',
                  child: Image.network(
                    image.medium,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white54,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
