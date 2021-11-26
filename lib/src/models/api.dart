// To parse this JSON data, do
//
//     final tarjete = tarjeteFromMap(jsonString);

import 'dart:convert';

class Acount {
  Acount({
    required this.ok,
    this.contador,
    this.tarjeta,
    this.planUsuarioTarjeta,
  });

  bool ok;
  int? contador;
  Tarjeta? tarjeta;
  String? planUsuarioTarjeta;

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
        ok: json["ok"] ?? false,
        contador: json["contador"],
        tarjeta:
            json["tarjeta"] == null ? null : Tarjeta.fromMap(json["tarjeta"]),
        planUsuarioTarjeta: json["planUsuarioTarjeta"],
      );

  Map<String, dynamic> toMap() => {
        "ok": ok,
        "contador": contador,
        "tarjeta": tarjeta == null ? null : tarjeta?.toMap(),
        "planUsuarioTarjeta": planUsuarioTarjeta,
      };
}

class Tarjeta {
  Tarjeta({
    this.links,
    this.contador,
    this.copia,
    this.updated,
    this.created,
    this.id,
    this.slug,
    this.name,
    this.surname,
    this.title,
    this.org,
    this.www,
    this.email,
    this.avatar,
    this.logo,
    this.dir,
    this.slogan,
    this.facebook,
    this.app,
    this.tel,
    this.cel,
    this.wa,
    this.v,
    this.bgcolor,
    this.logowidth,
    this.themeicons,
    this.icono,
    this.partner,
    this.style,
    this.social,
    this.urlmaps,
    this.bgcolorfoot,
    this.slogancolor,
    this.namecolor,
    this.titlecolor,
    this.labelcolor,
    this.mbuttoncolor,
    this.urlMaps,
    this.labelorg,
    this.color,
    this.labelbordercolor,
    this.labeliconcolor,
    this.marcoavatarcolor,
    this.surnamecolor,
  });

  List<Link>? links;
  int? contador;
  int? copia;
  DateTime? updated;
  DateTime? created;
  dynamic partner;
  Style? style;
  List<Social>? social;
  int? v;
  String? bgcolor;
  String? labelorg;
  String? logowidth;
  String? themeicons;
  String? icono;
  String? urlmaps;
  String? urlMaps;
  String? bgcolorfoot;
  String? slogancolor;
  String? namecolor;
  String? titlecolor;
  String? labelcolor;
  String? mbuttoncolor;
  String? surnamecolor;
  String? labelbordercolor;
  String? marcoavatarcolor;
  String? labeliconcolor;
  String? color;
  String? id;
  String? slug;
  String? name;
  String? surname;
  String? title;
  String? org;
  String? www;
  String? email;
  String? avatar;
  String? logo;
  String? dir;
  String? slogan;
  String? facebook;
  String? app;
  String? tel;
  String? cel;
  String? wa;

  Tarjeta copyWith({
    List<Link>? links,
    int? contador,
    int? copia,
    DateTime? updated,
    DateTime? created,
    String? id,
    String? labelorg,
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
    String? urlMaps,
    String? urlmaps,
    String? bgcolorfoot,
    String? slogancolor,
    String? namecolor,
    String? titlecolor,
    String? surnamecolor,
    String? labelcolor,
    String? mbuttoncolor,
    String? labelbordercolor,
    String? marcoavatarcolor,
    String? labeliconcolor,
    String? color,
  }) =>
      Tarjeta(
        links: links ?? this.links,
        contador: contador ?? this.contador,
        copia: copia ?? this.copia,
        updated: updated ?? this.updated,
        created: created ?? this.created,
        id: id ?? this.id,
        labelorg: labelorg ?? this.labelorg,
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
        urlMaps: urlMaps ?? this.urlMaps,
        bgcolorfoot: bgcolorfoot ?? this.bgcolorfoot,
        slogancolor: slogancolor ?? this.slogancolor,
        namecolor: namecolor ?? this.namecolor,
        titlecolor: titlecolor ?? this.titlecolor,
        labelcolor: labelcolor ?? this.labelcolor,
        mbuttoncolor: mbuttoncolor ?? this.mbuttoncolor,
        color: color ?? this.color,
        labelbordercolor: labelbordercolor ?? this.labelbordercolor,
        labeliconcolor: labeliconcolor ?? this.labeliconcolor,
        marcoavatarcolor: marcoavatarcolor ?? this.marcoavatarcolor,
        surnamecolor: surnamecolor ?? this.surnamecolor,
      );

