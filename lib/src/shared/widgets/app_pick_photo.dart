import 'package:flutter/material.dart';

class AppPickPhoto extends StatelessWidget {
  const AppPickPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Chamei a foto!!!!');
      },
      child: Container(
        color: const Color.fromARGB(80, 201, 200, 200),
        height: 200,
        width: double.infinity,
        child: const Center(
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
