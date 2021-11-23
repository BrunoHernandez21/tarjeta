import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtarjeta/src/models/api.dart';

import 'icon_button.dart';

///////////lesbar
class Lessbar extends StatelessWidget {
  final Acount acount;

  const Lessbar({
    Key? key,
    required this.acount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _separacion = 50.0;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.black,
        height: 75,
        width: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButtonEx(
                onPressed: () async {
                  await launch('https://www.facebook.com/');
                },
                icon: const Icon(Icons.qr_code),
                color: Colors.brown.shade400,
              ),
              const SizedBox(
                width: _separacion,
              ),
              IconButtonEx(
                onPressed: () async {
                  await launch('https://www.facebook.com/');
                },
                icon: const Icon(Icons.language),
                color: Colors.white,
              ),
              const SizedBox(
                width: _separacion,
              ),
              IconButtonEx(
                onPressed: () async {
                  await launch('https://www.facebook.com/');
                },
                icon: const Icon(Icons.phonelink_ring),
                color: Colors.purple.shade300,
              ),
              const SizedBox(
                width: _separacion,
              ),
              IconButtonEx(
                onPressed: () async {
                  await launch('https://www.facebook.com/');
                },
                icon: const Icon(Icons.facebook),
                color: Colors.blue.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
