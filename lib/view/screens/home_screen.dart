import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:testone/controller/category_controller.dart';
import 'package:testone/model/database/category.dart';
import 'package:testone/view/screens/category_list.dart';
// import 'package:testone/view/custome_widget/popup_widget.dart';

// import 'package:get/get_core/src/get_main.dart';
// final box = Hive.box<CatogaryDetails>('CategoryDetails');

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  static final box = Hive.box<CatogaryDetails>("catogaryDetails");

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

CatogaryDetails? dropdownValue;

class _HomeScreenState extends State<HomeScreen> {
  final list = HomeScreen.box.values.toList();

  List<String> categoryItems = [];
  

  // final categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
     for (var i = 0; i < list.length; i++) {
                            categoryItems = list[i].subCatogary ?? [];
                            log(categoryItems.toString());
                          }
    // list.clear();
    // String currentCategory = '';
    // int currentindex = 0;

    //   final List<String>? subCategories =
    //       list.elementAt(currentindex).subCatogary;

    // Object selectedValue = '';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Test App'),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child:
                              //  Obx(
                              //   () =>
                              // DropdownButton<dynamic>(
                              //   hint: const Text("Add Category"),
                              //   isExpanded: true,
                              //   value: categoryController.dropdownValue.value,
                              //   items: categoryController.list
                              //       .map((CatogaryDetails e) {
                              //     return DropdownMenuItem(
                              //         onTap: () {
                              //           categoryController
                              //               .setSelected(e.catogary.toString());
                              //         },
                              //         child: Text(e.catogary));
                              //   }).toList(),
                              //   onChanged: (Object? newValue) {
                              //     categoryController
                              //         .setSelected(newValue.toString());
                              //   },
                              // ),
                              ValueListenableBuilder(
                                  valueListenable: HomeScreen.box.listenable(),
                                  builder:
                                      (context, Box<CatogaryDetails> box, _) {
                                    final listOfcategories =
                                        box.values.toList();

                                    log(listOfcategories.length.toString());
                                    // log(dropdownValue != null
                                    //     ? dropdownValue!.catogary
                                    //     : 'skjdgh');
                                    return DropdownButton<dynamic>(
                                      isExpanded: true,
                                      hint: const Text('Add Category'),
                                      value: dropdownValue,
                                      items: listOfcategories
                                          .map((CatogaryDetails e) {
                                        return DropdownMenuItem(
                                            value: e,
                                            onTap: () {
                                              dropdownValue = e;
                                              // currentCategory =
                                              // //     dropdownValue!.catogary;
                                              // print(
                                              //     'herererererere : ${dropdownValue!.key}');
                                              // currentindex = int.parse(
                                              //     dropdownValue!.key
                                              //         .toString());
                                            },
                                            child: Text(e.catogary));
                                      }).toList(),
                                      onChanged: (val) {
                                        log(val.toString());
                                        setState(() {
                                          log(listOfcategories[0]
                                              .subCatogary
                                              .toString());
                                          dropdownValue = val;
                                          // print(dropdownValue.toString());
                                        });
                                      },
                                    );
                                  }),
                          // ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                            onTap: () {
                              Get.dialog(Custom_popup(
                                title: "Category",
                              ));
                            },
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                            child: Text(
                          'Sub Categories',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        InkWell(
                            onTap: () {
                              // log('curresnt $currentCategory');
                              Get.dialog(Custom_popup(
                                catogaryDetails: dropdownValue,
                                title: "Sub Category",
                                category: dropdownValue!.catogary,
                              ));
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ))
                      ],
                    ),
                    SizedBox(
                      child: 
                        ListView.separated(
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => ListTile(
                                    title:
                                        Text(categoryItems[index].toString()),
                                  ),
                              separatorBuilder: (context, iindex) =>
                                  const Divider(color: Colors.red),
                              itemCount: categoryItems.length),
                        
                      ),
                    
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Get.to(const CategoryList());
                        });
                      },
                      child: const Text("GO to Next page "),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Custom_popup extends StatelessWidget {
  final title;
  final category;
  final CatogaryDetails? catogaryDetails;

  static final box = Hive.box<CatogaryDetails>("catogaryDetails");
  static final box2 = Hive.box<Subcategory>("subCategory");
  final list = box.values.toList();
  Custom_popup({
    Key? key,
    required this.title,
    this.category,
    this.catogaryDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final categoryController = Get.find(CategoryController());
    // box.clear();

    int? categoryKey;
    List<String> prevSubCategories = [];

    for (var i = 0; i < list.length; i++) {
      log((list[i].catogary == category.toString()).toString());
      if (list[i].catogary == category.toString()) {
        log('herehvf :$i');
        categoryKey = i;
        prevSubCategories = list[i].subCatogary ?? [];
      }
    }

    // print("-----------------------------$cattegoryKey");

    String chaingedValue = '';
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                chaingedValue = value;
              },
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () async {
                      prevSubCategories.add(chaingedValue);
                      title == "Category"
                          ? box.add(CatogaryDetails(catogary: chaingedValue))
                          : box.put(
                              categoryKey!,
                              CatogaryDetails(
                                  catogary: category,
                                  subCatogary: prevSubCategories));
                      dropdownValue = null;
                      Get.offAll(HomeScreen());
                      // print(value );
                    },
                    child: const Icon(
                      Icons.save,
                      color: Colors.black,
                    )),
                hintText: title == "Category"
                    ? "Add your catogary"
                    : "Add your Subcategory",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
