import "package:equatable/equatable.dart";

class Profile extends Equatable{
  final String id;
  final String email;
  final String fullName;
  final DateTime? createdAt;

  const Profile({this.id="", this.email = "", this.fullName = "", this.createdAt});

  @override
  List<Object?> get props => [id];
}