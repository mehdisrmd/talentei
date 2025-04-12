import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talentei/models/doctor_appointment_model.dart';

part 'doctor_page_state.dart';

class DoctorPageCubit extends Cubit<DoctorPageState> {
  DoctorPageCubit() : super(DoctorPageInitial());
  List <DoctorAppointmentModel>appointmentList=[
    DoctorAppointmentModel(appointmentId: '', date: 'سه شنبه',doctorId: '131',price: '25000',time:'45 دقیفه')
  ];
}
