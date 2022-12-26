import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  SampleItemListView({
    Key? key,
    this.items = const [
      SampleItem(1, Colors.red),
      SampleItem(2, Colors.amber),
      SampleItem(3, Colors.blue),
      SampleItem(4, Colors.green),
      SampleItem(5, Colors.orange),
    ],
  }) : super(key: key);

  static const routeName = '/';

  final List<SampleItem> items;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Container(
        //margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: Builder(
          builder: (context) {
            final double height = MediaQuery.of(context).size.height;
            final double width = MediaQuery.of(context).size.width;

            return CarouselSlider(
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: true,
                //autoPlay: true,
              ),
              items: imgList
                  .map((item) => Container(
                        child: Center(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            height: height,
                            width: width,
                          ),
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
