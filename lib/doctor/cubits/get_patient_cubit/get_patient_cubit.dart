import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/models/patient_info_model.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/patient_loading_states.dart';
import 'package:medicory_gp/doctor/services/get_patient_info_service.dart';

class GetPatientCubit extends Cubit<PatientLoadingStates> {
  GetPatientCubit() : super(PatientInitialState());
  late PatientInfoModel patientInfoModel;

  getPatient({required String patientCode}) async {
    try {
      patientInfoModel =
          await GetPatientInfoService(userCode: patientCode).patientInfo();
      emit(PatientLoadedState());
    } on Exception catch (e) {
      emit(PationtLoadingFailureState(errorMessage: e.toString()));
    }
  }
}
