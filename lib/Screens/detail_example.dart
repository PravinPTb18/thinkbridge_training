import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DetailExample extends StatefulWidget {
  final type;
  const DetailExample({Key? key, this.type}) : super(key: key);

  @override
  State<DetailExample> createState() => _DetailExampleState();
}

class _DetailExampleState extends State<DetailExample> {
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type),
        elevation: 0.0,
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              if (widget.type == "Text") textWidget(),
              if (widget.type == "TextField") textFieldWidget(),
            ],
          )),
    );
  }

  Text textWidget() {
    return const Text(
      "Hello Text",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          letterSpacing: 2.0),
    );
  }

  TextField textFieldWidget() {
    return TextField(
      controller: textFieldController,
      cursorColor: Colors.green,
      cursorHeight: 12.0,
      cursorWidth: 2.0,
      decoration: InputDecoration(
          hintText: "Enter Your Name Here...",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              gapPadding: 10.0,
              borderSide: const BorderSide(width: 8.0))),
    );
  }
}
