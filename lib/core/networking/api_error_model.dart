import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';
//any change in file auto generate must generate in every changes 
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  // @JsonKey(name: )
  final int? code; //var that hold the key return by json body

  ApiErrorModel({required this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
