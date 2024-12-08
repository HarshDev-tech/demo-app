import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_app/feature/dashboard/data/models/photo_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PhotoCard extends StatelessWidget {
  final PhotoModel photo;

  const PhotoCard({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: CachedNetworkImage(
        cacheManager: DefaultCacheManager(),
        imageUrl: photo.url!,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Container(margin: edgeInsets, decoration: boxDecoration, child: Icon(Icons.image, size: 40, color: Colors.grey)),
        errorWidget: (context, url, error) => Container(margin: edgeInsets, decoration: boxDecoration, child: Icon(Icons.error)),
      ),
    );
  }

  EdgeInsets get edgeInsets => EdgeInsets.symmetric(horizontal: 4);

  BoxDecoration get boxDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.grey.shade400),
    );
  }
}
