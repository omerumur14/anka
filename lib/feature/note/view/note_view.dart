import 'package:anka/product/widgets/appbar/appbar.dart';
import 'package:anka/product/widgets/button/button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  final TextEditingController textController = TextEditingController();
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
                'Not Çıkar',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: Theme.of(context).textTheme.titleLarge,
                controller: textController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                cursorColor: Theme.of(context).colorScheme.inverseSurface,
                decoration: InputDecoration(
                  hintText: 'Başlık Veya Konu Girin',
                  hintStyle: Theme.of(context).textTheme.titleLarge,
                  labelText: 'Başlık Veya Konu',
                  labelStyle: Theme.of(context).textTheme.titleLarge,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 4,
                maxLength: 4095,
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
