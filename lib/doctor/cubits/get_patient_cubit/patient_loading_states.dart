class PatientLoadingStates{}

class PatientInitialState extends  PatientLoadingStates{}

class PationtLoadingFailureState extends PatientLoadingStates{
    final String errorMessage;

  PationtLoadingFailureState({required this.errorMessage});

}

class PatientLoadedState extends PatientLoadingStates{
}