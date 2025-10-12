import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

//any change in file auto generate must generate in every changes
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  // @JsonKey(name: )
  final int? code; //var that hold the key return by json body
  @JsonKey(name: 'data')
  final Map<String, dynamic>? errors;
  ApiErrorModel({this.message, this.code, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  ///returns a string containing all the error messages
  String getAllErrorMessages() {
    if (errors.isNullOrEmpty()) {
      return message ?? 'Unkown Error occured';
    }

    final errorMessage = errors!.entries
        .map((entry) {
          final value = entry.value;
          return "${value.join(',')}";
        })
        .join('\n');

    return errorMessage;
  }
}


/*
Map<String, List<String>> errors = {
  'email': ['Email is required', 'Email format is invalid'],
  'password': ['Password must be at least 8 characters'],
  'phone': ['Phone number is invalid']
};

errors.entries produit :
MapEntry('email', ['Email is required', 'Email format is invalid'])
MapEntry('password', ['Password must be at least 8 characters'])
 MapEntry('phone', ['Phone number is invalid'])
 Map<String, List<String>> errors = {
  'email': ['Email is required', 'Email format is invalid'],
  'password': ['Password must be at least 8 characters'],
  'phone': ['Phone number is invalid']
};

 errors.entries produit :
MapEntry('email', ['Email is required', 'Email format is invalid'])
 MapEntry('password', ['Password must be at least 8 characters'])
MapEntry('phone', ['Phone number is invalid'])
*/