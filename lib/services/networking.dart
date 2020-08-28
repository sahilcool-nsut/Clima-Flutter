import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper{

  NetworkingHelper(this.url);
  String url;

  Future getData() async{

    http.Response response = await http.get(url);
    if(response.statusCode == 200)
      {
        String jsonData = response.body;
        return jsonDecode(jsonData);
      }
    else
      {
        print(response.statusCode);
      }

  }

}