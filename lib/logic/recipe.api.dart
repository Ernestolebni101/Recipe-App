import '../models/recipe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipes() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {'limit': '24', 'start': '0', "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'fc81c4aadamsh359ab0d2de1e55cp169a5djsn9d9b5639edd1',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });
    List data = jsonDecode(response.body)['feed'];
    return Recipe.recipesFromSnapshot(
        data.map((element) => element['content']['details']).toList());
  }
}
//     const axios = require("axios");

// const options = {
//   method: 'GET',
//   url: 'https://yummly2.p.rapidapi.com/feeds/list',
//   params: {limit: '24', start: '0'},
//   headers: {
//     'X-RapidAPI-Key': 'fc81c4aadamsh359ab0d2de1e55cp169a5djsn9d9b5639edd1',
//     'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
//   }
// };