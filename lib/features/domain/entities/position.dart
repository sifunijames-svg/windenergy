import 'package:equatable/equatable.dart';

class Position extends Equatable {
  final double latitude;
  final double longitude;

  const Position({this.latitude = 0.0, this.longitude = 0.0});

  @override
  List<Object?> get props => [latitude, longitude];
}