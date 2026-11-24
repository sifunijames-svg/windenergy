import 'package:equatable/equatable.dart';
import 'package:windenergy/features/domain/entities/position.dart';

enum TurbineStatus{active, inactive}

class Turbine extends Equatable{
  final int id;
  final String serialNumber;
  final String customName;
  final Position position;
  final TurbineStatus status;
  final DateTime? createdAt;

  const Turbine({
    this.id = 0,
    this.serialNumber = "",
    this.customName = "",
    this.position = const Position(),
    this.status = TurbineStatus.inactive,
    this.createdAt
  });

  @override
  List<Object?> get props => [id];
}