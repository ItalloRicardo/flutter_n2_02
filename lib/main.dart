import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("N2 - Atividade 02"),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
        ),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('arquivos/fotos.json'),
            builder: (context, snapshot) {
              var fotosJson = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.network(fotosJson[index]['thumbnailUrl'],
                            height: 120, width: 120),
                        Text("Titulo " + fotosJson[index]['title'],style: TextStyle(fontSize: 14), textAlign: TextAlign.center)
                      ],
                    ),
                  );
                },
                itemCount: fotosJson == null ? 0 : fotosJson.length,
              );
            },
          ),
        ),
      ),
    );
  }
}