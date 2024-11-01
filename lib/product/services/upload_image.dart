import 'package:anka/product/services/image_choose_file.dart';
import 'package:http/http.dart' as http;

class UploadImage {
  static Future<void> uploadFile(String uploadUrl) async {
    if (ChooseFile.objFile == null) {
      print("Yüklenecek dosya bulunamadı.");
      return;
    }

    try {
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      request.files.add(
        http.MultipartFile.fromBytes(
          'foto',
          ChooseFile.objFile!.bytes!,
          filename: ChooseFile.objFile!.name,
        ),
      );

      // İstek gönder ve yanıtı bekle
      var response = await request.send();

      if (response.statusCode == 200) {
        print("Dosya başarıyla yüklendi!");
      } else {
        print("Yükleme hatası: ${response.statusCode}");
      }
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }
}
