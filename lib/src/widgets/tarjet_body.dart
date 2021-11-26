import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webtarjeta/src/helpers/string_to_color.dart';
import 'package:webtarjeta/src/models/api.dart';

import 'package:webtarjeta/src/widgets/lessbar.dart';
import 'package:webtarjeta/src/widgets/svg_image.dart';
import 'package:webtarjeta/src/widgets/title.dart';

/////tarjeta
const base = 'https://bc.grupodime.com.mx/api/';
const String tarjetaSlug = 'tarjeta-slug/'; //Database
const String tarjetaIcon = 'tarjeta-icono/'; //Logo empreza
const String tarjetaLogo = 'img/tarjeta-logo/'; //Logo empreza
const String tarjetaAvatar = 'img/tarjeta-avatar/'; //Avatar
const String tarjetaBoton = 'img/tarjeta-boton/'; //
const String manifest = 'manifest/';

@immutable
class TarjetaKey extends StatelessWidget {
  final Acount acount;

  const TarjetaKey({Key? key, required this.acount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 800,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: ((acount.tarjeta?.bgcolor?.length ?? 0) > 2)
              ? stringToColor(acount.tarjeta!.bgcolor!)
              : Colors.grey.shade300,
          border: Border.all(
            width: 3,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          listaItem(context: context),
          Lessbar(acount: acount),
        ],
      ),
    );
  }

  Widget listaItem({
    required BuildContext context,
  }) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          //////////////////Logo

          (!acount.ok)
              ? const SizedBox()
              : SizedBox(
                  height: 100,
                  child: FadeInImage(
                    placeholder: const AssetImage('no-image.jpg'),
                    image: NetworkImage(
                      base + tarjetaLogo + (acount.tarjeta!.logo ?? ""),
                    ),
                  ),
                ),
