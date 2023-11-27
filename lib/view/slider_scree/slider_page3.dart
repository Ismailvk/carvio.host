import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/resource/colors/colors.dart';
import 'package:second_project/view/bottombar_screen/main_screen.dart';

class SliderPage3 extends StatelessWidget {
  const SliderPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/image/Porsche.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width >= 600 ? 50 : 40,
                top: MediaQuery.of(context).size.height >= 600 ? 200 : 100,
              ),
              child: Container(
                height: 100,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/image/carvio.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.20,
              ),
              child: Container(
                height: 8,
                width: 120,
                color: const Color(0xff2BEFEF),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Text(
                'get quick access to frequent\n locations, and save them as a\n favourites',
                style: GoogleFonts.hind(color: Colors.white, fontSize: 22),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.06,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(const CoustomNavBar());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff9E87E3),
                ),
                child: Text(
                  "Let's Start",
                  style: TextStyle(color: white),
                ),
              ),
            )
          ],
        ))
      ],
    ));
  }
}
