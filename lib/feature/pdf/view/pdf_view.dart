import 'package:anka/product/services/pdf_choose_file.dart';
import 'package:anka/product/widgets/appbar/appbar.dart';
import 'package:anka/product/widgets/button/button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PdfView extends StatefulWidget {
  const PdfView({super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  void initState() {
    super.initState();
    // Sayfa oluşturulduğunda ChooseFile sınıfındaki objFile değişkenini sıfırla
    PdfChooseFile.objFile = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(autoLeading: true),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                'PDF Özetle',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.outline, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomButton(
                      onPressed: () async {
                        await PdfChooseFile.chooseFileUsingFilePicker();
                        setState(() {});
                      },
                      text: 'Dosya Seç',
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Dosya Adı: ${PdfChooseFile.objFile?.name ?? 'Dosya Seçilmedi'}',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Dosya Boyutu: ${((PdfChooseFile.objFile?.size.toDouble() ?? 0) / 1000000).toStringAsFixed(2)} Mb',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: CustomButton(
                onPressed: () {},
                text: 'Gönder',
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
