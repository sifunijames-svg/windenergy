import "package:windenergy/features/domain/entities/profile.dart";
import "package:windenergy/utils/result.dart";

abstract class ProfileRepository {
  FutureResult<Profile> readProfile();
}