import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_search/components/BuildListTile.dart';
import 'package:movie_search/screens/search.dart';

class Home extends StatefulWidget {
  static String id = 'Home';
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();

  Uri url = Uri.parse("https://api.tvmaze.com/search/shows?q=all");
  var response;
  late List<dynamic> data = [];

  Future<void> getData() async {
    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        print(data.length);
      }
    } catch (e) {
      print("error fetching data : $e");
      data = [];
    }
  }

  Future<void> initData() async {
    await getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Movie App')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    hintText: 'Search movies...',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                      },
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        //TODO: add search functionality
                        String searchText = _searchController.text.trim();
                        if (searchText.isNotEmpty) {
                          Navigator.pushNamed(context, Search.id,
                              arguments: {'searchText': searchText});
                        }
                      },
                    )),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final show = data[index]['show'];
                  return BuildListTile(
                    show: show,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
