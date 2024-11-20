import 'package:anime_world_tutorial/api/get_anime_by_ranking_type_api.dart';

import 'package:anime_world_tutorial/core/screens/error_screen.dart';
import 'package:anime_world_tutorial/core/widgets/loader.dart';
import 'package:anime_world_tutorial/views/rank_animes_list_view.dart';

import 'package:flutter/material.dart';

class ViewAllAnimesScreens extends StatelessWidget {
  const ViewAllAnimesScreens({
    super.key,
    required this.rankingType,
    required this.label,
  });
  final String rankingType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: getAnimeByRankingTypeApi(rankingType: rankingType, limit: 500),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }
          if (snapshot.data != null) {
            return RankAnimesListView(animes: snapshot.data!);
          }
          return const ErrorScreen(error: "error when get data !");
        },
      ),
    );
  }
}
