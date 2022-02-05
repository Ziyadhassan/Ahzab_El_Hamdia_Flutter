import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  List<String> images;
  CarouselController controller = CarouselController();

  CustomSlider({
    required this.images,
    CarouselController? controller,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  // late CarouselController _controller;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    // _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
    Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: widget.controller,
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        initialPage: 0,
        reverse: true,
        enlargeCenterPage: true,
      ),
      items: widget.images
          .map(
            (item) => new Image.asset(item, fit: BoxFit.contain),
          )
          .toList(),
    );
  }
}
