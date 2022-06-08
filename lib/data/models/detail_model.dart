// To parse this JSON data, do
//
//     final detail = detailFromJson(jsonString);

import 'dart:convert';

Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));

String detailToJson(Detail data) => json.encode(data.toJson());

class Detail {
  Detail({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  String error;
  int limit;
  int offset;
  int numberOfPageResults;
  int numberOfTotalResults;
  int statusCode;
  Results results;
  String version;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: Results.fromJson(json["results"]),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results.toJson(),
        "version": version,
      };
}

class Results {
  Results({
    required this.aliases,
    required this.apiDetailUrl,
    required this.associatedImages,
    required this.characterCredits,
    required this.characterDiedIn,
    required this.conceptCredits,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.firstAppearanceCharacters,
    required this.firstAppearanceConcepts,
    required this.firstAppearanceLocations,
    required this.firstAppearanceObjects,
    required this.firstAppearanceStoryarcs,
    required this.firstAppearanceTeams,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.issueNumber,
    required this.locationCredits,
    required this.name,
    required this.objectCredits,
    required this.personCredits,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.storyArcCredits,
    required this.teamCredits,
    required this.teamDisbandedIn,
    required this.volume,
  });

  dynamic aliases;
  String apiDetailUrl;
  List<AssociatedImage> associatedImages;
  List<Volume> characterCredits;
  List<dynamic> characterDiedIn;
  List<Volume> conceptCredits;
  DateTime? coverDate;
  DateTime dateAdded;
  DateTime dateLastUpdated;
  dynamic deck;
  String? description;
  dynamic firstAppearanceCharacters;
  dynamic firstAppearanceConcepts;
  dynamic firstAppearanceLocations;
  dynamic firstAppearanceObjects;
  dynamic firstAppearanceStoryarcs;
  dynamic firstAppearanceTeams;
  bool hasStaffReview;
  int id;
  ImageD image;
  String issueNumber;
  List<Volume> locationCredits;
  String? name;
  List<dynamic> objectCredits;
  List<Volume> personCredits;
  String siteDetailUrl;
  dynamic storeDate;
  List<dynamic> storyArcCredits;
  List<dynamic> teamCredits;
  List<dynamic> teamDisbandedIn;
  Volume volume;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        associatedImages: List<AssociatedImage>.from(
            json["associated_images"].map((x) => AssociatedImage.fromJson(x))),
        characterCredits: List<Volume>.from(
            json["character_credits"].map((x) => Volume.fromJson(x))),
        characterDiedIn:
            List<dynamic>.from(json["character_died_in"].map((x) => x)),
        conceptCredits: List<Volume>.from(
            json["concept_credits"].map((x) => Volume.fromJson(x))),
        coverDate: json["cover_date"] != null
            ? DateTime.parse(json["cover_date"])
            : null,
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        firstAppearanceCharacters: json["first_appearance_characters"],
        firstAppearanceConcepts: json["first_appearance_concepts"],
        firstAppearanceLocations: json["first_appearance_locations"],
        firstAppearanceObjects: json["first_appearance_objects"],
        firstAppearanceStoryarcs: json["first_appearance_storyarcs"],
        firstAppearanceTeams: json["first_appearance_teams"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: ImageD.fromJson(json["image"]),
        issueNumber: json["issue_number"],
        locationCredits: List<Volume>.from(
            json["location_credits"].map((x) => Volume.fromJson(x))),
        name: json["name"],
        objectCredits: List<dynamic>.from(json["object_credits"].map((x) => x)),
        personCredits: List<Volume>.from(
            json["person_credits"].map((x) => Volume.fromJson(x))),
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"],
        storyArcCredits:
            List<dynamic>.from(json["story_arc_credits"].map((x) => x)),
        teamCredits: List<dynamic>.from(json["team_credits"].map((x) => x)),
        teamDisbandedIn:
            List<dynamic>.from(json["team_disbanded_in"].map((x) => x)),
        volume: Volume.fromJson(json["volume"]),
      );

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "associated_images":
            List<dynamic>.from(associatedImages.map((x) => x.toJson())),
        "character_credits":
            List<dynamic>.from(characterCredits.map((x) => x.toJson())),
        "character_died_in": List<dynamic>.from(characterDiedIn.map((x) => x)),
        "concept_credits":
            List<dynamic>.from(conceptCredits.map((x) => x.toJson())),
        "cover_date":
            "${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appearance_characters": firstAppearanceCharacters,
        "first_appearance_concepts": firstAppearanceConcepts,
        "first_appearance_locations": firstAppearanceLocations,
        "first_appearance_objects": firstAppearanceObjects,
        "first_appearance_storyarcs": firstAppearanceStoryarcs,
        "first_appearance_teams": firstAppearanceTeams,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image.toJson(),
        "issue_number": issueNumber,
        "location_credits":
            List<dynamic>.from(locationCredits.map((x) => x.toJson())),
        "name": name,
        "object_credits": List<dynamic>.from(objectCredits.map((x) => x)),
        "person_credits":
            List<dynamic>.from(personCredits.map((x) => x.toJson())),
        "site_detail_url": siteDetailUrl,
        "store_date": storeDate,
        "story_arc_credits": List<dynamic>.from(storyArcCredits.map((x) => x)),
        "team_credits": List<dynamic>.from(teamCredits.map((x) => x)),
        "team_disbanded_in": List<dynamic>.from(teamDisbandedIn.map((x) => x)),
        "volume": volume.toJson(),
      };
}

class AssociatedImage {
  AssociatedImage({
    required this.originalUrl,
    required this.id,
    required this.caption,
    required this.imageTags,
  });

  String originalUrl;
  int id;
  dynamic caption;
  String imageTags;

  factory AssociatedImage.fromJson(Map<String, dynamic> json) =>
      AssociatedImage(
        originalUrl: json["original_url"],
        id: json["id"],
        caption: json["caption"],
        imageTags: json["image_tags"],
      );

  Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
        "id": id,
        "caption": caption,
        "image_tags": imageTags,
      };
}

class Volume {
  Volume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
    required this.role,
  });

  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;
  String? role;

  factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
        "role": role == null ? null : role,
      };
}

class ImageD {
  ImageD({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
    required this.imageTags,
  });

  String iconUrl;
  String mediumUrl;
  String screenUrl;
  String screenLargeUrl;
  String smallUrl;
  String superUrl;
  String thumbUrl;
  String tinyUrl;
  String originalUrl;
  String imageTags;

  factory ImageD.fromJson(Map<String, dynamic> json) => ImageD(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
      };
}
