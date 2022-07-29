// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// // import 'package:hive_flutter/adapters.dart';
// import 'package:testone/model/database/category.dart';
// // import 'package:testone/view/screens/home_screen.dart';

// class CategoryController extends GetxController {
//   var categoryItems = <DropdownMenuItem>[].obs;
//   var subCatogaryItems = [].obs;
//   final selected = "".obs;
//   var dropdownValue = ''.obs;
//   static final box = Hive.box<CatogaryDetails>("catogaryDetails");
//   final list = box.values.toList();

//   @override
//   void onInit() {
//     // addCategory();
//     super.onInit();
//   }

//   void addCategory(String value, String key) async {
//     // print(categoryItems);

//     // final list = box.values.toList();
//     list.add(CatogaryDetails(
//       subCatogary: [],
//       catogary: value,
//       key: key,
//     ));
//     print("add ayi");

//     log(list[0].catogary);

//     //  var item= Hive.box<CatogaryDetails>("catogaryDetails").values.toList();
//     // var item = box(CatogaryDetails();
//     // print(item.toString());
// // categoryItems = list[value].catogary;

//     // for (int i = 0; i < list.length; i++) {
//     //   categoryItems.add(DropdownMenuItem(child: Text(list[i].catogary)));
//     //   // categoryItems.add()
//     // }

//     // categoryItems.value = list.map((e) {
//     //   // return null;
//     //   return DropdownMenuItem(
//     //       onTap: () {
//     //         dropdownValue.value = e.catogary;
//     //       },
//     //       child: Text(e.catogary));
//     // }).toList();

//     // print(categoryItems.length.toString());
// // print(categoryItems[10].value!.toString());

//     // print(categoryItems.length.toString());
//   }

//   void setSelected(String value) {
//     dropdownValue.value = value;
//   }

//   void addSubCategory() {}
// }
