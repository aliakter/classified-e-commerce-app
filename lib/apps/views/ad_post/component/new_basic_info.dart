import 'dart:io';
import 'package:classified_apps/apps/core/utils/constants.dart';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/ad_post/component/category_wise/electronic.dart';
import 'package:classified_apps/apps/views/ad_post/component/category_wise/fashion.dart';
import 'package:classified_apps/apps/views/ad_post/component/category_wise/jobs.dart';
import 'package:classified_apps/apps/views/ad_post/component/category_wise/mobile.dart';
import 'package:classified_apps/apps/views/ad_post/component/category_wise/property.dart';
import 'package:classified_apps/apps/views/ad_post/component/category_wise/vehicles.dart';
import 'package:classified_apps/apps/views/ad_post/controller/ad_post_controller.dart';
import 'package:classified_apps/apps/views/home/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../splash/localization/app_localizations.dart';

class NewBasicInfoView extends GetView<AdPostController> {
  const NewBasicInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdPostController>(builder: (controller) {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: controller.featureFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///title
                    Row(
                      children: [
                        Text(AppLocalizations.of(context).translate('title')!),
                        const Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: controller.titleController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter title';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: "Title"),
                    ),
                    const SizedBox(height: 16),

                    ///sub-category
                    Text(
                        AppLocalizations.of(context).translate('subcategory')!),
                    const SizedBox(height: 6),
                    Obx(
                      () => DropdownButtonFormField<Subcategory>(
                        isExpanded: true,
                        decoration:
                            const InputDecoration(hintText: "Sub Category"),
                        value: controller.subcategory,
                        items: controller.subcategoryList
                            .map<DropdownMenuItem<Subcategory>>((e) {
                          return DropdownMenuItem<Subcategory>(
                            value: e,
                            child: Text(e.name),
                          );
                        }).toList(),
                        onChanged: (Subcategory? value) {
                          controller.selectedSubcategory = value!.id.toString();
                        },
                      ),
                    ),

                    ///Country
                    // const Text(
                    //   "Country",
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // const SizedBox(height: 7),
                    // DropdownButtonFormField(
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return null;
                    //     }
                    //     return null;
                    //   },
                    //   isExpanded: true,
                    //   decoration: const InputDecoration(
                    //     hintText: "Select Country",
                    //   ),
                    //   items:
                    //   postAdBloc.countryList.map<DropdownMenuItem<TopCountry>>((e) {
                    //     return DropdownMenuItem(
                    //       value: e,
                    //       child: Text(e.name),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     Future.delayed(const Duration(milliseconds: 300))
                    //         .then((value2) {
                    //       postAdBloc
                    //           .add(NewPostAdEventProductCountryId(value!.id.toString()));
                    //     });
                    //   },
                    // ),
                    // const SizedBox(height: 16,),
                    //
                    // ///States
                    // const Text(
                    //   "States",
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // const SizedBox(height: 7),
                    // DropdownButtonFormField(
                    //   value: postAdBloc.stateModel,
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return null;
                    //     }
                    //     return null;
                    //   },
                    //   isExpanded: true,
                    //   decoration: const InputDecoration(
                    //     hintText: "Select State",
                    //   ),
                    //   items: postAdBloc.stateList.map<DropdownMenuItem<StateModel>>((e) {
                    //     return DropdownMenuItem(
                    //       value: e,
                    //       child: Text(e.name),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     postAdBloc.add(NewPostAdEventProductStateId(value!.id.toString(),value));
                    //   },
                    // ),
                    // const SizedBox(height: 16),
                    //
                    // ///City
                    // const Text(
                    //   "City",
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // const SizedBox(height: 7),
                    // DropdownButtonFormField(
                    //   value: postAdBloc.cityModel,
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return null;
                    //     }
                    //     return null;
                    //   },
                    //   isExpanded: true,
                    //   decoration: const InputDecoration(
                    //     hintText: "Select City",
                    //   ),
                    //   items: postAdBloc.cityList.map<DropdownMenuItem<City>>((e) {
                    //     return DropdownMenuItem(
                    //       value: e,
                    //       child: Text(e.name),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     postAdBloc.add(NewPostAdEventProductCityId(value!.id.toString(),value));
                    //   },
                    // ),

                    ///Price
                    Visibility(
                      visible: controller.selectedCategory != '10' &&
                          controller.selectedCategory != '2',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                              AppLocalizations.of(context).translate('price')!),
                          const SizedBox(height: 6),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.priceController,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return null;
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: "Price"),
                          )
                        ],
                      ),
                    ),

                    ///Address
                    const SizedBox(height: 16),
                    Text(AppLocalizations.of(context).translate('address')!),
                    const SizedBox(height: 6),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.locationController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: "Address"),
                    ),

                    Visibility(
                      visible: controller.selectedCategory == "33" ||
                          controller.selectedCategory == "20" ||
                          controller.selectedCategory == "19" ||
                          controller.selectedCategory == "18" ||
                          controller.selectedCategory == "15" ||
                          controller.selectedCategory == "9" ||
                          controller.selectedCategory == "8" ||
                          controller.selectedCategory == "6" ||
                          controller.selectedCategory == "5" ||
                          controller.selectedCategory == "4" ||
                          controller.selectedCategory == "3" ||
                          controller.selectedCategory == "1",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)
                                .translate('condition')!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.changeCondition("new");
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      activeColor: redColor,
                                      value: "new",
                                      groupValue: controller.selectedCondition,
                                      onChanged: (value) {
                                        controller.changeCondition("new");
                                      },
                                    ),
                                    const Text("New"),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.changeCondition("used");
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      activeColor: redColor,
                                      value: "used",
                                      groupValue: controller.selectedCondition,
                                      onChanged: (value) {
                                        controller.changeCondition("used");
                                      },
                                    ),
                                    const Text("Used"),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.changeCondition("gently_used");
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      activeColor: redColor,
                                      value: "gently_used",
                                      groupValue: controller.selectedCondition,
                                      onChanged: (value) {
                                        controller
                                            .changeCondition("gently_used");
                                      },
                                    ),
                                    const Text("Gently used"),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    ///Category wise design start from here
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (controller.selectedCategory == '10') {
                          return JobsField(controller: controller);
                        } else if (controller.selectedCategory == '5') {
                          return FashionField(controller: controller);
                        } else if (controller.selectedCategory == '4') {
                          return ElectronicField(controller: controller);
                        } else if (controller.selectedCategory == '3') {
                          return MobileField(controller: controller);
                        } else if (controller.selectedCategory == '2') {
                          return PropertyField(controller: controller);
                        } else if (controller.selectedCategory == '1') {
                          return VehiclesField(controller: controller);
                        }
                        return const SizedBox();
                      },
                    ),

                    const SizedBox(height: 16),

                    ///Feature section
                    const Text("Features"),
                    const SizedBox(height: 8),
                    ...List.generate(controller.featureList.length, (index) {
                      final reversedIndex = controller.featureList.length - 1 - index;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: ashColor)),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                        maxLines: 1,
                                        onChanged: (value) {
                                          controller.featureList[index] =
                                              value.toString().trim();
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0),
                                          hintText: reversedIndex == 0
                                              ? "Features"
                                              : "Another Feature",
                                          hintStyle: const TextStyle(
                                            color: ashTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Material(
                                    color:
                                        index == controller.featureList.length - 1
                                            ? const Color(0xFF157347)
                                            : const Color(0xFFBB2D3B),
                                    shape: const CircleBorder(),
                                    child: InkWell(
                                      onTap: () {
                                        if (index ==
                                            controller.featureList.length - 1) {
                                          controller.addContact();
                                        } else {
                                          controller.removeContact(index);
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(50),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: index ==
                                                controller.featureList.length - 1
                                            ? const Icon(Icons.add,
                                                size: 20, color: Colors.white)
                                            : const Icon(Icons.close,
                                                size: 20, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).reversed.toList(),

                    ///Description
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(AppLocalizations.of(context)
                            .translate('description')!),
                        const Text(
                          "*",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      controller: controller.descriptionController,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: "Description"),
                    ),
                    const SizedBox(height: 16),

                    Text(AppLocalizations.of(context)
                        .translate('featured_image')!),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.pickImage().then((value) {});
                          },
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueGrey.shade100,
                            ),
                            alignment: Alignment.center,
                            child: const Text("Choose File"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        controller.featureImage != null
                            ? Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Container(
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                          color: ashTextColor.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Image.file(
                                          File(controller.featureImage!),
                                          fit: BoxFit.cover,
                                          height: 70,
                                          width: 70),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: InkWell(
                                            onTap: () {
                                              controller.deleteFeatureImage();
                                            },
                                            child: const Icon(Icons.close,
                                                color: Colors.red))),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                    const SizedBox(height: 16),

                    ///Images
                    const Text("Gallery Images (You can add up to 6 images only)"),
                    const SizedBox(height: 16),
                    // GridView.builder(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   gridDelegate:
                    //       const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 3,
                    //     crossAxisSpacing: 10,
                    //     mainAxisSpacing: 10,
                    //   ),
                    //   itemBuilder: (_, index) {
                    //     if (index == 0) {
                    //       return Material(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(3),
                    //         child: InkWell(
                    //           borderRadius: BorderRadius.circular(3),
                    //           onTap: () {
                    //             controller.pickImages().then((value) {});
                    //           },
                    //           child: Container(
                    //             padding: const EdgeInsets.all(8),
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(3),
                    //               border: Border.all(color: ashColor),
                    //             ),
                    //             child: const Center(
                    //               child: Icon(
                    //                 Icons.add_circle_outlined,
                    //                 color: redColor,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     }
                    //     return Stack(
                    //       children: [
                    //         ClipRRect(
                    //           borderRadius: BorderRadius.circular(3),
                    //           child: Container(
                    //             padding: const EdgeInsets.all(0),
                    //             decoration: BoxDecoration(
                    //                 color: ashTextColor.withOpacity(0.4),
                    //                 borderRadius: BorderRadius.circular(3)),
                    //             child: Image(
                    //               image: FileImage(
                    //                   File(controller.images![index - 1].path)),
                    //               fit: BoxFit.cover,
                    //               height: 118,
                    //               width: 135,
                    //             ),
                    //           ),
                    //         ),
                    //         Align(
                    //           alignment: Alignment.topRight,
                    //           child: InkWell(
                    //             onTap: () {
                    //               controller.deleteImage(index);
                    //             },
                    //             child:
                    //                 const Icon(Icons.close, color: Colors.red),
                    //           ),
                    //         )
                    //       ],
                    //     );
                    //   },
                    //   itemCount: controller.images!.length + 1,
                    // ),

                    Obx(() =>  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (_, index) {
                        if (index == 0) {
                          return Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(3),
                              onTap: controller.images!.length<6?() {
                                Utils.showCustomDialog(context,child: Wrap(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("Select Image Source",style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),),
                                          const SizedBox(height: 30,),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.pickGalleryImageFromCamera().then((value) {
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      color: const Color(0xFFDAD9D9),
                                                      height: MediaQuery.of(context).size.height * 0.1,
                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                      child: const Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [Icon(Icons.camera_alt), Text('Camera')],
                                                      )),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 2,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.pickGalleryImageFromGallery().then((value) {
                                                      Navigator.of(context).pop();
                                                    });
                                                  },
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      color: const Color(0xFFDAD9D9),
                                                      height: MediaQuery.of(context).size.height * 0.1,
                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                      child: const Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [Icon(Icons.photo), Text('Gallery')],
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20,),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: TextButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1)
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                              }:() {
                                Utils.errorSnackBar(context,
                                    "You can't add more then 6 images");
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: ashColor),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add_circle_outlined,
                                        color: redColor,
                                      ),
                                      const SizedBox(height: 5),
                                      Text("${controller.images!.length}/6")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        else{
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                      color: ashTextColor.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Image(
                                    image: FileImage(File(controller.images![index - 1].path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: GestureDetector(
                                        onTap: () {
                                          controller.removeImages(index);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: Colors.red.shade900,
                                        )))
                              ],
                            ),
                          );
                        }
                      },
                      itemCount: controller.images!.length + 1,
                    )),



                    ///Contact info phone email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          AppLocalizations.of(context)
                              .translate('contact_information')!,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),

                        ///Phone
                        Row(
                          children: [
                            SizedBox(
                                width: 30,
                                height: 24,
                                child: Obx(
                                  () => Checkbox(
                                    value: controller.isShowPhone.value,
                                    onChanged: (value) {
                                      controller.isShowPhone.value =
                                          !controller.isShowPhone.value;
                                    },
                                    activeColor: const Color(0xFF0b5ed7),
                                  ),
                                )),
                            const SizedBox(width: 0),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('show_phone_to_public')!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context).translate('phone')!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              // initialValue: state.phone,
                              controller: controller.phoneController,
                              textInputAction: TextInputAction.next,
                              // validator: (value) {
                              //   if (value == null && state.isShowPhone) {
                              //     return "Phone field is required";
                              //   }
                              //   return null;
                              // },
                              // onChanged: (value) => postAdBloc.add(NewPostAdEventPhone(value)),
                              decoration:
                                  const InputDecoration(hintText: "Phone"),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),

                        ///Email
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 24,
                              child: Obx(() => Checkbox(
                                    value: controller.isShowEmail.value,
                                    onChanged: (value) {
                                      controller.isShowEmail.value =
                                          !controller.isShowEmail.value;
                                    },
                                    activeColor: const Color(0xFF0b5ed7),
                                  )),
                            ),
                            const SizedBox(width: 0),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('show_email_to_public')!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context).translate('email')!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 6),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.emailController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)
                                      .translate('email')!),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),

                        ///Whatsapp
                        ///Whatsapp
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 24,
                              child: Obx(() => Checkbox(
                                value:
                                controller.isShowWhatsapp.value,
                                onChanged: (value) {
                                  controller.isShowWhatsapp.value =
                                  !controller
                                      .isShowWhatsapp.value;
                                },
                                activeColor: const Color(0xFF0b5ed7),
                              )),
                            ),
                            const SizedBox(
                              width: 0,
                            ),
                            Text(
                              'Show Whatsapp To Public',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Whatsapp',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 7),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.whatsappController,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                  hintText: 'Whatsapp'),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),

                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.isShowFeatured.value,
                                activeColor: const Color(0xFF0b5ed7),
                                onChanged: (value) {
                                  controller.isShowFeatured.value =
                                      !controller.isShowFeatured.value;
                                },
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Make",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text("Featured"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    ///Payment for feature ads
                    // Container(
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.grey.shade400),
                    //       borderRadius: BorderRadius.circular(5),
                    //       color: Colors.grey.shade300),
                    //   child: Row(
                    //     children: [
                    //       Obx(() => Checkbox(
                    //         value: controller.isPaymentChecked.value,
                    //         onChanged: (value) {
                    //           controller.changePaymentCheck();
                    //         },
                    //         activeColor: const Color(0xFF0b5ed7),
                    //       )),
                    //       const SizedBox(width: 6),
                    //       Expanded(
                    //         child: Container(
                    //           color: Colors.white,
                    //           padding: const EdgeInsets.all(10),
                    //           child: Column(
                    //             crossAxisAlignment:
                    //             CrossAxisAlignment.start,
                    //             children: [
                    //               Obx(() => Text(
                    //                 // "Mark as featured £ ${controller.pricePlaningModel!.data.toStringAsFixed(2)}",
                    //                 "Mark as featured £ ",
                    //                 style: TextStyle(
                    //                     fontWeight: FontWeight.bold),
                    //               )),
                    //               const SizedBox(
                    //                   child: Text(
                    //                     "Make your listing unique on home and search page!",
                    //                     overflow: TextOverflow.ellipsis,
                    //                     maxLines: 2,
                    //                   )),
                    //               Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     vertical: 0),
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.grey.shade200,
                    //                   borderRadius:
                    //                   BorderRadius.circular(8),
                    //                   border:
                    //                   Border.all(color: Colors.grey),
                    //                 ),
                    //                 alignment: Alignment.centerLeft,
                    //                 child: Obx(() {
                    //                   List<Plannings> items =
                    //                       controller.items.value;
                    //                   return DropdownButton(
                    //                     padding:
                    //                     const EdgeInsets.symmetric(
                    //                         horizontal: 10),
                    //                     value: controller
                    //                         .priority.value ==
                    //                         ""
                    //                         ? null
                    //                         : controller.priority.value,
                    //                     isExpanded: true,
                    //                     focusColor: Colors.red,
                    //                     iconEnabledColor: Colors.black,
                    //                     underline: const SizedBox(),
                    //                     icon: Container(),
                    //                     items:
                    //                     items.map((Plannings items) {
                    //                       return DropdownMenuItem(
                    //                         value: items,
                    //                         child: Text(items.title,
                    //                             style: const TextStyle(
                    //                                 color: Colors.black,
                    //                                 fontSize: 14)),
                    //                       );
                    //                     }).toList(),
                    //                     onChanged: (newValue) {
                    //                       controller
                    //                           .changeItemValue(newValue!);
                    //                     },
                    //                   );
                    //                 }),
                    //               ),
                    //               // Drop
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
