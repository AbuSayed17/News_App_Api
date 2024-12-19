import 'dart:convert';
import 'package:fianl_project/model/new_model.dart';
import 'package:http/http.dart' as http;


class NewsApi{
  List<NewsModel> dataStore =[];
  Future<void> getNews() async{
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d5aa2479e4eb452a91d94d6e013939a2");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == 'ok'){
      jsonData["articles"].forEach((element){
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null){
          NewsModel newsModel = NewsModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            author: element['author'],
            content: element['content'],
            );
          dataStore.add(newsModel);

          }
        });
      ;
    }

  }
}


class CategoryNews {
  // for news home screen
  List<NewsModel> dataStore = [];
  Future<void> getNews(String category) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=313e712139fc486796d895c700aef894");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'], // name must be same fron api
            urlToImage: element['urlToImage'],
            description: element['description'],
            author: element['author'],
            content: element['content'],
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}
// used free news api
