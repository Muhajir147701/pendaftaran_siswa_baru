import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pendaftaran_siswa_baru/models/models.dart';
import 'package:pendaftaran_siswa_baru/extension/extension.dart';
import 'package:photo_view/photo_view.dart';

part 'auth_services.dart';
part 'user_services.dart';
part 'siswa_services.dart';
part 'camera_services.dart';
part 'image_viewer.dart';
