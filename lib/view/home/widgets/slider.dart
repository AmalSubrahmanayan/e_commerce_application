
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/model/home/home_carousal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, required this.carousal});
  final List<CarousalModel> carousal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<HomeProvider>(
        builder: (context,value,_) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: carousal.isEmpty?const Center(child: CircularProgressIndicator()): Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        
                        image: DecorationImage(image:  NetworkImage(
                            "http://172.16.10.112:5006/carousals/${carousal[index].image}"),
                        fit: BoxFit.fill,)
                      ),
                      width: double.infinity,
                      
                    ),
                  );
                },
                itemCount: carousal.length,
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  // reverse: true,
                  viewportFraction: 1.0,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 3),
                ),
              ),
             
            ],
          );
        }
      ),
    );
  }
}
