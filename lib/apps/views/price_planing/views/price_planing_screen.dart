import 'package:carousel_slider/carousel_slider.dart';
import 'package:classified_apps/apps/views/price_planing/controller/price_planing_controller.dart';
import 'package:classified_apps/apps/views/price_planing/views/paypal_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../splash/localization/app_localizations.dart';

class PricePlaningScreen extends GetView<PricePlaningController> {
  const PricePlaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE8EEF2),
      appBar: AppBar(
        title: Text(
          "${AppLocalizations.of(context).translate('Pricing')}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: redColor,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return controller.getPlanData();
        },
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Choose Your Plan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height * 0.70,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: false,
                                autoPlayInterval: const Duration(seconds: 5),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 1000),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              ),
                              items: [
                                ...List.generate(
                                  controller.planingModel!.data.length,
                                  (index) {
                                    final package =
                                        controller.planingModel!.data[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const SizedBox(
                                            width: double.infinity,
                                            height: 10,
                                          ),
                                          Text(
                                            package.label,
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: Utils.formatPrice(
                                                    package.price),
                                                style: const TextStyle(
                                                    color: redColor,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                children: const <TextSpan>[]),
                                          ),

                                          Visibility(
                                            visible: package.recommended == 1,
                                            child: const Text(
                                              "Recommended",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: redColor,
                                              ),
                                            ),
                                          ),

                                          const Divider(height: 10),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 5),
                                            child: Row(
                                              children: [
                                                const CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: redColor,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "Ad limit ${package.adLimit}",
                                                  style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 5),
                                            child: Row(
                                              children: [
                                                const CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: redColor,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "${package.featuredLimit} feature Ads",
                                                  style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 5),
                                            child: Row(
                                              children: [
                                                const CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: redColor,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "${package.businessDirectoryLimit} business directory limit ",
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 5),
                                            child: Row(
                                              children: [
                                                const CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: redColor,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "Event Limit ${package.eventLimit}",
                                                  style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: package.badge,
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 5),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor: redColor,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.check,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Text(
                                                    "Premium badge",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 16),
                                            child: SizedBox(
                                              height: 48,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  elevation: 10,
                                                  foregroundColor:
                                                      Colors.black87,
                                                  shadowColor: Colors.grey
                                                      .withOpacity(0.2),
                                                ),
                                                onPressed: () async {
                                                  paymentSheet(
                                                      context,
                                                      package.price.toString(),
                                                      package.id);
                                                },
                                                child: const Text("Get Now"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<dynamic> paymentSheet(BuildContext context, String price, int planID) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: Get.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Choose a payment method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ///Stripe
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      controller.stripeMakePayment(price, planID);
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: redColor,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/logo/stripe.png", color: Colors.deepPurple),
                          const SizedBox(width: 8),
                          const Text(
                            'Stripe',
                            style: TextStyle(
                              fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(width: Get.width * 0.1),

                ///Paypal
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PaypalPayment(planID: planID, price: price),
                        ),
                      );
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: redColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/logo/paypal.png"),
                          const SizedBox(width: 8),
                          const Text(
                            'Paypal',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
