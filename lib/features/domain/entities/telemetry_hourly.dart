import 'package:equatable/equatable.dart';

class TelemetryHourly extends Equatable{
  final int turbineId;
  final double maxPowerW;
  final double avgPowerW;
  final double avgRpm;
  final double energyWh;
  final DateTime? bucketStart;

  const TelemetryHourly({
    this.turbineId = 0,
    this.maxPowerW = 0.0,
    this.avgPowerW = 0.0,
    this.avgRpm = 0.0,
    this.energyWh = 0.0,
    this.bucketStart
  });

  @override
  List<Object?> get props => [turbineId, bucketStart];
}