void main() {
  final user = const User('name', 10);
  final user2 = const User('name', 10);

  print(identical(user, user2));
}


// Model Class
class User {
  final String name;
  final int age;

  const User(this.name, this.age);

  User copyWith({String? name, int? age}) {
    return User(
      name ?? this.name,
      age ?? this.age,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'User{name: $name, age: $age}';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['age']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}
