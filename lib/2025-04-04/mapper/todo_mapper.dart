import '../dto/todo_dto.dart';
import '../model/todo.dart';

extension TodoDtoExtension on TodoDto {
  Todo toTodo() {
    return Todo(
      id: id?.toInt() ?? -1,
      title: title ?? '',
      isDone: completed ?? false,
    );
  }
}
