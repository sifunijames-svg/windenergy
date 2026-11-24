import 'package:equatable/equatable.dart';

class Telemetry extends Equatable{
  final int turbineId;
  final double powerW;
  final double rotationRpm;
  final double orientationDeg;
  final DateTime? recordedAt;
  final DateTime? receivedAt;

  const Telemetry({
    this.turbineId = 0,
    this.powerW = 0.0,
    this.rotationRpm = 0.0,
    this.orientationDeg = 0.0,
    this.recordedAt,
    this.receivedAt
  });

  @override
  List<Object?> get props => [turbineId, recordedAt];
}