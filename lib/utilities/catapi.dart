import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pages/catdetails.dart';

class CatApi {
  static const String apiKey = "live_MAPCjPeB9CN8ybe10u9tjqLpXuGipMWmr4iQCf0WjyhQtrJyeCBnz2a8NOMLlY3V";
  static const String apiUrl = "https://api.thecatapi.com/v1/breeds";

  Future<List<CatBreed>> fetchCatBreeds() async {
    final response = await http.get(Uri.parse("$apiUrl?api_key=$apiKey"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((rawBreed) => CatBreed.fromJson(rawBreed)).toList();
    } else {
      throw Exception('Failed to load cat breeds');
    }
  }
}