import 'dart:convert';

class Acount {
  Acount({
    required this.ok,
    this.contador,
    this.tarjeta,
    this.planUsuarioTarjeta,
  });

  final bool ok;
  final int? contador;
  final Tarjeta? tarjeta;
  final String? planUsuarioTarjeta;

  Acount copyWith({
    bool? ok,
    int? contador,
    Tarjeta? tarjeta,
    String? planUsuarioTarjeta,
  }) =>
      Acount(
        ok: ok ?? this.ok,
        contador: contador ?? this.contador,
        tarjeta: tarjeta ?? this.tarjeta,
        planUsuarioTarjeta: planUsuarioTarjeta ?? this.planUsuarioTarjeta,
      );

  factory Acount.fromJson(String str) => Acount.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Acount.fromMap(Map<String, dynamic> json) => Acount(
        ok: json["ok"],
        contador: json["contador"],
        tarjeta: Tarjeta.fromMap(json["tarjeta"]),
        planUsuarioTarjeta: json["planUsuarioTarjeta"],
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "contador": contador,
        "tarjeta": tarjeta?.toMap(),
        "planUsuarioTarjeta": planUsuarioTarjeta,
      };
}

class Tarjeta {
  Tarjeta({
    required this.links,
    required this.contador,
    required this.copia,
    required this.updated,
    required this.created,
    required this.id,
    required this.slug,
    required this.name,
    required this.surname,
    required this.title,
    required this.org,
    required this.www,
    required this.email,
    required this.avatar,
    required this.logo,
    required this.dir,
    required this.slogan,
    required this.facebook,
    required this.app,
    required this.tel,
    required this.cel,
    required this.wa,
    required this.v,
    required this.bgcolor,
    required this.logowidth,
    required this.themeicons,
    required this.icono,
    required this.partner,
    required this.style,
    required this.social,
    required this.urlmaps,
    required this.bgcolorfoot,
    required this.slogancolor,
    required this.namecolor,
    required this.titlecolor,
    required this.labelcolor,
    required this.mbuttoncolor,
  });

  //personal infor
  final String name;
  final String surname;
  final String id;
  final String facebook;
  final String email;
  final String tel;
  final String cel;
  final String avatar;

  final String title;
  final String logo;
  final String dir;
  final String slogan;

  final String app;
  final String slug;
  final List<dynamic> links;
  final int contador;
  final int copia;
  final DateTime updated;
  final DateTime created;
  final String org;
  final String www;

  final String wa;
  final int v;
  final String bgcolor;
  final String logowidth;
  final String themeicons;
  final String icono;
  final dynamic partner;
  final Style style;
  final List<Social> social;
  final String urlmaps;
  final String bgcolorfoot;
  final String slogancolor;
  final String namecolor;
  final String titlecolor;
  final String labelcolor;
  final String mbuttoncolor;

  Tarjeta copyWith({
    List<dynamic>? links,
    int? contador,
    int? copia,
    DateTime? updated,
    DateTime? created,
    String? id,
    String? slug,
    String? name,
    String? surname,
    String? title,
    String? org,
    String? www,
    String? email,
    String? avatar,
    String? logo,
    String? dir,
    String? slogan,
    String? facebook,
    String? app,
    String? tel,
    String? cel,
    String? wa,
    int? v,
    String? bgcolor,
    String? logowidth,
    String? themeicons,
    String? icono,
    dynamic partner,
    Style? style,
    List<Social>? social,
    String? urlmaps,
    String? bgcolorfoot,
    String? slogancolor,
    String? namecolor,
    String? titlecolor,
    String? labelcolor,
    String? mbuttoncolor,
  }) =>
      Tarjeta(
        links: links ?? this.links,
        contador: contador ?? this.contador,
        copia: copia ?? this.copia,
        updated: updated ?? this.updated,
        created: created ?? this.created,
        id: id ?? this.id,
        slug: slug ?? this.slug,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        title: title ?? this.title,
        org: org ?? this.org,
        www: www ?? this.www,
        email: email ?? this.email,
        avatar: avatar ?? this.avatar,
        logo: logo ?? this.logo,
        dir: dir ?? this.dir,
        slogan: slogan ?? this.slogan,
        facebook: facebook ?? this.facebook,
        app: app ?? this.app,
        tel: tel ?? this.tel,
        cel: cel ?? this.cel,
        wa: wa ?? this.wa,
        v: v ?? this.v,
        bgcolor: bgcolor ?? this.bgcolor,
        logowidth: logowidth ?? this.logowidth,
        themeicons: themeicons ?? this.themeicons,
        icono: icono ?? this.icono,
        partner: partner ?? this.partner,
        style: style ?? this.style,
        social: social ?? this.social,
        urlmaps: urlmaps ?? this.urlmaps,
        bgcolorfoot: bgcolorfoot ?? this.bgcolorfoot,
        slogancolor: slogancolor ?? this.slogancolor,
        namecolor: namecolor ?? this.namecolor,
        titlecolor: titlecolor ?? this.titlecolor,
        labelcolor: labelcolor ?? this.labelcolor,
        mbuttoncolor: mbuttoncolor ?? this.mbuttoncolor,
      );

