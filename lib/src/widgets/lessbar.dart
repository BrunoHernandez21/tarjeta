import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webtarjeta/src/helpers/string_to_color.dart';
import 'package:webtarjeta/src/models/api.dart';
import 'package:webtarjeta/src/widgets/svg_image.dart';

import 'icon_button.dart';

const base = 'https://bc.grupodime.com.mx/api/';
const String tarjetaSlug = 'tarjeta-slug/'; //Database
const String tarjetaIcon = 'tarjeta-icono/'; //Logo empreza
const String tarjetaLogo = 'img/tarjeta-logo/'; //Logo empreza
const String tarjetaAvatar = 'img/tarjeta-avatar/'; //Avatar
const String tarjetaBoton = 'img/tarjeta-boton/'; //
const String manifest = 'manifest/';

class Lessbar extends StatelessWidget {
  final Acount acount;

  const Lessbar({
    Key? key,
    required this.acount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: stringToColor(acount.tarjeta?.bgcolorfoot ?? "#FFFFFF"),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 75,
        width: double.infinity,
        alignment: Alignment.center,
        child: listaAdaptable(context: context, acount: acount),
      ),
    );
  }

  Row listaAdaptable({required BuildContext context, required Acount acount}) {
    List<Widget> widgets = [];
    const espacio = SizedBox(
      width: 60,
    );
    if (acount.ok) {
      /////////empresa
      if ((acount.tarjeta?.facebook?.length ?? 0) > 2) {
        widgets.add(espacio);
        widgets.add(
          IconButtonEx(
            onPressed: () async {
              await launch('https://www.facebook.com/');
            },
            icon: const Icon(Icons.facebook),
            color: Colors.blue.shade400,
          ),
        );
      }

      /////////Telefono
      if ((acount.tarjeta?.www?.length ?? 0) > 2) {
        widgets.add(espacio);
        widgets.add(
          IconButtonEx(
            onPressed: () async {
              await launch(acount.tarjeta?.www ?? "");
            },
            icon: const Icon(Icons.language),
            color: Colors.white,
          ),
        );
      }

      if (acount.tarjeta!.links?.isNotEmpty ?? false) {
        acount.tarjeta!.links?.forEach((element) {
          if (element.place == "quick-boton") {
            widgets.add(espacio);
            widgets.add(
              IconButtonEx(
                onPressed: () async {
                  await launch(element.url ?? "");
                },
                icon: ImageSvgWeb(
                  url: base + tarjetaBoton + element.icon!,
                  width: 40,
                  height: 40,
                ),
                color: stringToColor(acount.tarjeta?.mbuttoncolor ?? "#000000"),
              ),
            );
          }
        });
      }
    }
    widgets.add(espacio);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }
}
