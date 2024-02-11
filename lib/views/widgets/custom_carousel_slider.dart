import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/announcement_item.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  late CarouselController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CarouselSlider(
        items: dummyAnnouncements
            .map(
              (e) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  e.imgUrl,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
            .toList(),
        carouselController: _controller,
        options: CarouselOptions(
          height: 150,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            setState(
              () {
                _current = index;
              },
            );
          },
        ),
      ),
    );
  }
}
