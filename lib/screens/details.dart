import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  static String id = 'Details';
  final Map<String, dynamic> showData;

  const Details({Key? key, required this.showData}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final show = widget.showData;
    print("details");
    print(widget.showData);
    print(show);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(show['name'])),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              show['image']['original'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'Genres: ${show['genres'].join(', ')}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Language: ${show['language']}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Premiered: ${show['premiered']}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Status: ${show['status']}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Average Rating: ${show['rating']['average']}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Summary:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              show['summary'],
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press, e.g., navigate to a different screen.
              },
              child: Text('More Details'),
            ),
          ],
        ),
      ),
    );
  }
}
