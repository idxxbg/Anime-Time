import 'package:anime_world_tutorial/models/anime_category.dart';
import 'package:anime_world_tutorial/views/anime_grid_view.dart';

import 'package:flutter/material.dart';

class AnimeCategoriesScreen extends StatelessWidget {
  const AnimeCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animetab = animeCategories
        .map(
          (animeCategory) => Tab(
            text: animeCategory.title,
          ),
        )
        .toList();
    final _screens = animeCategories
        .map(
          (animeCategory) => AnimeGridView(
            category: animeCategory,
          ),
        )
        .toList();
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Anime categories'),
          bottom: TabBar(
            tabs: animetab,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            indicatorColor: Colors.red,
            labelColor: Colors.red,
          ),
        ),
        body: TabBarView(children: _screens),
      ),
    );
  }
}
