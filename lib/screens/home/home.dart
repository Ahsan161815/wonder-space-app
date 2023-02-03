import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wonderspace/common/enums/explore_enum.dart';
import 'package:wonderspace/common/screens/my_scaffold.dart';
import 'package:wonderspace/providers/apod_provider.dart';
import 'package:wonderspace/repository/apod_repository.dart';

import 'widgets/explore_widget.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenScaler scaler = ScreenScaler();

    final ApodRepository apod = ref.read(apodProvider);

    return MyScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wonder \nSpace',
          style: GoogleFonts.bebasNeue(
              color: Colors.white,
              // fontWeight: FontWeight.w300,
              fontSize: scaler.getTextSize(13),
              letterSpacing: 3.0,
              shadows: [
                Shadow(
                    color: Colors.black, blurRadius: 30, offset: Offset(2, 0)),
              ]),
        ),
        SizedBox(
          height: scaler.getHeight(5),
        ),
        Text(
          'Must Explore Spaces',
          style: GoogleFonts.mohave(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: scaler.getTextSize(8),
          ),
        ),
        SizedBox(
          height: scaler.getHeight(1),
        ),
        ExploreCard(
          exploreType: ExploreType.apod,
          title: 'Astronomy \nPicture of \nthe Day',
          imageUrl:
              'https://images.unsplash.com/photo-1462332420958-a05d1e002413?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1807&q=80',
        ),
        SizedBox(
          height: 16,
        ),
        ExploreCard(
            exploreType: ExploreType.rover,
            title: 'Mars \nRover \nPhotos',
            imageUrl:
                'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=911&q=80'),
      ],
    ));
  }
}
