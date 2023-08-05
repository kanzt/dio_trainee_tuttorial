import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PutPage extends StatefulWidget {
  const PutPage({Key? key}) : super(key: key);

  @override
  _PutPageState createState() => _PutPageState();
}

class _PutPageState extends State<PutPage> {
  final _dio = Dio();

  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Demo Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {

                final args = {
                  "id": 1,
                  "name": "Paper",
                  "surname" : "Paper",
                  "age" : 18
                };

                final response = await _dio.put("http://10.0.2.2:8080/api/v1/user", data: args);
                print(response.data.toString());
              },
              child: const Text("Call HttpPut Method"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(text ?? ""),
            )
          ],
        ),
      ),
    );
  }
}
