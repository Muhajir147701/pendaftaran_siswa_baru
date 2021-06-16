part of 'siswa_bloc.dart';

abstract class SiswaState extends Equatable {
  const SiswaState();

  @override
  List<Object> get props => [];
}

class SiswaInitial extends SiswaState {}

class SiswaLoaded extends SiswaState {
  final Siswa siswa;

  SiswaLoaded(this.siswa);
  @override
  List<Object> get props => [siswa];
}

class SiswaUploadData extends SiswaState {
  final String id;
  final Siswa siswa;
  final String kipURl;

  SiswaUploadData(this.id, this.siswa, this.kipURl);

  @override
  List<Object> get props => [id, siswa, kipURl];
}
