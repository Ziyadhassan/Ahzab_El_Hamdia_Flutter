import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wakelock/wakelock.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  List<String> images;
  CarouselController controller = CarouselController();

  CustomSlider({
    @required this.images,
    this.controller,
    Key key,
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  CarouselController _controller;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    _controller = widget.controller;
  }
  @override
  void dispose() {
    super.dispose();
    Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) {
    return new CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 1,
        enableInfiniteScroll: false,
        initialPage: 0,
        reverse: true,
        enlargeCenterPage: true,
      ),
      items: widget.images
          .map((item) => new Image.asset(item, fit: BoxFit.contain),
      )
          .toList(),
    );
  }
}
