// To parse this JSON data, do
//
//     final marvelDto = marvelDtoFromMap(jsonString);

import 'dart:convert';

MarvelDTO marvelDtoFromMap(String str) => MarvelDTO.map(json.decode(str));

String marvelDtoToMap(MarvelDTO data) => json.encode(data.toMap());

class MarvelDTO {
  MarvelDTO({
    this.id,
    this.title,
    this.boxOffice,
    this.duration,
    this.overview,
    this.coverUrl,
    this.trailerUrl,
    this.directedBy,
    this.phase,
    this.saga,
    this.chronology,
    this.postCreditScenes,
    this.imdbId,
  });

  int? id;
  String? title;
  String? boxOffice;
  int? duration;
  String? overview;
  String? coverUrl;
  String? trailerUrl;
  String? directedBy;
  int? phase;
  String? saga;
  int? chronology;
  int? postCreditScenes;
  String? imdbId;

  factory MarvelDTO.map(Map<String, dynamic> json) => MarvelDTO(
        id: json["id"],
        title: json["title"],
        boxOffice: json["box_office"],
        duration: json["duration"],
        overview: json["overview"],
        coverUrl: json["cover_url"],
        trailerUrl: json["trailer_url"],
        directedBy: json["directed_by"],
        phase: json["phase"],
        saga: json["saga"],
        chronology: json["chronology"],
        postCreditScenes: json["post_credit_scenes"],
        imdbId: json["imdb_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "box_office": boxOffice,
        "duration": duration,
        "overview": overview,
        "cover_url": coverUrl,
        "trailer_url": trailerUrl,
        "directed_by": directedBy,
        "phase": phase,
        "saga": saga,
        "chronology": chronology,
        "post_credit_scenes": postCreditScenes,
      };
}
