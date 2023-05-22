import 'package:http/http.dart' as http;
import 'package:numberapi/modelapi/model.dart';

class Http {
  static Future<List<Pixabay>> fetchProducts() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      var data = response.body;
      return pixabayFromJson(data);
    } else {
      var data = response.body;
      return pixabayFromJson(data);
    }
  }
}