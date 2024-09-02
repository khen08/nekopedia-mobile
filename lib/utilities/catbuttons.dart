import 'package:flutter/material.dart';
import 'package:nekopedia_temp/pages/favcats.dart';
import 'package:nekopedia_temp/pages/randomcats.dart';
import 'package:nekopedia_temp/pages/catbreeds.dart';
import 'package:nekopedia_temp/pages/catdetails.dart';
import 'constants.dart';

class CatButton1 extends StatelessWidget {
  const CatButton1({
    Key? key,
    required List<CatBreed> filteredCatBreeds,
  }) : _filteredCatBreeds = filteredCatBreeds, super(key: key);

  final List<CatBreed> _filteredCatBreeds;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AllCatBreeds(filteredCatBreeds: _filteredCatBreeds);
                }));
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              width: 5.0,
              color: objColor,
            ),
            backgroundColor: bgColor,
          ),
          child: const ButtonDesign(buttonTitle: 'All Cat Breeds'),
        ),
      ),
    );
  }
}

class CatButton2 extends StatelessWidget {
  const CatButton2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FavoritesPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              width: 5.0,
              color: objColor,
            ),
            backgroundColor: bgColor,
          ),
          child: const ButtonDesign(buttonTitle: "Favorite Cat Breeds",),
        ),
      ),
    );
  }
}

class CatButton3 extends StatelessWidget {
  const CatButton3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Cats(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              width: 5.0,
              color: objColor,
            ),
            backgroundColor: bgColor,
          ),
          child: const ButtonDesign(buttonTitle: 'Click For More Cats!'),
        ),
      ),
    );
  }
}