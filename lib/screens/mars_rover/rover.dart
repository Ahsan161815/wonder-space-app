import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wonderspace/common/screens/my_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wonderspace/models/mars_rover_images.dart';
import 'package:wonderspace/providers/mars_rover_provider.dart';
import 'package:wonderspace/repository/mars_rover_repository.dart';

class MarsRoverScreen extends ConsumerWidget {
  const MarsRoverScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MarsRoverRepository rover = ref.read(marsRoverProvider);
    // rover.get();
    // print(title);
    return MyScaffold(
      body: FutureBuilder<Mri>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.photos.length,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    snapshot.data!.photos[index].imgSrc,
                    width: double.maxFinite,
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: rover.get(),
      ),
    );
  }
}
