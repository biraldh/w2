import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:w2/Model/newsapi.dart';
import 'package:w2/staticvalue.dart';

class GetApi{
  static Future<Newsapi?>? getnewsdata() async {
    try{
      var url = Uri.https(staticValue.baseurl, '/v2/everything',
        {"domains":"wsj.com", "apiKey":staticValue.apikey});
      var response = await http.get(url);
      var jsonResponse = convert.jsonDecode(response.body);
      Newsapi data = Newsapi.fromJson(jsonResponse);
      return data;
    }catch(e){
      return null;
    }
  }
}