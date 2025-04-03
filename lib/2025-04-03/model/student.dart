import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable(explicitToJson: true)
class Student {
  final String name;

  const Student({required this.name});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
