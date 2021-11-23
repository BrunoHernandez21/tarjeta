part of 'info_acount_bloc.dart';

@immutable
abstract class InfoAcountEvent {}

class OnLoadAcont extends InfoAcountEvent {
  final Acount acount;

  OnLoadAcont(this.acount);
}

class ClearData extends InfoAcountEvent {}
