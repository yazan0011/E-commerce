import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_co/widgets/homeW/sale_banner.dart';
import 'package:flutter/material.dart';

class AutoScrollSaleBanner extends StatelessWidget {
  final List<Map<String, dynamic>> sales = [
    {
      "title": "New Collection",
      "subtitle": "Discount 50% for first transaction",
      "color": Colors.brown.shade100,
      "image": "images/360_F_348290463_E22bfJYLNWrKKzHIVsEanwwDV6ZPyKP2.jpg",
    },
    {
      "title": "Summer Sale",
      "subtitle": "Up to 70% off on summer ",
      "color": Colors.orange.shade100,
      "image": "images/360_F_348290463_E22bfJYLNWrKKzHIVsEanwwDV6ZPyKP2.jpg",
    },
    {
      "title": "Exclusive Offer",
      "subtitle": "Only for selected members",
      "color": Colors.pink.shade100,
      "image": "images/360_F_348290463_E22bfJYLNWrKKzHIVsEanwwDV6ZPyKP2.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: sales.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return SaleBanner(
              title: item['title'],
              subtitle: item['subtitle'],
              color: item['color'],
              imageUrl: item['image'],
            );
          },
        );
      }).toList(),
    );
  }
}
