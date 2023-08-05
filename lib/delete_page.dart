import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
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
                final response = await _dio.delete("http://10.0.2.2:8080/api/v1/user/1");
                print(response.data.toString());
              },
              child: const Text("Call HttpDelete Method"),
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
