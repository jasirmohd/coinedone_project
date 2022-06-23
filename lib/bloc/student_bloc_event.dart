part of 'student_bloc.dart';

abstract class StudentBlocEvent extends Equatable {
  const StudentBlocEvent();

  @override
  List<Object> get props => [];
}

class GetStudentData extends StudentBlocEvent {}
