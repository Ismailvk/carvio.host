import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_project/model/revenue_model.dart';
import 'package:second_project/resource/font/app_font.dart';
import 'package:second_project/service/api_url.dart';
import 'package:second_project/widget/backbutton_widget.dart';
import 'package:second_project/widget/slider_card_widget.dart';
import 'package:second_project/widget/sub_title_widget.dart';

class TrendingCarDetails extends StatefulWidget {
  final Trending trending;
  const TrendingCarDetails({super.key, required this.trending});

  @override
  State<TrendingCarDetails> createState() => _TrendingCarDetailsState();
}

class _TrendingCarDetailsState extends State<TrendingCarDetails> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final dpadding = MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 250,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                child: Image.network(
                  '${Urls.baseUrl}/${widget.trending.images[0]}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: dpadding),
              child: const BackButtonWidget(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubTitleWidget(
                  title:
                      "${widget.trending.brand.toUpperCase()}  ${widget.trending.name.toUpperCase()}",
                  fontsize: 18),
              Text("₹ ${widget.trending.price.toString()}",
                  style: AppFonts.sansitaFontred)
            ],
          ),
        ),
        SubTitleWidget(
          title: 'About the vehicle',
          fontsize: 17,
          color: Colors.grey.shade500,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SliderCardWidget(
                    title: 'Transmission',
                    subtitle: widget.trending.transmission),
                SliderCardWidget(
                    title: 'Model', subtitle: widget.trending.model.toString()),
                SliderCardWidget(title: 'Fuel', subtitle: widget.trending.fuel),
                SliderCardWidget(
                    title: 'Location', subtitle: widget.trending.location)
              ],
            ),
          ),
        ),
        SubTitleWidget(
          title: 'More Images',
          fontsize: 17,
          color: Colors.grey.shade500,
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: CarouselSlider(
            items: widget.trending.images
                .map((e) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '${Urls.baseUrl}/$e',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 4,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
          ),
        ),
      ],
    ));
  }
}
