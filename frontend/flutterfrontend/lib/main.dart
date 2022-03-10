import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  Future<http.Response> buttonPressed() async {
    http.Response returnedResult = await http.get(
        Uri.parse('http://localhost:8000/app/hellodjango'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset-UTF-8'
        });
    print(returnedResult.body);
    return returnedResult;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clever Tech Memes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
                centerTitle: true, title: const Text('Clever Tech Memes')),
            body: Center(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: const Text('Welcome to the Clever Tech Memes!')),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ElevatedButton(
                      onPressed: buttonPressed, child: Text('Click!')),
                )
              ],
            ))));
  }
}
