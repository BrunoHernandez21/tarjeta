import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webtarjeta/src/bloc/infoAcount/info_acount_bloc.dart';
import 'package:webtarjeta/src/models/api.dart';
import 'package:webtarjeta/src/widgets/icon_button.dart';
import 'package:webtarjeta/src/widgets/title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class Tarjet extends StatelessWidget {
  const Tarjet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      body: BlocBuilder<InfoAcountBloc, InfoAcountState>(
        builder: (context, state) {
          if (state.acount.ok == false) {
            BlocProvider.of<InfoAcountBloc>(context).loadAcount();
          }
          return Center(
            child: TarjetaKey(acount: state.acount),
          );
        },
      ),
    );
  }
}

//////tarjeta

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
          image: const DecorationImage(
            image: AssetImage("fondo2.jpg"),
            fit: BoxFit.cover,
          ),
          //color: Colors.cyan.shade900,
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
    const snackBar = SnackBar(
      content: Text('Copiado al portapapeles'),
      duration: Duration(seconds: 2),
    );
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
          const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            clipBehavior: Clip.antiAlias,
            child: Image(
              height: 150,
              image: AssetImage('dimeLogo.png'),
              fit: BoxFit.cover,
            ),
          ),

          //////////////////Avatar
          SizedBox(
            width: 300,
            child: Row(
              children: [
                CircleAvatar(
                  child: acount.ok == false
                      ? const Text("  ")
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://bc.grupodime.com.mx/api/img/tarjeta-logo/' +
                                acount.tarjeta!.avatar,
                          ),
                        ),
                  minRadius: 30,
                  maxRadius: 50,
                ),
                Flexible(
                  child: ListTile(
                    title: Text(
                      acount.ok == false ? "" : acount.tarjeta!.name,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    subtitle: Text(
                      acount.ok == false ? "" : acount.tarjeta!.surname,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
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
            acount.ok == false ? "" : acount.tarjeta!.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            acount.ok == false ? "" : acount.tarjeta!.slogan,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //////////////////Items
          TitleAdd(
            textTitle: "Hablame",
            textSubTitle: acount.ok == false ? "" : acount.tarjeta!.tel,
            iconSubTitle: const Icon(Icons.phone),
            function: () {
              Clipboard.setData(ClipboardData(text: acount.tarjeta!.tel));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          TitleAdd(
            textTitle: "Whatsapp",
            textSubTitle: acount.ok == false ? "" : acount.tarjeta!.wa,
            iconSubTitle: const FaIcon(FontAwesomeIcons.whatsapp),
            function: () {
              Clipboard.setData(ClipboardData(text: acount.tarjeta!.wa));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          TitleAdd(
            textTitle: "Enviame Un Correo",
            textSubTitle: acount.ok == false ? "" : acount.tarjeta!.email,
            iconSubTitle: const Icon(Icons.message),
            function: () {
              Clipboard.setData(ClipboardData(text: acount.tarjeta!.email));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          TitleAdd(
            textTitle: "Compartir Tarjeta",
            iconTitle: const Icon(Icons.share),
            function: () {
              Share.share("{'decode':'decode'}", subject: "Compartir");
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          TitleAdd(
            textTitle: "Compartir Tarjeta",
            iconTitle: const Icon(Icons.share),
            function: () {
              Share.share("{'decode':'decode'}", subject: "Compartir");
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          const SizedBox(
            height: 80,
          )
          //TODO:Inserte las tarjetas aqui o cree su generador
        ],
      ),
    );
  }
}

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButtonEx(
              onPressed: () {},
              icon: const Icon(Icons.qr_code),
              color: Colors.brown.shade400,
            ),
            const SizedBox(
              width: _separacion,
            ),
            IconButtonEx(
              onPressed: () {},
              icon: const Icon(Icons.language),
              color: Colors.white,
            ),
            const SizedBox(
              width: _separacion,
            ),
            IconButtonEx(
              onPressed: () {},
              icon: const Icon(Icons.phonelink_ring),
              color: Colors.purple.shade300,
            ),
            const SizedBox(
              width: _separacion,
            ),
            IconButtonEx(
              onPressed: () {},
              icon: const Icon(Icons.facebook),
              color: Colors.blue.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
