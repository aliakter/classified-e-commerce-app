import 'dart:convert';
import 'dart:io';
import 'package:classified_apps/apps/core/utils/utils.dart';
import 'package:classified_apps/apps/views/ad_details/model/ad_details_model.dart';
import 'package:classified_apps/apps/views/ads/repository/ads_repository.dart';
import 'package:classified_apps/apps/views/auth/login/controller/login_controller.dart';
import 'package:classified_apps/apps/views/home/controller/home_controller.dart';
import 'package:classified_apps/apps/views/home/models/brand_model.dart';
import 'package:classified_apps/apps/views/home/models/category_model.dart';
import 'package:classified_apps/apps/views/home/models/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../main.dart';

class AdEditController extends GetxController {
  final LoginController loginController;
  final HomeController homeController;
  final AdRepository adRepository;

  AdEditController(
      this.loginController, this.homeController, this.adRepository);

  final featureFormKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final whatsappController = TextEditingController();
  final webSiteController = TextEditingController();

  RxList<Category> categoryList = <Category>[].obs;

  /// ....................Feature Photo Picker ...................
  // String? originalImage;
  // String? featureImage;
  // String? base64featureImage;

  // pickImage() async {
  //   await Utils.pickSingleImage().then((value) async {
  //     if (value != null) {
  //       originalImage = value;
  //       File file = File(originalImage!);
  //       if (file != null) {
  //         featureImage = file.path;
  //         List<int> imageBytes = await file.readAsBytes();
  //         base64featureImage = 'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}';
  //
  //         print("feature image is: ${base64featureImage}");
  //         // context.read<AdEditProfileCubit>().base64Image = base64Image!;
  //       }
  //     }
  //   });
  //   update();
  //   return base64featureImage;
  // }



  ///Thumb Images
  final ImagePicker thumbPicker = ImagePicker();

  String? originalImage;
  RxString featureImage = "".obs;
  RxString base64ImageThumb = ''.obs;

  pickThumbImage() async {
    await Utils.pickSingleImage().then((value) async {
      if (value != null) {
        originalImage = value;
        File file = File(originalImage!);
        if (file != null) {
          featureImage.value = file.path;
          List<int> imageBytes = await file.readAsBytes();
          base64ImageThumb.value =
          'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}';

          print("feature image is: ${base64ImageThumb.value}");
          // context.read<AdEditProfileCubit>().base64Image = base64Image!;
        }
      }
    });
    update();
    return base64ImageThumb.value;
  }

