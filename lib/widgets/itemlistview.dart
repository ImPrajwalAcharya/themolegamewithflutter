import 'package:flutter/material.dart';
import 'package:themole/globaldata/random_choice.dart';

class ItemShowScreen extends StatefulWidget {
  const ItemShowScreen({super.key});

  @override
  State<ItemShowScreen> createState() => _ItemShowScreenState();
}

class _ItemShowScreenState extends State<ItemShowScreen> {
  int? istapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
        ),
        itemCount: randomChoiceCategory!.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                istapped = index;
              });
              moleAns = randomChoiceCategory!.items[index];
            },
            child: Container(
                decoration: BoxDecoration(
                    color: istapped == index ? Colors.green : Colors.white,
                    border: Border.all(width: 1, color: Colors.black)),
                child: Center(child: Text(randomChoiceCategory!.items[index]))),
          );
        },
      ),
    );
  }
}