  factory Tarjeta.fromJson(String str) => Tarjeta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tarjeta.fromMap(Map<String, dynamic> json) => Tarjeta(
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
        contador: json["contador"],
        copia: json["copia"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        id: json["_id"],
        slug: json["slug"],
        name: json["name"],
        surname: json["surname"],
        title: json["title"],
        org: json["org"],
        labelorg: json["labelorg"],
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
        style: json["style"] == null ? null : Style.fromMap(json["style"]),
        social: json["social"] == null
            ? null
            : List<Social>.from(json["social"].map((x) => Social.fromMap(x))),
        urlmaps: json["urlmaps"],
        urlMaps: json["urlMaps"],
        bgcolorfoot: json["bgcolorfoot"],
        slogancolor: json["slogancolor"],
        namecolor: json["namecolor"],
        titlecolor: json["titlecolor"],
        labelcolor: json["labelcolor"],
        mbuttoncolor: json["mbuttoncolor"],
        color: json["color"],
        labelbordercolor: json["labelbordercolor"],
        labeliconcolor: json["labeliconcolor"],
        marcoavatarcolor: json["marcoavatarcolor"],
        surnamecolor: json["surnamecolor"],
      );

  Map<String, dynamic> toMap() => {
        "links": links == null
            ? null
            : List<dynamic>.from(links?.map((x) => x.toMap()) ?? []),
        "contador": contador,
        "copia": copia,
        "updated": updated?.toIso8601String(),
        "created": created?.toIso8601String(),
        "_id": id,
        "slug": slug,
        "name": name,
        "surname": surname,
        "title": title,
        "labelorg": labelorg,
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
        "style": style == null ? null : style?.toMap(),
        "social": social == null
            ? null
            : List<dynamic>.from(social?.map((x) => x.toMap()) ?? []),
        "urlmaps": urlmaps,
        "urlMaps": urlMaps,
        "bgcolorfoot": bgcolorfoot,
        "slogancolor": slogancolor,
        "namecolor": namecolor,
        "titlecolor": titlecolor,
        "labelcolor": labelcolor,
        "mbuttoncolor": mbuttoncolor,
        'color': color,
        'labelbordercolor': labelbordercolor,
        'labeliconcolor': labeliconcolor,
        'marcoavatarcolor': marcoavatarcolor,
        'surnamecolor': surnamecolor,
      };
}

class Link {
  Link({
    this.position,
    this.place,
    this.label,
    this.type,
    this.url,
    this.icon,
  });

  int? position;
  String? place;
  String? label;
  String? type;
  String? url;
  String? icon;

  Link copyWith({
    int? position,
    String? place,
    String? label,
    String? type,
    String? url,
    String? icon,
  }) =>
      Link(
        position: position ?? this.position,
        place: place ?? this.place,
        label: label ?? this.label,
        type: type ?? this.type,
        url: url ?? this.url,
        icon: icon ?? this.icon,
      );

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        position: json["position"],
        place: json["place"],
        label: json["label"],
        type: json["type"],
        url: json["url"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "position": position,
        "place": place,
        "label": label,
        "type": type,
        "url": url,
        "icon": icon,
      };
}

class Social {
  Social({
    required this.name,
    required this.icon,
    required this.url,
  });

  String name;
  String icon;
  String url;

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
    this.themeicons = "",
    this.buttoncolor = "",
    this.logowidth = "",
    this.bgcolor1 = "",
    this.bgcolor2 = "",
    this.bgcolor = "",
  });

  String themeicons;
  String buttoncolor;
  String logowidth;
  String bgcolor1;
  String bgcolor2;
  String bgcolor;

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
