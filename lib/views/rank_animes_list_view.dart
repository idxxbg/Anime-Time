import 'package:anime_world_tutorial/common/styles/paddings.dart';
import 'package:anime_world_tutorial/models/anime.dart';
import 'package:anime_world_tutorial/widgets/anime_list_title.dart';
import 'package:flutter/material.dart';

class RankAnimesListView extends StatefulWidget {
  const RankAnimesListView({super.key, required this.animes});
  final Iterable<Anime> animes;

  @override
  State<RankAnimesListView> createState() => _RankAnimesListViewState();
}

class _RankAnimesListViewState extends State<RankAnimesListView> {
  late ScrollController _scrollController;
  // double _lastScrollOffset = 0; // Lưu trữ vị trí cuộn trước đó

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // // Lắng nghe sự kiện cuộn
    // _scrollController.addListener(() {
    //   final currentScrollOffset = _scrollController.offset;

    //   // Kích hoạt Haptic Feedback khi cuộn vượt qua khoảng cách nhất định
    //   if ((currentScrollOffset - _lastScrollOffset).abs() > 50) {
    //     HapticFeedback.lightImpact(); // Hiệu ứng nhẹ
    //     _lastScrollOffset = currentScrollOffset;
    //   }
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dọn dẹp bộ nhớ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.defaultPadding,
      child: Scrollbar(
        controller: _scrollController, // Gắn ScrollController
        trackVisibility: true,
        radius: const Radius.circular(10),
        child: ListView.builder(
          controller: _scrollController, // Gắn ScrollController
          physics: const BouncingScrollPhysics(),
          itemCount: widget.animes.length,
          itemBuilder: (context, index) {
            final anime = widget.animes.elementAt(index);
            return AnimeListTile(anime: anime);
          },
        ),
      ),
    );
  }
}
