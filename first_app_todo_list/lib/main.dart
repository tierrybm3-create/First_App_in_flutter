import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anotações',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

// ignore: must_be_immutable
class myhome extends StatefulWidget {
  var items = <item>[];

myhome({super.key}) {
    items = [];
    items.add(item(title: 'Item 1', done: false));
    items.add(item(title: 'Item 2', done: true));
    items.add(item(title: 'Item 3', done: false));
  }

  @override
  State<myhome> createState() => _myhomeState();
}

// ignore: camel_case_types
class _myhomeState extends State<myhome> {
  Null get listView => null;


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anotações'),
      ),
      body: listView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];
          return ListTile(
            title: Text(item.title ?? ''),
            trailing: Checkbox(
              value: item.done ?? false,
              onChanged: (bool? value) {
                setState(() {
                  item.done = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}