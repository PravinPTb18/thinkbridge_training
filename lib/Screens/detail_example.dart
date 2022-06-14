import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class DetailExample extends StatefulWidget {
  final String? type;
  const DetailExample({Key? key, this.type}) : super(key: key);

  @override
  State<DetailExample> createState() => _DetailExampleState();
}

class _DetailExampleState extends State<DetailExample> {
  TextEditingController textFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type!),
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
              if (widget.type == "Forms") formExample(),
              if (widget.type == "Images") imagesExample(),
              if (widget.type == "List") listExample(),
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

  Widget formExample() {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                cursorColor: Colors.green,
                autofillHints: const [AutofillHints.name],

                // validation logic goes here, like if user doesnt adds
                // anything in textformfield it will return the string
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Name..";
                  }
                },
                decoration: InputDecoration(
                    hintText: "Enter a name",
                    //it is used to decorate border color if there is any error
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    // it is used to provide style to the error text
                    errorStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                    hintStyle:
                        const TextStyle(color: Colors.green, fontSize: 20.0),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(width: 8.0)))),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                // if user press the button below code will validate it
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget imagesExample() {
    return Column(
      children: [
        // image loading from given url
        const Text(
          "Image loading from internet",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://picsum.photos/200/300",
              fit: BoxFit.fill,
            )),
        const Text(
          "Image loading from assets folder",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/img_1.jpg"))
      ],
    );
  }

  Widget listExample() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        children: [
          const Text("Simple List View example"),
          const SizedBox(
            height: 10.0,
          ),
          textFieldWidget(),
          const SizedBox(
            height: 10.0,
          ),
          textFormFieldWidget(),
          const SizedBox(
            height: 10.0,
          ),
          textWidget(),
          const Divider(
            thickness: 2.0,
          ),
          const Text(
              "Example of  List View builder which creates dynamic list"),
          Container(
            height: 300,
            color: Colors.white,
            child: ListView.builder(
                itemBuilder: (context, index) => SizedBox(
                      height: 60,
                      width: 100,
                      child: Text("Text $index"),
                    )),
          ),
          const Text("Example of  grid view"),
          Container(
            height: 400,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //it will display number of items in horizontal
                  crossAxisCount: 4,

                  //it will add spacing between each child in mainAxis
                  mainAxisSpacing: 4),
              children: [
                Container(
                  height: 20,
                  color: Colors.red,
                ),
                Container(
                  height: 20,
                  color: Colors.blue,
                ),
                Container(
                  height: 20,
                  color: Colors.red,
                ),
                Container(
                  height: 20,
                  color: Colors.blue,
                ),
                Container(
                  height: 20,
                  color: Colors.red,
                ),
                Container(
                  height: 20,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
