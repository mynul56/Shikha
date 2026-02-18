import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/course_model.dart';
import '../../repository/course_repository.dart';

// Events
abstract class CourseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCourses extends CourseEvent {}

// States
abstract class CourseState extends Equatable {
  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> courses;

  CourseLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}

class CourseError extends CourseState {
  final String message;

  CourseError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<LoadCourses>((event, emit) async {
      emit(CourseLoading());
      try {
        final courses = await courseRepository.getCourses();
        emit(CourseLoaded(courses));
      } catch (e) {
        emit(CourseError(e.toString()));
      }
    });
  }
}
