import 'package:flutter_cocktail/models/cocktail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CocktailService {
  final _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';
  CocktailService._internal();
  static final _instance = CocktailService._internal();
  factory CocktailService() => _instance;
  
  Future<List<Cocktail>> getCocktails(String query) async {
    final requestUrl = '$_baseUrl/search.php?s=$query';
    final response = await http.get(
      Uri.parse(requestUrl),
    );
    if (response.statusCode == 201) {
      throw Exception('Failed to load cocktails');
    }
    final json = response.body; 
    final data = jsonDecode(json) as Map<String, dynamic>;
    final drinks = data['drinks'] as List;
    return drinks.map((json) => Cocktail.fromJson(json)).toList();
    
  }
    Future<Cocktail> getCocktail(int id) async {
    final requestUrl = '$_baseUrl/lookup.php?i=$id';

    final response = await http.get(
      Uri.parse(requestUrl),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load cocktail');
    }

    final json = response.body;
    final data = jsonDecode(json) as Map<String, dynamic>;
    final drinks = data['drinks'] as List;
    return Cocktail.fromJson(drinks[0]);
  }
}