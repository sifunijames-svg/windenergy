import 'package:equatable/equatable.dart';

abstract class Result<T> extends Equatable{}

class Success<T> extends Result<T>{
  final T? value;

  Success({this.value});

  @override
  List<Object?> get props => [value];
}

class Error<T> extends Result<T>{
  final String reason;

  Error({this.reason = ""});

  @override
  List<Object?> get props => [reason];
}

typedef FutureResult<T> = Future<Result<T>>;