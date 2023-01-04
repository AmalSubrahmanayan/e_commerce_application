import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final List<String> product;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider.builder(
        itemCount: product.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    "http://172.16.10.112:5006/products/${product[index]}"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          enlargeCenterPage: true,
          // onPageChanged: (index, reason) {
          //   setState(() {
          //     _currentIndex = index;
          //   });
          // },
        ),
      )
    ]);
  }
}
