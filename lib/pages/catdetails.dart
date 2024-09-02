import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekopedia_temp/utilities/customicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nekopedia_temp/utilities/constants.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class CatBreed {
  final String image;
  final String breedName;
  final String description;
  final String life_span;
  final String temperament;
  final double affectionLevel;
  final double intelligence;
  final double childFriendly;
  final double dogFriendly;
  final double strangerFriendly;
  final double energyLevel;

  const CatBreed({required this.image, required this.breedName, required this.description, required this.life_span, required this.temperament, required this.affectionLevel, required this.intelligence, required this.childFriendly, required this.dogFriendly, required this.strangerFriendly, required this.energyLevel});

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      image: 'assets/images/${json['name']}.JPG',
      breedName: json['name'],
      description: json['description'],
      life_span: json['life_span'],
      temperament: json['temperament'],
      affectionLevel: json['affection_level'].toDouble(),
      intelligence: json['intelligence'].toDouble(),
      childFriendly: json['child_friendly'].toDouble(),
      dogFriendly: json['dog_friendly'].toDouble(),
      strangerFriendly: json['stranger_friendly'].toDouble(),
      energyLevel: json['energy_level'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'image': image,
    'name': breedName,
    'description': description,
    'life_span': life_span,
    'temperament': temperament,
    'affection_level': affectionLevel,
    'intelligence': intelligence,
    'child_friendly': childFriendly,
    'dog_friendly': dogFriendly,
    'stranger_friendly': strangerFriendly,
    'energy_level': energyLevel,
  };
}

class CatDetailsPage extends StatefulWidget {
  final CatBreed catBreed;

  const CatDetailsPage({super.key, required this.catBreed});

  @override
  _CatDetailsPageState createState() => _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  bool isFavorited = false;
  double _starRating(double value) => value / 2;

  @override
  void initState() {
    super.initState();
    _checkIfCatBreedIsFavorited();
  }

  void _checkIfCatBreedIsFavorited() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      isFavorited = favorites.contains(jsonEncode(widget.catBreed.toJson()));
    });
  }

  void _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    if (isFavorited) {
      favorites.remove(jsonEncode(widget.catBreed.toJson()));
    } else {
      favorites.add(jsonEncode(widget.catBreed.toJson()));
    }
    setState(() {
      isFavorited = !isFavorited;
    });
    prefs.setStringList('favorites', favorites);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.catBreed.breedName,
          style: nameStyle,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: objColor,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5.0,
                  color: objColor,
                ),
              ),
              child: Image.asset(
                'assets/images/${widget.catBreed.breedName}.JPG',
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/_placeholder.jpg');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.catBreed.description,
              textAlign: TextAlign.justify,
              style: descStyle,
            ),
          ),
          Expanded(
            child: CupertinoScrollbar(
              thumbVisibility: true,
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lifespan:",
                          style: descStyle,
                        ),
                        Text(
                          "${widget.catBreed.life_span} years",
                          style: descStyle,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Temperament:",
                          style: descStyle,
                        ),
                        Text(
                          "${widget.catBreed.temperament}",
                          style: descStyle,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Affection Level:",
                          style: descStyle,
                        ),
                        const SizedBox(height: 5.0),
                        SmoothStarRating(
                          rating: _starRating(widget.catBreed.affectionLevel),
                          size: 40,
                          color: objColor,
                          borderColor: objColor,
                          filledIconData: CustomIcons.fullpaw,
                          defaultIconData: CustomIcons.emptypaw,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Intelligence",
                          style: descStyle,
                        ),
                        const SizedBox(height: 5.0),
                        SmoothStarRating(
                          rating: _starRating(widget.catBreed.intelligence),
                          size: 40,
                          color: objColor,
                          borderColor: objColor,
                          filledIconData: CustomIcons.fullpaw,
                          defaultIconData: CustomIcons.emptypaw,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Child Friendly:",
                          style: descStyle,
                        ),
                        const SizedBox(height: 5.0),
                        SmoothStarRating(
                          rating: _starRating(widget.catBreed.childFriendly),
                          size: 40,
                          color: objColor,
                          borderColor: objColor,
                          filledIconData: CustomIcons.fullpaw,
                          defaultIconData: CustomIcons.emptypaw,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Dog Friendly:",
                          style: descStyle,
                        ),
                        const SizedBox(height: 5.0),
                        SmoothStarRating(
                          rating: _starRating(widget.catBreed.dogFriendly),
                          size: 40,
                          color: objColor,
                          borderColor: objColor,
                          filledIconData: CustomIcons.fullpaw,
                          defaultIconData: CustomIcons.emptypaw,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Stranger Friendly:",
                          style: descStyle,
                        ),
                        const SizedBox(height: 5.0),
                        SmoothStarRating(
                          rating: _starRating(widget.catBreed.strangerFriendly),
                          size: 40,
                          color: objColor,
                          borderColor: objColor,
                          filledIconData: CustomIcons.fullpaw,
                          defaultIconData: CustomIcons.emptypaw,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "Energy Level:",
                          style: descStyle,
                        ),
                        const SizedBox(height: 5.0),
                        SmoothStarRating(
                          rating: _starRating(widget.catBreed.energyLevel),
                          size: 40.0,
                          color: objColor,
                          borderColor: objColor,
                          filledIconData: CustomIcons.fullpaw,
                          defaultIconData: CustomIcons.emptypaw,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleFavorite,
        backgroundColor: appBarBgColor,
        child: Icon(
          isFavorited ? Icons.favorite : Icons.favorite_border,
          color: objColor,
        ),
      ),
    );
  }
}