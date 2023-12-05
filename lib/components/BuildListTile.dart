import 'package:flutter/material.dart';
import 'package:movie_search/screens/details.dart';

class BuildListTile extends StatefulWidget {
  final dynamic show;

  BuildListTile({required this.show});

  @override
  _BuildListTileState createState() => _BuildListTileState();
}

class _BuildListTileState extends State<BuildListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(showData: widget.show),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(widget.show['name'] ?? " "),
          subtitle: Text(widget.show['genres']?.join(', ') ?? ''),
          leading: widget.show['image'] != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(widget.show['image']['medium']),
                )
              : CircleAvatar(
                  backgroundColor: Colors.grey, // Placeholder background color
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}

// ListTile(
// title: Text(widget.show['name']),
// )
