import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_page_state.dart';

class DoctorPageCubit extends Cubit<DoctorPageState> {
  DoctorPageCubit() : super(DoctorPageInitial());
}
