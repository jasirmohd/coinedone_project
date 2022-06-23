import 'package:dio/dio.dart';

import '../model/student_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.mocklets.com/p68289/screentime';

  Future<StudentModel> fetchScreenTime() async {
    try {
      Response response = await _dio.get(_url);
      return StudentModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return StudentModel.withError("Data not found / Connection issue");
    }
  }
}
