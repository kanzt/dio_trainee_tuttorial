import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _dio = Dio();

  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Flutter Demo Home Page"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final formDataArgs = FormData.fromMap({
                  "id": 1,
                  "name": "Paper",
                  "surname" : "Paper",
                  "age" : 18
                });

                final args = {
                  "id": 1,
                  "name": "Paper",
                  "surname" : "Paper",
                  "age" : 18
                };

                final response = await _dio.post("http://10.0.2.2:8080/api/v1/user", data: args);
                final response2 = await _dio.post("http://10.0.2.2:8080/api/v1/user", data: formDataArgs);
                print(response.data.toString());
                print(response2.data.toString());
              },
              child: const Text("Call HttpPost Method"),
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
