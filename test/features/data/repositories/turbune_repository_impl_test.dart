import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:windenergy/features/data/repositories/turbine_repository_impl.dart';
import 'package:windenergy/features/data/services/db_service.dart';
import 'package:windenergy/features/domain/entities/pairing_code.dart';
import 'package:windenergy/features/domain/entities/position.dart';
import 'package:windenergy/features/domain/entities/turbine.dart';
import 'package:windenergy/utils/exceptions.dart';
import 'package:windenergy/utils/result.dart';

class MockDbService extends Mock implements DbService {}

void main() {
  late MockDbService mockDbService;
  late TurbineRepositoryImpl turbineRepositoryImpl;

  setUpAll(() {
    registerFallbackValue(const Position());
  });

  setUp(() {
    mockDbService = MockDbService();
    turbineRepositoryImpl = TurbineRepositoryImpl(dbService: mockDbService);
  });

  group("createTurbine", () {
    test("should return Success", () async {
      when(() => mockDbService.createTurbine(
            serialNumber: any(named: "serialNumber"),
            customName: any(named: "customName"),
            position: any(named: "position"),
          )).thenAnswer((_) async => Success());

      final result = await turbineRepositoryImpl.createTurbine(
        serialNumber: "SN-001",
        customName: "Turbine 1",
      );

      expect(result, Success<int>());
      verify(() => mockDbService.createTurbine(
            serialNumber: "SN-001",
            customName: "Turbine 1",
            position: const Position(),
          )).called(1);
    });

    test("should return Error", () async {
      when(() => mockDbService.createTurbine(
            serialNumber: any(named: "serialNumber"),
            customName: any(named: "customName"),
            position: any(named: "position"),
          )).thenThrow(ServerException());

      final result = await turbineRepositoryImpl.createTurbine();

      expect(result, Error<int>());
    });
  });

  group("deleteTurbine", () {
    test("should return Success", () async {
      when(() => mockDbService.deleteTurbine(turbineId: any(named: "turbineId")))
          .thenAnswer((_) async => Success());

      final result = await turbineRepositoryImpl.deleteTurbine(turbineId: 1);

      expect(result, Success<dynamic>());
      verify(() => mockDbService.deleteTurbine(turbineId: 1)).called(1);
    });

    test("should return Error", () async {
      when(() => mockDbService.deleteTurbine(turbineId: any(named: "turbineId")))
          .thenThrow(ServerException());

      final result = await turbineRepositoryImpl.deleteTurbine();

      expect(result, Error<dynamic>());
    });
  });

  group("readCount", () {
    test("should return Success", () async {
      when(() => mockDbService.readCount()).thenAnswer((_) async => Success());

      final result = await turbineRepositoryImpl.readCount();

      expect(result, Success<int>());
      verify(() => mockDbService.readCount()).called(1);
    });

    test("should return Error", () async {
      when(() => mockDbService.readCount()).thenThrow(ServerException());

      final result = await turbineRepositoryImpl.readCount();

      expect(result, Error<int>());
    });
  });

  group("readPairingCode", () {
    test("should return Success", () async {
      when(() => mockDbService.readPairingCode(turbineId: any(named: "turbineId")))
          .thenAnswer((_) async => Success());

      final result = await turbineRepositoryImpl.readPairingCode(turbineId: 1);

      expect(result, Success<PairingCode>());
      verify(() => mockDbService.readPairingCode(turbineId: 1)).called(1);
    });

    test("should return Error", () async {
      when(() => mockDbService.readPairingCode(turbineId: any(named: "turbineId")))
          .thenThrow(ServerException());

      final result = await turbineRepositoryImpl.readPairingCode();

      expect(result, Error<PairingCode>());
    });
  });

  group("readTotalPowerW", () {
    test("should return Success", () async {
      when(() => mockDbService.readTotalPowerW())
          .thenAnswer((_) async => Success());

      final result = await turbineRepositoryImpl.readTotalPowerW();

      expect(result, Success<double>());
      verify(() => mockDbService.readTotalPowerW()).called(1);
    });

    test("should return Error", () async {
      when(() => mockDbService.readTotalPowerW()).thenThrow(ServerException());

      final result = await turbineRepositoryImpl.readTotalPowerW();

      expect(result, Error<double>());
    });
  });

  group("readTurbineActivation", () {
    test("should return Success", () async {
      when(() => mockDbService.readTurbineActivation())
          .thenAnswer((_) async => Success());

      final result = await turbineRepositoryImpl.readTurbineActivation();

      expect(result, Success<dynamic>());
      verify(() => mockDbService.readTurbineActivation()).called(1);
    });

    test("should return Error", () async {
      when(() => mockDbService.readTurbineActivation())
          .thenThrow(ServerException());

      final result = await turbineRepositoryImpl.readTurbineActivation();

      expect(result, Error<dynamic>());
    });
  });

  group("readTurbines", () {
    test("should return Success", () async {
      when(() => mockDbService.readTurbines()).thenAnswer((_) async => Success());

      final result = await turbineRepositoryImpl.readTurbines();

      expect(result, Success<List<Turbine>>());
      verify(() => mockDbService.readTurbines()).called(1);
    });

    test("should return Error", () async {
      when(() => mockDbService.readTurbines()).thenThrow(ServerException());

      final result = await turbineRepositoryImpl.readTurbines();

      expect(result, Error<List<Turbine>>());
    });
  });

  group("updateTurbine", () {
    test("should return Success", () async {
      when(() => mockDbService.updateTurbine(
            turbineId: any(named: "turbineId"),
            customName: any(named: "customName"),
            position: any(named: "position"),
          )).thenAnswer((_) async => Success());

      final result = await turbineRepositoryImpl.updateTurbine(
        turbineId: 1,
        customName: "Nouveau nom",
      );

      expect(result, Success<dynamic>());
      verify(() => mockDbService.updateTurbine(
            turbineId: 1,
            customName: "Nouveau nom",
            position: const Position(),
          )).called(1);
    });

    test("should return Error", () async {
      when(() => mockDbService.updateTurbine(
            turbineId: any(named: "turbineId"),
            customName: any(named: "customName"),
            position: any(named: "position"),
          )).thenThrow(ServerException());

      final result = await turbineRepositoryImpl.updateTurbine();

      expect(result, Error<dynamic>());
    });
  });
}