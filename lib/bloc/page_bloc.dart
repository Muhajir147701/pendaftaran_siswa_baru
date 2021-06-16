import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:pendaftaran_siswa_baru/bloc/blocs.dart';
// import 'package:pendaftaran_siswa_baru/bloc/blocs.dart';
// import 'package:pendaftaran_siswa_baru/bloc/blocs.dart';
import 'package:pendaftaran_siswa_baru/models/models.dart';
import 'package:pendaftaran_siswa_baru/services/services.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage(event.registrationData);
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToPicturePage) {
      yield OnPicturePage(event.registrationData);
    } else if (event is GoToSignInPage) {
      yield OnSignInPage();
    } else if (event is GoToAddSiswaPage) {
      yield OnAddSiswaPage(event.siswaRegistration);
    } else if (event is GoToSiswaOrangTuaPage) {
      yield OnSiswaOrangTuaPage(event.siswaRegistration);
    } else if (event is GoToSiswaSekolahPage) {
      yield OnSiswaSekolahPage(event.siswaRegistration);
    } else if (event is GoToSiswaPenerimaManfaatPage) {
      yield OnSiswaPenerimaManfaatPage(event.siswaRegistration);
    } else if (event is GoToSiswaConfirmationPage) {
      yield OnSiswaConfirmationPage(event.siswaRegistration);
    } else if (event is GoToSiswaDetailPage) {
      Siswa siswa = await SiswaServices.getSiswa(event.id);
      yield OnSiswaDetailPage(siswa);
    }
  }
}
