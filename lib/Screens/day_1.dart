import 'package:flutter/material.dart';
import 'package:tb_practice/Screens/api_demo_page.dart';
import 'package:tb_practice/Screens/detail_example.dart';
import 'package:tb_practice/Screens/provider_demo_page.dart';

class Day1Practice extends StatefulWidget {
  const Day1Practice({Key? key}) : super(key: key);

  @override
  State<Day1Practice> createState() => _Day1PracticeState();
}

class _Day1PracticeState extends State<Day1Practice> {
  List<String> exampleList = [
    "Text",
    "TextField",
    "TextFormField",
    "Container",
    "Row",
    "Column",
    "Forms",
    "Images",
    "List",
    "Api Demo",
    "Provider Demo"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 1 Practice"),
        elevation: 0.0,
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      exampleList[index] == "Api Demo"
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ApiDemoPage()))
                          : exampleList[index] == "Provider Demo"
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ProviderDemoPage()))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetailExample(
                                            type: exampleList[index],
                                          )));
                    },
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Text(
                          exampleList[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 2.0,
                  ),
              itemCount: exampleList.length)),
    );
  }
}
