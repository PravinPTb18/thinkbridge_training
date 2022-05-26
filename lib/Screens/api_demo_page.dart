import 'package:flutter/material.dart';
import 'package:tb_practice/Models/demo_api_model.dart';
import 'package:tb_practice/Services/demo_api_service.dart';

class ApiDemoPage extends StatefulWidget {
  const ApiDemoPage({Key? key}) : super(key: key);

  @override
  State<ApiDemoPage> createState() => _ApiDemoPageState();
}

class _ApiDemoPageState extends State<ApiDemoPage> {
  DemoApiService demoApiService = DemoApiService();
  List<DemoApiModel> fetchedData = [];
  bool isDataLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    isDataLoading = true;
    fetchedData = await demoApiService.fetchPostData();
    isDataLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Demo Page"),
      ),
      body: isDataLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: fetchedData.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(fetchedData[index].body.toString()),
                  )),
    );
  }
}
