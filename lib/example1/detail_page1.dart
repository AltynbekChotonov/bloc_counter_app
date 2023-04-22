import 'package:flutter/material.dart';

class Detail1Page extends StatefulWidget {
  Detail1Page({super.key, required this.count});

  int count;

  @override
  State<Detail1Page> createState() => _Detail1PageState();
}

class _Detail1PageState extends State<Detail1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.count);
          },
        ),
        title: Text('Detail1Page ${widget.count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.count--;
          });
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