/*
FadeInImage(
                    placeholder: const AssetImage('no-image.jpg'),
                    image: NetworkImage(
                      base + tarjetaLogo + (acount.tarjeta!.logo ?? ""),
                    ),
                  ),*/
          //////////////////Avatar
          SizedBox(
            width: 300,
            child: Row(
              children: [
                !acount.ok
                    ? const Text("  ")
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        clipBehavior: Clip.antiAlias,
                        child: SizedBox(
                          height: 100,
                          child: FadeInImage(
                            height: 100,
                            placeholder: const AssetImage('no-image.jpg'),
                            image: NetworkImage(
                              base +
                                  tarjetaAvatar +
                                  (acount.tarjeta!.avatar ?? ""),
                            ),
                          ),
                        ),
                      ),
                Flexible(
                  child: ListTile(
                    title: Text(
                      acount.ok == false ? "" : acount.tarjeta!.name ?? "",
                      style: TextStyle(
                          color: stringToColor(
                              acount.tarjeta?.titlecolor ?? "#FFFFFF"),
                          fontSize: 18),
                    ),
                    subtitle: Text(
                      acount.ok == false ? "" : acount.tarjeta!.surname ?? "",
                      style: TextStyle(
                          color: stringToColor(
                              acount.tarjeta?.surnamecolor ?? "#FFFFFF"),
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /////////Presentacion
          const SizedBox(
            height: 20,
          ),
          Text(
            acount.ok == false ? "" : acount.tarjeta!.title ?? "",
            style: TextStyle(
              color: stringToColor((acount.tarjeta?.surnamecolor) ?? "#FFFFFF"),
              fontSize: 16,
            ),
          ),
          Text(
            acount.ok == false ? "" : acount.tarjeta!.slogan ?? "",
            style: TextStyle(
              color: stringToColor((acount.tarjeta?.slogancolor) ?? "#FFFFFF"),
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //////////////////Items
          SingleChildScrollView(
            child: listaAdaptable(
              context: context,
            ),
          ),
        ],
      ),
    );
  }

  Column listaAdaptable({required BuildContext context}) {
    const snackBar = SnackBar(
        content: Text('Copiado al portapapeles'),
        duration: Duration(seconds: 2));

    List<Widget> widgets = [];

    if (acount.ok) {
      /////////empresa
      if (((acount.tarjeta?.labelorg?.length ?? 0) > 2) &&
          ((acount.tarjeta?.org?.length ?? 0) > 2)) {
        widgets.add(
          TitleAdd(
            textTitle: acount.tarjeta!.labelorg!,
            textSubTitle: acount.tarjeta!.org ?? "",
            color: stringToColor((acount.tarjeta?.labelcolor) ?? "#FFFFFF"),
            function: () {
              launch(acount.tarjeta!.www ?? "");
            },
          ),
        );
      }
      /////////Telefono
      if ((acount.tarjeta?.tel?.length ?? 0) > 2) {
        widgets.add(
          TitleAdd(
            textTitle: "Hablame",
            textSubTitle: acount.tarjeta!.tel,
            iconSubTitle: const Icon(Icons.phone),
            color: stringToColor((acount.tarjeta?.labelcolor) ?? "#FFFFFF"),
            function: () {
              launch('tel:${acount.tarjeta!.email}');
            },
          ),
        );
      }
      /////////Whatsapp
      if ((acount.tarjeta?.wa?.length ?? 0) > 2) {
        widgets.add(
          TitleAdd(
            textTitle: "Whatsapp",
            textSubTitle: acount.tarjeta!.wa,
            iconSubTitle: const FaIcon(FontAwesomeIcons.whatsapp),
            color: stringToColor((acount.tarjeta?.labelcolor) ?? "#FFFFFF"),
            function: () {
              launch('https://api.whatsapp.com/send/?phone=' +
                  acount.tarjeta!.wa!.replaceAll('+', '') +
                  '&text&app_absent=0');
            },
          ),
        );
      }
      /////////Email
      if ((acount.tarjeta?.email?.length ?? 0) > 2) {
        widgets.add(
          TitleAdd(
            textTitle: "Enviame Un Correo",
            textSubTitle: acount.tarjeta!.email,
            iconSubTitle: const Icon(Icons.message),
            color: stringToColor((acount.tarjeta?.labelcolor) ?? "#FFFFFF"),
            function: () {
              launch('mailto:${acount.tarjeta!.email}');
            },
          ),
        );
      }
      /////////dirreccion
      if ((acount.tarjeta?.dir?.length ?? 0) > 2) {
        widgets.add(
          TitleAdd(
            textTitle: "Dirección",
            textSubTitle: acount.tarjeta!.dir,
            iconSubTitle: const Icon(Icons.location_on),
            color: stringToColor((acount.tarjeta?.labelcolor) ?? "#FFFFFF"),
            function: () async {
              await launch(
                  (acount.tarjeta!.urlmaps ?? acount.tarjeta!.urlMaps) ??
                      "https://www.google.com.mx/maps/preview");
            },
          ),
        );
      }
      SvgParser();
      if (acount.tarjeta!.links?.isNotEmpty ?? false) {
        acount.tarjeta!.links?.forEach((element) {
          if (element.place == "link") {
            widgets.add(
              TitleAdd(
                color: stringToColor((acount.tarjeta?.labelcolor) ?? "#FFFFFF"),
                textTitle: element.label,
                iconTitle: SizedBox(
                  height: 40,
                  width: 40,
                  child: ImageSvgWeb(
                    url: base + tarjetaBoton + element.icon!,
                    width: 40,
                    height: 40,
                  ),
                ),
                function: () async {
                  await launch(element.url ?? "");
                },
              ),
            );
          }
        });
      }

      /////////compartir
      widgets.add(
        TitleAdd(
          textTitle: "Compartir Tarjeta",
          iconTitle: const Icon(Icons.share),
          color: stringToColor((acount.tarjeta?.labelcolor) ?? "#FFFFFF"),
          function: () {
            Share.share("{'decode':'decode'}", subject: "Compartir");
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }

    widgets.add(const SizedBox(
      height: 80,
    ));
    return Column(
      children: widgets,
    );
  }
}

class Time {}
