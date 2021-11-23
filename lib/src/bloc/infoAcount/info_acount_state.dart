part of 'info_acount_bloc.dart';

@immutable
class InfoAcountState {
  final Acount acount;

  const InfoAcountState({required this.acount});

  InfoAcountState copyWhith({Acount? acount}) => InfoAcountState(
        acount: acount ?? this.acount,
      );
}
