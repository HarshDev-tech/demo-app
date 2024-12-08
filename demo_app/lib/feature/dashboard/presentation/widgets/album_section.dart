import 'package:demo_app/feature/dashboard/data/models/album_data.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:demo_app/feature/dashboard/presentation/widgets/photo_card.dart';
import 'package:demo_app/feature/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:loop_page_view/loop_page_view.dart';

class AlbumSection extends StatelessWidget {
  final Map<AlbumModel, List<PhotoModel>> albumPhotos;
  final InfiniteScrollController infiniteScrollController;

  const AlbumSection({required this.albumPhotos, required this.infiniteScrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: Text(
            "${albumPhotos.keys.first.title}",
            style: AppTextStyles.albumHeaderTextStyle,
          ),
        ),
        SizedBox(
            height: 100,
            child: LoopPageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return PhotoCard(photo: albumPhotos.values.first[index]);
              },
              itemCount: 4,
              pageSnapping: false,
              controller: LoopPageController(viewportFraction: 0.3),
            )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: Divider(thickness: 0.5, color: Colors.grey),
        ),
      ],
    );
  }
}
