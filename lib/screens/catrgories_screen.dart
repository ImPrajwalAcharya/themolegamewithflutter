import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:themole/globaldata/categorydata.dart';
import 'package:themole/screens/play_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<bool> values = categoriesList.map((e) {
    return false;
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Text('Choose Categories'),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text(categoriesList[index].name),
                  ),
                  Checkbox(
                      value: values[index],
                      onChanged: (value) {
                        setState(() {
                          values[index] = value!;
                          if (value) {
                            categoryListForPlaying.add(categoriesList[index]);
                          } else {
                            try {
                              categoryListForPlaying
                                  .remove(categoriesList[index]);
                            } catch (e) {}
                          }
                        });
                      }),
                ],
              );
            },
          )),
          Center(
            child: TextButton(
                onPressed: (() {
                  selectcategoryrandomly();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: ((context) {
                        return PlayScreen();
                      }),
                    ),
                  );
                }),
                child: Text('Proceed')),
          )
        ],
      )),
    );
  }
}
