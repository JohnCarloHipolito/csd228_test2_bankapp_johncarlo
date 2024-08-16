import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/home.png'),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0, // Increased height for larger images
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: [
                'assets/images/offers/offer1.png',
                'assets/images/offers/offer2.png',
                'assets/images/offers/offer3.png',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(i);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}