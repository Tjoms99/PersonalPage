import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'project.dart';

/// Displays a list of SampleItems.
class ProjectView extends StatefulWidget {
  final List<Project> projects;

  const ProjectView({
    required this.projects,
  });
  static const routeName = '/Projects';

  @override
  State<StatefulWidget> createState() => _ProjectView();
}

class _ProjectView extends State<ProjectView> {
  static bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              items: widget.projects
                  .map(
                    (project) => SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              _isExpanded = !_isExpanded;
                            }),
                            child: Stack(
                              children: [
                                Image.network(
                                  project.img[0],
                                  fit: BoxFit.cover,
                                  height: height,
                                  width: width,
                                ),
                                if (!_isExpanded)
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              project.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                            const Align(
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Container(height: 20),
                          SizedBox(
                            width: width * 0.7,
                            child: Text(
                              project.description1,
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: height * 0.5,
                              viewportFraction: 0.7,
                              enlargeCenterPage: true,
                              autoPlay: true,
                            ),
                            items: project.img
                                .map(
                                  (img) => img.contains(".mp4")
                                      ? Image.network(
                                          img,
                                          fit: BoxFit.contain,
                                          height: height,
                                          width: width,
                                        )
                                      : Image.network(
                                          img,
                                          fit: BoxFit.contain,
                                          height: height,
                                          width: width,
                                        ),
                                )
                                .toList(),
                          ),
                          SizedBox(
                            width: width * 0.7,
                            child: Text(
                              project.description2,
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
