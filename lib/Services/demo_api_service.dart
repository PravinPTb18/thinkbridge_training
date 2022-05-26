import 'package:http/http.dart' as http;
import 'package:tb_practice/Models/demo_api_model.dart';

class DemoApiService {
  Future<List<DemoApiModel>> fetchPostData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return demoApiModelFromJson(response.body);
    } else {
      throw "Failed to fetch data";
    }
  }
}
