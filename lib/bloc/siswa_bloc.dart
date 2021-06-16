import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pendaftaran_siswa_baru/models/models.dart';
import 'package:pendaftaran_siswa_baru/services/services.dart';

part 'siswa_event.dart';
part 'siswa_state.dart';

class SiswaBloc extends Bloc<SiswaEvent, SiswaState> {
  SiswaBloc() : super(SiswaInitial());

  @override
  Stream<SiswaState> mapEventToState(
    SiswaEvent event,
  ) async* {
    if (event is LoadSiswa) {
      Siswa siswa = await SiswaServices.getSiswa(event.id);
      yield SiswaLoaded(siswa);
    } 
    
  }
}
