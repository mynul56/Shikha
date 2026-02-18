import '../network/network_client.dart';
import '../models/course_model.dart';

class CourseRepository {
  final NetworkClient _networkClient = NetworkClient();

  Future<List<Course>> getCourses() async {
    try {
      final response = await _networkClient.dio.get('/courses');
      final List<dynamic> data = response.data;
      return data.map((json) => Course.fromJson(json)).toList();
    } catch (e) {
      throw e;
    }
  }
}
