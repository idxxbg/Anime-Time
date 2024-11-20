import 'package:flutter/foundation.dart' show immutable;

import 'anime.dart';

@immutable
class AnimeInfor {
  final Iterable<Anime> animes;
  const AnimeInfor({
    required this.animes,
  });

  factory AnimeInfor.fromJson(Map<String, dynamic> json) {
    List<dynamic> animeRankinglist = json['data'];
    List<Anime> animeRankingItems =
        animeRankinglist.map((item) => Anime.fromJson(item)).toList();
    return AnimeInfor(
      animes: animeRankingItems,
    );
  }
}

@immutable
class Ranking {
  final int rank;
  const Ranking({required this.rank});
  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(rank: json['rank']);
  }
}
