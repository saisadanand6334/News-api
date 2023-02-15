import 'dart:convert';
import 'package:http/http.dart'as http;

import 'newsapp_model.dart';

class Serv{
  Future<List<Article>>getArticle()async{
   final url='https://newsapi.org/v2/everything?q=apple&from=2023-02-07&to=2023-02-07&sortBy=popularity&apiKey=f1935966cf6c42e989582ba757870ae6';
   var response =await http.get(Uri.parse(url));
   if(response.statusCode==200) {
     var body = json.decode(response.body);
     List<Article> _data = List<Article>.from(
         body["articles"].map((e) => Article.fromJson(e)).toList());
     return _data;
   }
   else{
     List<Article> _data=[];
     return _data;
   }
   }
  }



