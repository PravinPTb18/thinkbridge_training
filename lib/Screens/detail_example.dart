import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
            children: [
              if (widget.type == "Text") textWidget(),
              if (widget.type == "TextField") textFieldWidget(),
              if (widget.type == "TextFormField") textFormFieldWidget(),
              if (widget.type == "Container") containerWidget(),
              if (widget.type == "Row") rowWidget(),
              if (widget.type == "Column") columnWidget(),
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

  TextFormField textFormFieldWidget() {
    return TextFormField(
        cursorColor: Colors.green,
        autofillHints: const [AutofillHints.email],
        validator: (val) {
          if (val!.isEmpty) {
            return "Please enter some value";
          }
        },
        decoration: InputDecoration(
            hintText: "Text Form Field Here...",
            hintStyle: const TextStyle(color: Colors.green, fontSize: 20.0),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(width: 8.0))));
  }

  Container containerWidget() {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
      child: const Text(
        "Hi I am Container",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Row rowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [textWidget(), containerWidget()],
    );
  }

  Column columnWidget() {
    return Column(
      children: [
        textWidget(),
        containerWidget(),
      ],
    );
  }
}
