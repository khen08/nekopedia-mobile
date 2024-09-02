import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nekopedia_temp/utilities/constants.dart';
import 'catdetails.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<CatBreed> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      _favorites =
          favorites.map((f) => CatBreed.fromJson(jsonDecode(f))).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAVORITES',
          style: nameStyle,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: objColor,
        ),
      ),
      body: ListView.builder(
        itemCount: _favorites.length,
        itemBuilder: (context, index) {
          final catBreed = _favorites[index];
          return Card(
            color: const Color(0XFFf2a65a),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  catBreed.image,
                  height: 105.0,
                  width: 105.0,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/_placeholder.jpg');
                  },
                ),
              ),
              title: Text(
                catBreed.breedName,
                style: nameStyle,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatDetailsPage(catBreed: catBreed),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            ),
          );
        },
      ),
    );
  }
}