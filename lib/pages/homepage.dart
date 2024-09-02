import 'package:flutter/material.dart';
import '../utilities/catapi.dart';
import '../utilities/catbuttons.dart';
import 'catdetails.dart';
import '../utilities/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CatBreed> _catBreeds = [];
  List<CatBreed> _filteredCatBreeds = [];

  @override
  void initState() {
    super.initState();
    CatApi().fetchCatBreeds().then((catBreeds) {
      setState(() {
        _catBreeds = catBreeds;
        _filteredCatBreeds = _catBreeds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5.0,
            ),
            const Text(
              "NEKOPEDIA",
              style: titleStyle,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Image.asset("assets/images/_logo.png", width: 40.0, height: 40.0),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          CatButton1(filteredCatBreeds: _filteredCatBreeds),
          const SizedBox(
            height: 50.0,
          ),
          const CatButton2(),
          const SizedBox(
            height: 50.0,
          ),
          const CatButton3(),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}