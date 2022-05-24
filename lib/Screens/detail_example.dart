import 'package:flutter/material.dart';

class DetailExample extends StatefulWidget {
  final type;
  const DetailExample({Key? key, this.type}) : super(key: key);

  @override
  State<DetailExample> createState() => _DetailExampleState();
}

class _DetailExampleState extends State<DetailExample> {
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
        child: const Text(
          "Hello Text",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
              letterSpacing: 2.0),
        ),
      ),
    );
  }
}
