import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:testone/model/database/category.dart';
import 'package:testone/view/screens/home_screen.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  static final box = Hive.box<CatogaryDetails>("catogaryDetails");
  var category = box.values.toList();

  bool isChanged = false;
  String rename = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.delete),
            )
          ],
          title: const Text("Category List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      title: Text(category[index].catogary),
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: category[index].subCatogary == null
                                ? 0
                                : category[index].subCatogary!.length,
                            itemBuilder: (context, ind) {
                              return ListTile(
                                title: Text(category[index].subCatogary == null
                                    ? 'No sub cat'
                                    : category[index].subCatogary![ind]),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                        value: isChanged,
                                        onChanged: (value) {
                                          setState(
                                            () => isChanged = value!,
                                          );
                                        }),
                                    IconButton(
                                        onPressed: () {
                                          Get.defaultDialog(
                                              title: 'Update Sub Category',
                                              content: TextFormField(
                                                onChanged: (value) {
                                                  rename = value;
                                                },
                                                decoration: InputDecoration(
                                                  suffixIcon: InkWell(
                                                      onTap: () async {
                                                        box.putAt(
                                                            index,
                                                            CatogaryDetails(
                                                                catogary:
                                                                    rename,
                                                                subCatogary: [
                                                                  "kdsajha",
                                                                  "sdbfkj"
                                                                ]));
                                                        Get.back();
                                                        // print(value );
                                                      },
                                                      child: const Icon(
                                                        Icons.save,
                                                        color: Colors.black,
                                                      )),
                                                  hintText:
                                                      "Sub Cateegory Name",
                                                ),
                                              ));
                                        },
                                        icon: const Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {
                                          box.deleteAt(index);
                                        },
                                        icon: const Icon(Icons.delete)),
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: category.length),
          )
        ],
      ),
    );
  }
}
