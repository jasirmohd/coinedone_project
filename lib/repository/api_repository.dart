import 'package:student_dashboard/model/student_model.dart';

import '../api/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<StudentModel> fetchScreenTime() {
    return _provider.fetchScreenTime();
  }
}

class NetworkError extends Error {}
