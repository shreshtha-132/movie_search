import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_search/components/BuildListTile.dart';

class Search extends StatefulWidget {
  static String id = 'Search';
  late String param;
  late final args;
  // Search({required this.param});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Uri url;
  late List<dynamic> data = [];

  Future<void> getData() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
        });
        print("Data length: ${data.length}");
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        data = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      widget.args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      print(widget.args['searchText']);
      widget.param = widget.args['searchText'] ?? '';
      url = Uri.parse("https://api.tvmaze.com/search/shows?q=${widget.param}");
      await initData();
    });
  }

  Future<void> initData() async {
    await getData();
    print(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
