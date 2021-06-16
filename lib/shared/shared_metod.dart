part of 'shared.dart';

File imageFileToUpload;
File kipFile;
File sktm;
File ketLain;
File fotoSiswa;

Future<File> getsImage() async {
  final _picker = await ImagePicker().getImage(source: ImageSource.gallery);
  File file = File(_picker.path);
  return file;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  //Pilihan 1
  // final _storage = FirebaseStorage.instance;
  // var snapshot =await _storage.ref().child(fileName).putFile(image);
  // return await snapshot.ref.getDownloadURL();

  // Pilihan 2

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask task = ref.putFile(image);
  TaskSnapshot snapshot = await task;

  return await snapshot.ref.getDownloadURL();
}
