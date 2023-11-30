import 'package:flutter/material.dart';

class BuildListTile extends StatefulWidget {
  final dynamic show;

  BuildListTile({required this.show});

  @override
  _BuildListTileState createState() => _BuildListTileState();
}

class _BuildListTileState extends State<BuildListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.show['name']),
    );
  }
}
