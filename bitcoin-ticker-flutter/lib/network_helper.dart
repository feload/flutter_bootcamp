import 'dart:convert' as convert;
import 'dart:ffi';
import 'package:http/http.dart' as http;

class NetworkHelper {

  Future<double> get(String url) async {
    var response = await http.get(url);
    if(response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      return data['ask'];
    }else{
      return null;
    }
  }

}