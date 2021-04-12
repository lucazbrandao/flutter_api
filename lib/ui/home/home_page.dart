import 'package:flutter/material.dart';
import 'package:flutter_api/repository/todo_repository.dart';

import '../home/widgets/custom_listtile.dart';
import '../../model/todo_model.dart';


class HomePage extends StatelessWidget {

  final _repository = TodoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API 2')),
      body: FutureBuilder<List<TodoModel>>(
        future: _repository.getHttp(),
        builder: (_, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, idx) {
                    return CustomListTile(model: snapshot.data[idx]);
                  },
                )
              : snapshot.hasError
                  ? Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(fontSize: 50),
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
