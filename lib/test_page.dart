import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:service_api/model/comment_response.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _dio = Dio();

  List<CommentResponse>? comment;
  String? text;
  final name = TextEditingController();
  final surname = TextEditingController();
  final age = TextEditingController();
  final id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Demo Home Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: id,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'id',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'name',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: surname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'surname',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: age,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'age',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  final args = {
                    "id": id.text,
                    "name": name.text,
                    "surname": surname.text,
                    "age": age.text,
                  };
                  final response = await _dio
                      .post("http://10.0.2.2:8080/api/v1/user", data: args);

                  final response2 = await _dio.request(
                    "http://10.0.2.2:8080/api/v1/user",
                    data: args,
                    options:
                        Options(method: "GET", contentType: "application/json"),
                  );

                  if (response.statusCode == 200) {
                    if (!mounted) return;
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Status'),
                            content: Text(
                              response.data ?? "",
                            ),
                          );
                        });
                  }
                },
                child: const Text("Save"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(text ?? ""),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: comment
                            ?.map((e) => Column(
                                  children: [
                                    Text(e.title ?? ""),
                                    Text(e.body ?? ""),
                                  ],
                                ))
                            .toList() ??
                        []),
              )
            ],
          ),
        ),
      ),
    );
  }
}
