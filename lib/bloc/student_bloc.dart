import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/student_model.dart';
import '../repository/api_repository.dart';

part 'student_bloc_event.dart';
part 'student_bloc_state.dart';

class StudentBloc extends Bloc<StudentBlocEvent, StudentBlocState> {
  StudentBloc() : super(StudentInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetStudentData>((event, emit) async {
      try {
        emit(StudentLoading());
        final mList = await _apiRepository.fetchScreenTime();
        emit(StudentLoaded(mList));
        if (mList.error != null) {
          emit(StudentError(mList.error));
        }
      } on NetworkError {
        emit(const StudentError(
            "Failed to fetch data.Check internet connection?"));
      }
    });
  }
}
