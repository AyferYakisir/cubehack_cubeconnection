part of 'register_service.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String role;
  final String field1;
  final String dropdownValue;

  const RegisterSubmitted({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.field1,
    required this.dropdownValue,
  });

  @override
  List<Object?> get props => [name, email, password, role, field1, dropdownValue];
} 
