class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(this.userId, this.id, this.title, this.completed);

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

}
