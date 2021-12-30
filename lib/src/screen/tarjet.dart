import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtarjeta/src/bloc/infoAcount/info_acount_bloc.dart';
import 'package:webtarjeta/src/widgets/tarjet_body.dart';

const String base = 'https://bc.grupodime.com.mx/api/';
const String tarjetaSlug = 'tarjeta-slug/'; //Database
const String username = 'Tortas_lacatedral'; //Tortas_lacatedral  - julio-dime

class Tarjet extends StatelessWidget {
  const Tarjet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<InfoAcountBloc>(context)
        .loadAcount(base + tarjetaSlug + username);
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      body: BlocBuilder<InfoAcountBloc, InfoAcountState>(
        builder: (context, state) {
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: TarjetaKey(acount: state.acount),
            ),
          );
        },
      ),
    );
  }
}
