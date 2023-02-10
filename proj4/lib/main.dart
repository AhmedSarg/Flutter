import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  bool mode = false;

  @override
  Widget build(BuildContext context) {
    final pages = [
      Center(
          child:
          ListView.separated(
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(8),
                child: const Text("Flutter"),
              ),
              separatorBuilder: (context, index) => Container(
                height:5,
                width: double.infinity,
                color: Colors.red,
              ),
              itemCount: 5
          )
      ),
      Text("data"),
      Text("data")
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mode == false ? ThemeData.light() : ThemeData.dark(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
             actions: [
              Switch(
                value: mode,
                onChanged: (value) {
                  setState(() {
                    mode = value;
                  });
                },
              )
            ],
          ),
          body: TabBarView(
            children: pages
          ),
        ),
      ),
    );
  }
}

/*
class MyTile extends StatelessWidget {
  MyTile(this, index);
  int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
      ),
      title: Text("user$index"),
      subtitle: const Text("message"),
      trailing: Column(
        children: const [
          Text("10:20"),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
*/

