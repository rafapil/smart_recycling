import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppPickPhoto extends StatelessWidget {
  final bool isImage;
  final XFile? image;

  const AppPickPhoto({
    super.key,
    this.isImage = false,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: const Color.fromARGB(80, 201, 200, 200),
        height: 200,
        width: double.infinity,
        child: isImage
            ? Center(
                child: Image.file(
                File(image!.path),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ))
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_enhance_rounded,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Adicionar foto',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Resolução recomendada',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '820(px) x 400(px)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
