import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderPage2 extends StatelessWidget {
  const SliderPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/image/redbmw.jpeg"),
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
                  left: MediaQuery.of(context).size.width >= 600 ? 50 : 30,
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
                  top: MediaQuery.of(context).size.height * 0.26,
                ),
                child: Container(
                  height: 10,
                  width: 120,
                  color: const Color(0xff2BEFEF),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Text(
                  'Fastest way to book car \nwithout the hassle of waiting \nhanging for price',
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
