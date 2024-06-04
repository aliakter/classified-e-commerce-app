import 'package:classified_apps/apps/core/utils/k_images.dart';
import 'package:classified_apps/apps/views/home/component/product_card.dart';
import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:flutter/material.dart';

class GridProductContainer2 extends StatelessWidget {
  const GridProductContainer2(
      {super.key, required this.adModelList, required this.onPressed});

  final List<AdsModel> adModelList;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              if (adModelList.isNotEmpty) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 300),
                  itemCount: adModelList.length,
                  itemBuilder: (context, index) {
                    return ProductCard(adModel: adModelList[index]);
                  },
                );
              } else {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(child: Image.asset(KImages.noDataImage)),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
