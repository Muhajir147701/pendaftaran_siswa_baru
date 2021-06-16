part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  final RegistrationData registrationData;

  GoToLoginPage(this.registrationData);

  @override
  List<Object> get props => [registrationData];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToPicturePage extends PageEvent {
  final RegistrationData registrationData;

  GoToPicturePage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class GoToSignInPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToAddSiswaPage extends PageEvent {
  final SiswaRegistration siswaRegistration;

  GoToAddSiswaPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

//// note: UNTUK SISWA
class GoToSiswaOrangTuaPage extends PageEvent {
  final SiswaRegistration siswaRegistration;

  GoToSiswaOrangTuaPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

class GoToSiswaSekolahPage extends PageEvent {
  final SiswaRegistration siswaRegistration;

  GoToSiswaSekolahPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

class GoToSiswaPenerimaManfaatPage extends PageEvent {
  final SiswaRegistration siswaRegistration;

  GoToSiswaPenerimaManfaatPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

class GoToSiswaConfirmationPage extends PageEvent {
  final SiswaRegistration siswaRegistration;

  GoToSiswaConfirmationPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

class GoToSiswaDetailPage extends PageEvent {
  final String id;

  GoToSiswaDetailPage(this.id);
  @override
  List<Object> get props => [id];
}
