import 'dart:convert';

Comics comicsFromJson(String str) => Comics.fromJson(json.decode(str));

String comicsToJson(Comics data) => json.encode(data.toJson());

class Comics {
  Comics({
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
  List<Comic> results;
  String version;

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results:
            List<Comic>.from(json["results"].map((x) => Comic.fromJson(x))),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "version": version,
      };
}

class Comic {
  Comic({
    required this.aliases,
    required this.apiDetailUrl,
    required this.coverDate,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.hasStaffReview,
    required this.id,
    required this.image,
    required this.associatedImages,
    required this.issueNumber,
    required this.name,
    required this.siteDetailUrl,
    required this.storeDate,
    required this.volume,
  });

  dynamic aliases;
  String apiDetailUrl;
  DateTime? coverDate;
  DateTime dateAdded;
  DateTime dateLastUpdated;
  dynamic deck;
  String? description;
  bool hasStaffReview;
  int id;
  ImageC image;
  List<AssociatedImage> associatedImages;
  String issueNumber;
  String? name;
  String siteDetailUrl;
  DateTime? storeDate;
  Volume volume;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        coverDate: json["cover_date"] == null
            ? null
            : DateTime.parse(json["cover_date"]),
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"] == null ? null : json["description"],
        hasStaffReview: json["has_staff_review"],
        id: json["id"],
        image: ImageC.fromJson(json["image"]),
        associatedImages: List<AssociatedImage>.from(
            json["associated_images"].map((x) => AssociatedImage.fromJson(x))),
        issueNumber: json["issue_number"],
        name: json["name"] == null ? null : json["name"],
        siteDetailUrl: json["site_detail_url"],
        storeDate: json["store_date"] == null
            ? null
            : DateTime.parse(json["store_date"]),
        volume: Volume.fromJson(json["volume"]),
      );

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "cover_date": coverDate == null
            ? null
            : "${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded.toIso8601String(),
        "date_last_updated": dateLastUpdated.toIso8601String(),
        "deck": deck,
        "description": description == null ? null : description,
        "has_staff_review": hasStaffReview,
        "id": id,
        "image": image.toJson(),
        "associated_images":
            List<dynamic>.from(associatedImages.map((x) => x.toJson())),
        "issue_number": issueNumber,
        "name": name == null ? null : name,
        "site_detail_url": siteDetailUrl,
        "store_date": storeDate == null
            ? null
            : "${storeDate!.year.toString().padLeft(4, '0')}-${storeDate!.month.toString().padLeft(2, '0')}-${storeDate!.day.toString().padLeft(2, '0')}",
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
  ImageTags? imageTags;

  factory AssociatedImage.fromJson(Map<String, dynamic> json) =>
      AssociatedImage(
        originalUrl: json["original_url"],
        id: json["id"],
        caption: json["caption"],
        imageTags: imageTagsValues.map[json["image_tags"]],
      );

  Map<String, dynamic> toJson() => {
        "original_url": originalUrl,
        "id": id,
        "caption": caption,
        "image_tags": imageTagsValues.reverse[imageTags],
      };
}

enum ImageTags { ALL_IMAGES }

final imageTagsValues = EnumValues({"All Images": ImageTags.ALL_IMAGES});

class ImageC {
  ImageC({
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
  ImageTags? imageTags;

  factory ImageC.fromJson(Map<String, dynamic> json) => ImageC(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: imageTagsValues.map[json["image_tags"]],
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
        "image_tags": imageTagsValues.reverse[imageTags],
      };
}

class Volume {
  Volume({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
  });

  String apiDetailUrl;
  int id;
  String name;
  String siteDetailUrl;

  factory Volume.fromJson(Map<String, dynamic> json) => Volume(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
