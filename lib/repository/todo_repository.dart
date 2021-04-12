import 'package:dio/dio.dart';
import 'package:flutter_api/model/todo_model.dart';

class TodoRepository {

  Future<List<TodoModel>> getHttp() async {
    try {

      await Future.delayed(Duration(seconds: 3));
      Response response =
      await Dio().get("https://jsonplaceholder.typicode.com/todos/");

      final list =
      (response.data as List).map((e) => TodoModel.fromJson(e)).toList();
      return list;
    } on DioError catch (e) {
      print(e);
      throw DioError(error: 'ERRO CUSTOMIZADO BASE');
    } on Exception catch (ex) {
      print(ex);
      rethrow;
    }
  }

}