import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wizh_trips/controller/trip_controller.dart';
import 'package:wizh_trips/shared/color.dart';
import 'package:wizh_trips/shared/spacing.dart';

class ImageView extends StatelessWidget {
  final int index;
  ImageView({super.key, required this.index});

  final TripSelectedController tripSelectedController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Photos'),
        backgroundColor: WizhColor.isabelline,
      ),
      body: SizedBox(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(
                tripSelectedController.trip.image[index],
              ),
              initialScale: PhotoViewComputedScale.contained,
              heroAttributes: PhotoViewHeroAttributes(
                tag: tripSelectedController.trip.image[index],
              ),
            );
          },
          pageController: PageController(initialPage: index),
          itemCount: tripSelectedController.trip.image.length,
          loadingBuilder:
              (context, event) => Center(
                child: SizedBox(
                  width: size20,
                  height: size20,
                  child: CircularProgressIndicator(
                    value:
                        event == null
                            ? 0
                            : event.cumulativeBytesLoaded /
                                (event.expectedTotalBytes ?? 0),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
