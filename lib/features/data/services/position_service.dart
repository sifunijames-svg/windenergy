import 'package:windenergy/utils/result.dart';

abstract class PositionService {
  FutureResult<List<double>> readPosition();
}