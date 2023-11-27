import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/image/bmw.png"),
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
                  left: MediaQuery.of(context).size.width >= 600 ? 50 : 35,
                  top: MediaQuery.of(context).size.height >= 600 ? 200 : 100,
                ),
                child: Container(
                  height: 100,
                  width: 300,
                  // color: Colors.white,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/image/carvio.png'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.2,
                ),
                child: Container(
                  height: 10,
                  width: 120,
                  color: const Color(0xff2B4C59),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Text(
                  'Rent your dream car from the \nBest Company',
                  style: GoogleFonts.hind(color: Colors.white, fontSize: 22),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
