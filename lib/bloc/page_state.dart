part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class PageInitial extends PageState {}

class PageValue extends PageState {
  final int value;

  PageValue(this.value);

  @override
  List<Object> get props => [value];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  final RegistrationData registrationData;

  OnLoginPage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnPicturePage extends PageState {
  final RegistrationData registrationData;

  OnPicturePage(this.registrationData);
  @override
  List<Object> get props => [registrationData];
}

class OnSignInPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnAddSiswaPage extends PageState {
  final SiswaRegistration siswaRegistration;

  OnAddSiswaPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

//// note: UNTUK SISWA
class OnSiswaOrangTuaPage extends PageState {
  final SiswaRegistration siswaRegistration;

  OnSiswaOrangTuaPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

class OnSiswaSekolahPage extends PageState {
  final SiswaRegistration siswaRegistration;

  OnSiswaSekolahPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

class OnSiswaPenerimaManfaatPage extends PageState {
  final SiswaRegistration siswaRegistration;

  OnSiswaPenerimaManfaatPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

class OnSiswaConfirmationPage extends PageState {
  final SiswaRegistration siswaRegistration;

  OnSiswaConfirmationPage(this.siswaRegistration);
  @override
  List<Object> get props => [siswaRegistration];
}

class OnSiswaDetailPage extends PageState {
  final Siswa siswa;

  OnSiswaDetailPage(this.siswa);
  @override
  List<Object> get props => [siswa];
}
