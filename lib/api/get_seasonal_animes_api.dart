import 'dart:convert';

import 'package:anime_world_tutorial/common/utils/utils.dart';
import 'package:anime_world_tutorial/models/anime_infor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/app_config.dart';

Future<AnimeInfor> getSeasonalAnimesApi({
  required int limit,
}) async {
  final year = DateTime.now().year;
  final season = getCurrentSeason();
  final baseUrl =
      'https://api.myanimelist.net/v2/anime/season/$year/$season?limit=$limit';
  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'X-MAL-CLIENT-ID': clientId,
    },
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final seasonalAnime = AnimeInfor.fromJson(data);
    return seasonalAnime;
  } else {
    debugPrint("error: ${response.statusCode}");
    debugPrint("error: ${response.body}");
    throw Exception("fail to get data!");
  }
}
