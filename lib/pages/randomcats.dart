import 'dart:convert';
import '../utilities/catapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utilities/constants.dart';

class Cats extends StatefulWidget {
  const Cats({super.key});

  @override
  _CatsState createState() => _CatsState();
}

class _CatsState extends State<Cats> {
  Map<String, dynamic> currentImage = {};
  String apiKey = CatApi.apiKey;
  bool isLoading = false;
  double _scale = 1.0;
  double _initialScale = 1.0;

  @override
  void initState() {
    super.initState();
    getRandomCatImage();
  }

  Future<void> getRandomCatImage() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(
        'https://api.thecatapi.com/v1/images/search'),
      headers: {'x-api-key': apiKey},
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        isLoading = false;
        currentImage = data[0];
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load random cat image');
    }
  }

  void newCatImage() async {
    final response = await http.post(Uri.parse(
        'https://api.thecatapi.com/v1/votes/'),
      headers: {
        'content-type': 'application/json',
        'x-api-key': apiKey,
      },
      body: jsonEncode({
        'image_id': currentImage['id'],
        'value': 1,
      }),
    );
    if (response.statusCode == 201) {
      getRandomCatImage();
    } else {
      throw Exception('Failed to load cat, try again later!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(appBarTitle: 'More Random Cats!'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : currentImage == null
              ? Container()
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400.0,
                height: 400.0,
                child: GestureDetector(
                  onScaleStart: (details) {
                    setState(() {
                      _initialScale = _scale;
                    });
                  },
                  onScaleUpdate: (details) {
                    setState(() {
                      _scale = _initialScale * details.scale;
                    });
                  },
                  onScaleEnd: (details) {
                    setState(() {
                      _scale = 1.0;
                    });
                  },
                  child: Transform.scale(
                    scale: _scale,
                    child: Image.network(currentImage['url']),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: IconButton(
                      icon: Image.asset('assets/images/_buttonlogo.png'),
                      color: objColor,
                      onPressed: newCatImage,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}