import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekopedia_temp/pages/catdetails.dart';
import 'package:nekopedia_temp/utilities/constants.dart';

class AllCatBreeds extends StatefulWidget {
  final List<CatBreed> filteredCatBreeds;

  const AllCatBreeds({
    Key? key,
    required this.filteredCatBreeds,
  }) : super(key: key);

  @override
  _AllCatBreedsState createState() => _AllCatBreedsState();
}

class _AllCatBreedsState extends State<AllCatBreeds> {
  final TextEditingController _searchController = TextEditingController();
  List<CatBreed> _searchResult = [];

  @override
  void initState() {
    super.initState();
    _searchResult = widget.filteredCatBreeds;
  }

  void _searchCatBreeds(String query) {
    setState(() {
      _searchResult = widget.filteredCatBreeds
          .where((catBreed) => catBreed.breedName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const SizedBox(
                width: 30.0,
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search for Cat Breeds',
                    hintStyle: nameStyle,
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => _searchCatBreeds(value),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search, color: objColor),
                onPressed: () => _searchCatBreeds(_searchController.text),
              ),
            ],
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: objColor),
            onPressed: () {
              Navigator.pop(context);}),
      ),
      body: Column(
        children: [
          Expanded(
            child: CupertinoScrollbar(
              thumbVisibility: true,
              child: GridView.builder(
                itemCount: _searchResult.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final catBreed = _searchResult[index];
                  return Card(
                    color: tileColor,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatDetailsPage(catBreed: _searchResult[index]),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          catBreed.breedName,
                          style: tileNameStyle,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}