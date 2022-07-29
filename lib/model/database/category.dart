import 'package:hive/hive.dart';

// part 'category.g.dart';
// part 'category.g.dart';
 part 'category.g.dart';

@HiveType(typeId: 0)
class CatogaryDetails extends HiveObject{
  @HiveField(0)
  final String catogary;
  @HiveField(1)
  final List<String>? subCatogary;

  CatogaryDetails({required this.catogary, this.subCatogary});
}

@HiveType(typeId: 2)
class Subcategory extends HiveObject {
  Subcategory({required this.category, required this.subCatogary});

  @HiveField(0)
 final String category;

  @HiveField(1)
 final List<String> subCatogary;
}