import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/core/network/network_request.dart';

extension NetworkRequestExtension on NetworkRequest {
  bool get _canBeConvertedToFormData =>
      hasBodyAndProgress() && body != null && body!.entries.isNotEmpty;

  bool hasBodyAndProgress() =>
      method == RequestMethod.post ||
      method == RequestMethod.put ||
      method == RequestMethod.patch ||
      method == RequestMethod.delete;

  String asString() {
    return method.toString().split('.').last.toUpperCase();
  }

  Future<void> prepareRequestData() async {
    if (_canBeConvertedToFormData) {
      final entries = body!.entries.toList();
      for (var i = 0; i < entries.length; i++) {
        final value = entries[i].value;
        if (value is File) {
          isFormData = true;
          body![entries[i].key] = await value.toMultiPart();
        } else if (value is List<File>) {
          isFormData = true;
          body![entries[i].key] = await value.toMultiPart();
        }
      }
    }
  }
}

extension MultiPartFileConverter on File {
  Future<MultipartFile> toMultiPart() async {
    return await MultipartFile.fromFile(path);
  }
}

extension MultiPartFileListConverter on List<File> {
  Future<List<MultipartFile>> toMultiPart() async {
    final List<MultipartFile> multipartFiles = [];
    for (final file in this) {
      multipartFiles.add(await file.toMultiPart());
    }
    return multipartFiles;
  }
}
