import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }
}

void main() {
  Employee john = Employee('홍길동', 41);
  Department sales = Department('총무부', john);

  File file = File('company.txt');
  file.writeAsStringSync(jsonEncode(sales.toJson()));
}
