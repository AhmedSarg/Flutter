import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class AlbumModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  AlbumModel(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory AlbumModel.fromJson(Map jsonData) {
    return AlbumModel(
        albumId: jsonData['albumId'],
        id: jsonData['id'],
        title: jsonData['title'],
        url: jsonData['url'],
        thumbnailUrl: jsonData['thumbnailUrl']);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Api Images Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data = [];
  List<AlbumModel> images = [];

  void getData() async {
    await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"))
        .then((value) async {
      data = jsonDecode(value.body);
      for (var element in data) {
        images.add(AlbumModel.fromJson(element));
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: images.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.blue,
                    child: Tooltip(
                      message: images[index].title,
                      child: ElevatedButton(
                          onPressed: () {
                            launchUrl(Uri.parse(images[index].url),
                                mode: LaunchMode.externalApplication);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            elevation: 7,
                            side: const BorderSide(
                                color: Colors.black12,
                                style: BorderStyle.solid,
                                strokeAlign: StrokeAlign.outside,
                                width: 1),
                            padding: const EdgeInsets.all(2),
                          ),
                          child: Stack(children: [
                            Image.network(images[index].thumbnailUrl),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(images[index].id.toString(), style: const TextStyle(color: Colors.black),),
                            )
                          ])),
                    ),
                  );
                },
                itemCount: images.length,
              ));
  }
}
