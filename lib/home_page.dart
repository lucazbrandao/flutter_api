import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/todo_model.dart';

class HomePage extends StatelessWidget {

  Future<List<TodoModel>> getHttp() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      Response response =
          await Dio().get("https://jsonplaceholder.typicode.com/todos/");

      final list = (response.data as List)
          .map((e) => TodoModel.fromJson(e))
          .toList();
      return list;

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API 2')),
      body: FutureBuilder<List<TodoModel>>(
        future: getHttp(),
        builder: (_, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, idx) {
                    return ListTile(
                      title: Text(snapshot.data[idx].title),
                      subtitle: Text('ID: ${snapshot.data[idx].id}'),
                      leading: Icon(
                        snapshot.data[idx].completed
                            ? Icons.check_box
                            : Icons.close,
                        size: 30,
                        color: snapshot.data[idx].completed
                            ? Colors.green
                            : Colors.red,
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
