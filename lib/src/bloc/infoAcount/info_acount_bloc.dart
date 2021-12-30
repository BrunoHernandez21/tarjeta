import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:webtarjeta/src/models/api.dart';
import 'package:http/http.dart' as http;

part 'info_acount_event.dart';
part 'info_acount_state.dart';

class InfoAcountBloc extends Bloc<InfoAcountEvent, InfoAcountState> {
  Future<void> loadAcount(String url) async {
    final String info = (await http.get(
      Uri.parse(url),
    ))
        .body;
    try {
      final Acount acount = Acount.fromJson(info);
      add(OnLoadAcont(acount));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  InfoAcountBloc() : super(InfoAcountState(acount: Acount(ok: false))) {
    on<OnLoadAcont>((event, emit) {
      emit(state.copyWhith(acount: event.acount));
    });
  }
}
