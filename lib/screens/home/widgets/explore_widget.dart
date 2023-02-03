import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wonderspace/common/enums/explore_enum.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.exploreType,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final ExploreType exploreType;

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler();

    return InkWell(
      onTap: () {
        print(exploreType.name);
        context.goNamed(
          exploreType.name,
        );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => exploreType == ExploreType.apod
        //             ? ApodScreen()
        //             : MarsRoverScreen()));
      },
      child: Container(
        height: scaler.getHeight(7),
        width: scaler.getWidth(30),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            left: 70,
            child: GlassmorphicContainer(
              width: scaler.getWidth(20),
              height: scaler.getHeight(7),
              borderRadius: 20,
              blur: 10,
              alignment: Alignment.center,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: scaler.getWidth(5),
                  ),
                  Text(
                    // textAlign: TextAlign.justify,
                    title,

                    style: GoogleFonts.mohave(
                        fontWeight: FontWeight.w500,
                        fontSize: scaler.getTextSize(9),
                        letterSpacing: 2,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: scaler.getWidth(11),
                  fit: BoxFit.cover,
                  // alignment: Alignment.centerLeft,
                  height: scaler.getHeight(5),
                ),
              )),
        ]),
      ),
    );
  }
}