  String capitalize(String input) {
    if (input == null || input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  /// .................... Photo Picker ...................
  // final ImagePicker picker = ImagePicker();
  // List<XFile>? images = [];
  // List<String> base64Images = [];
  //
  // Future<List<String>?> pickImages() async {
  //   List<String> imagePaths = [];
  //   List<XFile>? tempImages = await picker.pickMultiImage();
  //   if (tempImages == null) {
  //     return imagePaths;
  //   } else {
  //     images = tempImages;
  //     base64Images = [];
  //     for (XFile file in images!) {
  //       List<int> imageBytes = await file.readAsBytes();
  //       base64Images.add(
  //           'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}');
  //       imagePaths.add(file.path);
  //     }
  //     update();
  //     return base64Images;
  //   }
  // }

  List<String> imageList = [];
  List<Gallery> imageGallery = [];

  List<String> deletedImages = [];

  List<Subcategory> subcategoryList = [];
  Subcategory? subcategory;
  String selectedSubcategory = '';
  String selectedCategory = '';

  RxList<BrandModel> brandList = <BrandModel>[].obs;
  BrandModel? brandModel;
  String selectedBrand = "";

  ///Job
  String selectedDesignation = '';
  String selectedJobType = '';
  String selectedEducation = '';

  RxBool receiveIsEmail = false.obs;
  RxBool receiveIsPhone = false.obs;

  RxBool isShowEmail = false.obs;
  RxBool isShowPhone = false.obs;
  RxBool isShowWhatsApp = false.obs;

  final employerEmailController = TextEditingController();
  final employerPhoneController = TextEditingController();
  final experienceController = TextEditingController();
  final salaryFromController = TextEditingController();
  final salaryToController = TextEditingController();
  final expiryDateController = TextEditingController();
  final employerNameController = TextEditingController();

  ///mobile
  String selectedAuthenticity = "";
  final editionController = TextEditingController();
  String selectedRam = "";

  ///Property
  String selectedPropertyType = "";
  final sizeController = TextEditingController();
  final bedroomController = TextEditingController();
  final propertyLocationController = TextEditingController();
  final propertyPriceController = TextEditingController();
  String selectedPropertySize = "";
  String selectedPropertyPrice = "";

  ///electronic
  final selectedModelElectronics = TextEditingController();
  final selectedEditionElectronics = TextEditingController();

  ///Vehicles
  String selectedTransmission = "";
  final trimEditionController = TextEditingController();
  final manufactureYearController = TextEditingController();
  final engineCapacityController = TextEditingController();
  final registrationYearController = TextEditingController();
  String selectedBodyType = "";
  List<String> fuelTypes = [];

  String? statusEditType;

  final statusTypeEditList = [
    {"title": "Deactive", "value": "pending"},
    {"title": "Sold", "value": "sold"},
  ];

  RxBool isLoading = false.obs;
  RxBool isUpdateAdsLoading = false.obs;
  AdDetails? adDetails;
  String id = '';
  String token = "";
  String userId = "";

  @override
  void onInit() {
    super.onInit();
    getToken();
    id = Get.arguments;
    getAdEditData();
  }

  getToken() {
    token = sharedPreferences.getString("userToken") ?? "";
    userId = sharedPreferences.getString("userId") ?? "";
  }
  RxList<String> featureList = [""].obs;

  void addContact() {
    featureList.add("");
    update();
  }

  void removeContact(index) {
    featureList.removeAt(index);
    update();
  }

  deleteImages(index) {
    deletedImages.add(imageGallery[index].id.toString());
    imageGallery.removeAt(index);
    update();
  }
  /// Get SubCategory with Category
  RxList<Model> modelList = <Model>[].obs;
  Model? model;
  String selectedModel = '';

  getModel() {
    modelList.value = brandList
        .singleWhere((element) => element.id == int.parse(selectedBrand))
        .models
        .toSet()
        .toList();
    if (modelList.isNotEmpty) {
      model = modelList[0];
      selectedModel = modelList[0].id.toString();
      print('has data');
    } else {
      print('has no data');
    }
  }

  Future<void> getAdEditData() async {
    isLoading(true);
    final result = await adRepository.getAdEditData(token, id);
    result.fold((error) {
      isLoading(false);
      print(error.message);
    }, (data) async {
      adDetails = data;
      getOldData(data);
      // getHomeData().then((value) => getOldData(data));
    });
  }

  // Future<void> getHomeData() async {
  //   isLoading.value = true;
  //   final result = await homeController.homeRepository.getHomeData(token);
  //   result.fold((error) {
  //     isLoading.value = false;
  //     print(error.message);
  //   }, (data) async {
  //     categoryList.value = data.categories;
  //     isLoading.value = false;
  //   });
  // }

  RxString selectedCondition = "".obs;

  changeCondition(value) {
    selectedCondition.value = value.toString();
    update();
  }

  // ....................Logo Photo Picker ...................
  final ImagePicker logoPicker = ImagePicker();
  XFile? logoImage;
  String? base64ImageLogo;

  Future<String?> pickLogoImage() async {
    String? imagePath;
    XFile? tempImage = await logoPicker.pickImage(
        source: ImageSource.gallery, imageQuality: 100);
    if (tempImage == null) {
      print("Image doesn't choose!");
      return imagePath;
    } else {
      logoImage = tempImage;
      List<int> imageBytes = await logoImage!.readAsBytes();
      base64ImageLogo =
          'data:image/${logoImage!.path.split('.').last};base64,${base64Encode(imageBytes)}';
      return base64ImageLogo;
    }
  }


  //.............Expire Date Choose ...............
  final formatter = DateFormat('yyyy-MM-dd');
  var expiryDate;
  DateTime expirySelectedDate = DateTime.now();

  chooseDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: expirySelectedDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2050),
        initialDatePickerMode: DatePickerMode.year,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.white,
                onPrimary: Color(0xFF31A3DD),
                surface: Colors.white,
                onSurface: Color(0xFF000000),
              ),
              dialogBackgroundColor: const Color(0xFF31A3DD),
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      expirySelectedDate = newSelectedDate;
      expiryDateController
        ..text = formatter.format(expirySelectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: expiryDateController.text.length,
            affinity: TextAffinity.upstream));
      expiryDate = expiryDateController.text;
    }
  }

  getOldData(AdDetails adDetails) async {
    selectedCategory = adDetails.categoryId.toString();
    titleController.text = adDetails.title ?? "";
    priceController.text =
        adDetails.price != null ? adDetails.price.toString() : "";
    locationController.text = adDetails.address ?? "";
    descriptionController.text = adDetails.description ?? "";
    phoneController.text = adDetails.phone ?? "";
    isShowPhone.value = adDetails.showPhone;
    isShowEmail.value = adDetails.showEmail == 1 ? true : false;
    isShowWhatsApp.value = adDetails.showWhatsApp == 1 ? true : false;
    receiveIsEmail.value = adDetails.receivedIsEmail == 1 ? true : false;
    receiveIsPhone.value = adDetails.receivedIsPhone == 1 ? true : false;
    emailController.text = adDetails.email ?? "";
    whatsappController.text = adDetails.whatsapp ?? "";
    webSiteController.text = adDetails.employerWebsite ?? "";
    selectedCondition.value = adDetails.condition;
    selectedEditionElectronics.text = adDetails.edition ?? "";
    selectedModelElectronics.text = adDetails.model ?? "";

    if (adDetails.categoryId != 0) {
      Category category = Get.find<HomeController>().categoryList
          .singleWhere((element) => element.id == adDetails.categoryId);
      subcategoryList = category.subcategories!.toSet().toList();
      await Future.delayed(const Duration(milliseconds: 0)).then((value) {
        if (subcategoryList.isNotEmpty) {
          Subcategory brand = subcategoryList
              .singleWhere((element) => element.id == adDetails.subcategoryId);
          subcategory = brand;
          selectedSubcategory = subcategory!.id.toString();
        } else {
          subcategory = null;
        }
      });
      update();
    }
    imageGallery = adDetails.galleries.isEmpty ? [] : adDetails.galleries;
    isLoading(false);
  }

  Future<void> updateAds() async {
    final body = <String, dynamic>{};
    body.addAll({"title": titleController.text.trim()});
    body.addAll({"category_id": selectedCategory});
    body.addAll({"subcategory_id": selectedSubcategory});
    body.addAll({"address": locationController.text.trim()});
    body.addAll({"price": priceController.text.trim()});
    body.addAll({"email": emailController.text.trim()});
    body.addAll({"phone": phoneController.text.trim()});
    body.addAll({"show_phone": receiveIsPhone.value.toString()});
    body.addAll({"show_email": receiveIsEmail.value == true ? "1" : "0"});
    body.addAll({"whatsapp": whatsappController.text.trim()});
    body.addAll({"images": base64Images.toString()});
    body.addAll({"description": descriptionController.text.trim()});
    body.addAll({"condition": selectedCondition.value});
    body.addAll({"show_whatsapp": isShowWhatsApp.value == true ? "1" : "0"});
    body.addAll({'thumbnail': base64ImageThumb.trim()});
    body.addAll({'website': webSiteController.text.trim()});
    body.addAll({"delete_image": deletedImages.toString()});

    // body.addAll({"ads_type": selectedSize});

    // if (selectedCategory == '1' ||
    //     selectedCategory == '22' ||
    //     selectedCategory == '3') {
    //   body.addAll({"brand_id": brandModel.value!.id.toString()});
    // }
    // body.addAll({"show_phone": isShowPhone.value == true ? "1" : "0"});
    body.addAll({"features": featureList.toString()});
    body.addAll({"thumbnail": base64ImageThumb.value}); // feature image
    body.addAll({"website": webSiteController.text.trim()});
    body.addAll({"authenticity": selectedAuthenticity});

    body.addAll({"property_type": selectedPropertyType});
    body.addAll({"property_size": sizeController.text.trim()});
    body.addAll({"property_unit": selectedPropertySize});
    body.addAll({"property_price_type": selectedPropertyPrice});

    body.addAll({"designation": selectedDesignation});
    body.addAll({"job_type": selectedJobType});
    body.addAll({"experience": experienceController.text.trim()});
    body.addAll({"required_education": selectedEducation});
    body.addAll({"receive_is_email": receiveIsEmail.value?"1":"0"});
    body.addAll({"receive_is_phone": receiveIsPhone.value?"1":"0"});
    body.addAll({"salary_from": salaryFromController.text.trim()});
    body.addAll({"salary_to": salaryToController.text.trim()});
    body.addAll({"deadline": expiryDateController.text.trim()});
    body.addAll({"employer_name": employerNameController.text.trim()});
    body.addAll({"employer_logo": base64ImageLogo});

    body.addAll({"textbook_type": selectedEducation});

    body.addAll({"vehicle_manufacture": manufactureYearController.text.trim()});
    body.addAll(
        {"vehicle_engine_capacity": engineCapacityController.text.trim()});
    body.addAll({"vehicle_fule_type": fuelTypes.toString()});
    body.addAll({"vehicle_transmission": selectedTransmission});
    body.addAll({"vehicle_body_type": selectedBodyType});
    body.addAll({"registration_year": registrationYearController.text.trim()});
    body.addAll({"model": selectedModelElectronics.text.trim()}); // need
    body.addAll({"edition": selectedEditionElectronics.text.trim()}); // need
    body.addAll({"education": selectedEducation.trim()});

    isUpdateAdsLoading.value = true;
    final result = await adRepository.updateAds(token, body, id.toString());

    result.fold((error) {
      isUpdateAdsLoading.value = false;
      print(error.message);
      Utils.toastMsg(error.message);
    }, (data) async {
      clearAll();
      Navigator.pop(Get.context!);
      Utils.toastMsg(data);
      isUpdateAdsLoading.value = false;
    });
  }

  clearAll() {
    titleController.text = "";
    locationController.text = "";
    priceController.text = "";
    phoneController.text = "";
    whatsappController.text = "";
    descriptionController.text = "";
  }


  String? galleryImage;
  String? gallerySingleImage;
  String? base64gallerySingleImage;
  List<String> base64Images = [];
  List<File>? images = [];

  pickGalleryImageFromCamera() async {
    await Utils.pickSingleImageFromCamera().then((value) async {
      if (value != null) {
        galleryImage = value;
        File file = File(galleryImage!);
        if (file != null) {
          gallerySingleImage = file.path;
          images?.add(file);
          List<int> imageBytes = await file.readAsBytes();
          base64gallerySingleImage =
          'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}';

          print("feature image is: ${base64gallerySingleImage}");
          // context.read<AdEditProfileCubit>().base64Image = base64Image!;
          base64Images.add(base64gallerySingleImage.toString());
        }
      }
    });
    update();
    // setState(() {});
    return base64gallerySingleImage;
  }

  pickGalleryImageFromGallery() async {
    await Utils.pickSingleImageFromGallery().then((value) async {
      if (value != null) {
        galleryImage = value;
        File file = File(galleryImage!);
        if (file != null) {
          gallerySingleImage = file.path;
          images?.add(file);
          List<int> imageBytes = await file.readAsBytes();
          base64gallerySingleImage =
          'data:image/${file.path.split('.').last};base64,${base64Encode(imageBytes)}';

          print("feature image is: ${base64gallerySingleImage}");
          // context.read<AdEditProfileCubit>().base64Image = base64Image!;
          base64Images.add(base64gallerySingleImage.toString());
        }
      }
    });
    // setState(() {});
    update();
    return base64gallerySingleImage;
  }

  removeImages(index){
    images!.removeAt(index - 1);
    update();
  }

}
