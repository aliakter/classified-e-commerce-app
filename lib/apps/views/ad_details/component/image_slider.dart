import 'package:carousel_slider/carousel_slider.dart';
import 'package:classified_apps/apps/core/utils/custom_image.dart';
import 'package:classified_apps/apps/data/remote_urls.dart';
import 'package:classified_apps/apps/views/ad_details/model/ad_details_model.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
    required this.gallery,
    // required this.height, required this.adDetails,
  }) : super(key: key);

  final List<Gallery> gallery;

  // final double height;
  // final AdDetails adDetails;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  // final double height = 144;
  final int initialPage = 0;
  int _currentIndex = 0;

  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  final gallery = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
      height: MediaQuery.of(context).size.width * 0.8,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.width * 0.8,
              viewportFraction: 1,
              initialPage: initialPage,
              enableInfiniteScroll: widget.gallery.length > 1,
              reverse: false,
              autoPlay: widget.gallery.length > 1,
              // autoPlay: false,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            items: widget.gallery.isNotEmpty
                ? widget.gallery
                    .map(
                      (i) => Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: CustomImage(
                          path: i.image != ''
                              ? "${RemoteUrls.rootUrl}${i.image}"
                              : null,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    .toList()
                : [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const CustomImage(
                        // path: widget.adDetails.thumbnail != ''
                        //     ? '${RemoteUrls.rootUrl3}${widget.adDetails.thumbnail}'
                        //     : null,
                        path: "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: GestureDetector(
                onTap: () {
                  carouselController.nextPage();
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                )),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: GestureDetector(
                onTap: () {
                  carouselController.previousPage();
                },
                child: const Icon(Icons.arrow_back_ios, color: Colors.blue)),
          )
        ],
      ),
    );
  }

  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }
}
