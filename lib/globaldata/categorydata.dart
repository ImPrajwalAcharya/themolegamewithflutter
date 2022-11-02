import 'dart:math';

import 'package:themole/globaldata/random_choice.dart';
import 'package:themole/models/category.dart';

List<Category> categoriesList = [
  Category('food', ['momo', 'choumin', 'roti']),
  Category('cities', ['ktm', 'pkh', 'tibet'])
];

List<Category> categoryListForPlaying = [];
void selectcategoryrandomly() {
  int index = Random().nextInt(categoryListForPlaying.length);
  int itemindex = Random().nextInt(categoryListForPlaying[index].items.length);
  print(index.toString() + "hel" + itemindex.toString());
  randomChoiceCategory = categoryListForPlaying[index];
  randomChoiceItem = categoryListForPlaying[index].items[itemindex];
  print(randomChoiceItem);
}
