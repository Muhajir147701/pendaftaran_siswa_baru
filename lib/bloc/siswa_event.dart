part of 'siswa_bloc.dart';

abstract class SiswaEvent extends Equatable {
  const SiswaEvent();

  @override
  List<Object> get props => [];
}

class LoadSiswa extends SiswaEvent {
  final String id;

  LoadSiswa(this.id);

  @override
  List<Object> get props => [id];
}

class AddSiswa extends SiswaEvent {
  final String id;
  final Siswa siswa;

  AddSiswa(this.id, this.siswa);

  @override
  List<Object> get props => [id, siswa];
}

class EditSiswa extends SiswaEvent {
  final String id;
  final Siswa siswa;

  EditSiswa(this.id, this.siswa);

  @override
  List<Object> get props => [id, siswa];
}

class SiswaUpdateData extends SiswaEvent {
  final String id;
  final Siswa siswa;
  final String kipURl;

  SiswaUpdateData(this.id, this.siswa, this.kipURl);

  @override
  List<Object> get props => [id, siswa, kipURl];
}
