import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testone/model/database/category.dart';
import 'package:testone/view/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CatogaryDetailsAdapter());
  Hive.registerAdapter(SubcategoryAdapter());
  await Hive.openBox<CatogaryDetails>("catogaryDetails");
  await Hive.openBox<Subcategory>("subCategory");
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen(),
    );
  }
}
