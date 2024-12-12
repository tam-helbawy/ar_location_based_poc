import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class FileOpener {
  void openFile(String filePath) {
    String extension = filePath.split('.').last;
    const types = {
      ".pdf": "application/pdf",
      ".dwg": "application/x-autocad",
      ".png": "image/png",
      ".jpg": "image/jpeg",
      ".jpeg": "image/jpeg",
      ".gif": "image/gif",
    };
    log(extension);
    String type = types['.' + extension] ?? "application/octet-stream";
    OpenFile.open(filePath, type: type);
  }

  void openFileFromStorage() async {
    String? filePath;
    var response = await FilePicker.platform.pickFiles();
    if (response != null) {
      filePath = response.files.single.path!;
    }
    if (filePath != null) openFile(filePath);
  }
}
