part of 'student_bloc.dart';

abstract class StudentBlocState extends Equatable {
  const StudentBlocState();

  @override
  List<Object?> get props => [];
}

class StudentInitial extends StudentBlocState {}

class StudentLoading extends StudentBlocState {}

class StudentLoaded extends StudentBlocState {
  final StudentModel studentModel;
  const StudentLoaded(this.studentModel);
}

class StudentError extends StudentBlocState {
  final String? message;
  const StudentError(this.message);
}