  factory Tarjeta.fromJson(String str) => Tarjeta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tarjeta.fromMap(Map<String, dynamic> json) => Tarjeta(
        links: List<dynamic>.from(json["links"].map((x) => x)),
        contador: json["contador"],
        copia: json["copia"],
        updated: DateTime.parse(json["updated"]),
        created: DateTime.parse(json["created"]),
        id: json["_id"],
        slug: json["slug"],
        name: json["name"],
        surname: json["surname"],
        title: json["title"],
        org: json["org"],
        www: json["www"],
        email: json["email"],
        avatar: json["avatar"],
        logo: json["logo"],
        dir: json["dir"],
        slogan: json["slogan"],
        facebook: json["facebook"],
        app: json["app"],
        tel: json["tel"],
        cel: json["cel"],
        wa: json["wa"],
        v: json["__v"],
        bgcolor: json["bgcolor"],
        logowidth: json["logowidth"],
        themeicons: json["themeicons"],
        icono: json["icono"],
        partner: json["partner"],
        style: Style.fromMap(json["style"]),
        social: List<Social>.from(json["social"].map((x) => Social.fromMap(x))),
        urlmaps: json["urlmaps"],
        bgcolorfoot: json["bgcolorfoot"],
        slogancolor: json["slogancolor"],
        namecolor: json["namecolor"],
        titlecolor: json["titlecolor"],
        labelcolor: json["labelcolor"],
        mbuttoncolor: json["mbuttoncolor"],
      );

  Map<String, dynamic> toMap() => {
        "links": List<dynamic>.from(links.map((x) => x)),
        "contador": contador,
        "copia": copia,
        "updated": updated.toIso8601String(),
        "created": created.toIso8601String(),
        "_id": id,
        "slug": slug,
        "name": name,
        "surname": surname,
        "title": title,
        "org": org,
        "www": www,
        "email": email,
        "avatar": avatar,
        "logo": logo,
        "dir": dir,
        "slogan": slogan,
        "facebook": facebook,
        "app": app,
        "tel": tel,
        "cel": cel,
        "wa": wa,
        "__v": v,
        "bgcolor": bgcolor,
        "logowidth": logowidth,
        "themeicons": themeicons,
        "icono": icono,
        "partner": partner,
        "style": style.toMap(),
        "social": List<dynamic>.from(social.map((x) => x.toMap())),
        "urlmaps": urlmaps,
        "bgcolorfoot": bgcolorfoot,
        "slogancolor": slogancolor,
        "namecolor": namecolor,
        "titlecolor": titlecolor,
        "labelcolor": labelcolor,
        "mbuttoncolor": mbuttoncolor,
      };
}

class Social {
  Social({
    required this.name,
    required this.icon,
    required this.url,
  });

  final String name;
  final String icon;
  final String url;

  Social copyWith({
    String? name,
    String? icon,
    String? url,
  }) =>
      Social(
        name: name ?? this.name,
        icon: icon ?? this.icon,
        url: url ?? this.url,
      );

  factory Social.fromJson(String str) => Social.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Social.fromMap(Map<String, dynamic> json) => Social(
        name: json["name"],
        icon: json["icon"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "icon": icon,
        "url": url,
      };
}

class Style {
  Style({
    required this.themeicons,
    required this.buttoncolor,
    required this.logowidth,
    required this.bgcolor1,
    required this.bgcolor2,
    required this.bgcolor,
  });

  final String themeicons;
  final String buttoncolor;
  final String logowidth;
  final String bgcolor1;
  final String bgcolor2;
  final String bgcolor;

  Style copyWith({
    String? themeicons,
    String? buttoncolor,
    String? logowidth,
    String? bgcolor1,
    String? bgcolor2,
    String? bgcolor,
  }) =>
      Style(
        themeicons: themeicons ?? this.themeicons,
        buttoncolor: buttoncolor ?? this.buttoncolor,
        logowidth: logowidth ?? this.logowidth,
        bgcolor1: bgcolor1 ?? this.bgcolor1,
        bgcolor2: bgcolor2 ?? this.bgcolor2,
        bgcolor: bgcolor ?? this.bgcolor,
      );

  factory Style.fromJson(String str) => Style.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Style.fromMap(Map<String, dynamic> json) => Style(
        themeicons: json["themeicons"],
        buttoncolor: json["buttoncolor"],
        logowidth: json["logowidth"],
        bgcolor1: json["bgcolor1"],
        bgcolor2: json["bgcolor2"],
        bgcolor: json["bgcolor"],
      );

  Map<String, dynamic> toMap() => {
        "themeicons": themeicons,
        "buttoncolor": buttoncolor,
        "logowidth": logowidth,
        "bgcolor1": bgcolor1,
        "bgcolor2": bgcolor2,
        "bgcolor": bgcolor,
      };
}
