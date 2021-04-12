import 'package:flutter/material.dart';
import 'package:flutter_api/model/todo_model.dart';

class CustomListTile extends StatelessWidget {

  final TodoModel model;
  const CustomListTile({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.title),
      subtitle: Text('ID: ${model.id}'),
      leading: Icon(
        model.completed
            ? Icons.check_box
            : Icons.close,
        size: 30,
        color: model.completed
            ? Colors.green
            : Colors.red,
      ),
    );
  }
}
