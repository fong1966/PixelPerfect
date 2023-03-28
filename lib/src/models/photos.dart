// To parse this JSON data, do
//
//     final photos = photosFromMap(jsonString);

import 'dart:convert';

Photos photosFromMap(String str) => Photos.fromMap(json.decode(str));

String photosToMap(Photos data) => json.encode(data.toMap());

class Photos {
  Photos({
    this.total,
    this.totalPages,
    this.results,
  });

  final int? total;
  final int? totalPages;
  final List<Result>? results;

  factory Photos.fromMap(Map<String, dynamic> json) => Photos(
        total: json["total"],
        totalPages: json["total_pages"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "total_pages": totalPages,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
    this.tags,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? promotedAt;
  final int? width;
  final int? height;
  final String? color;
  final String? blurHash;
  final String? description;
  final String? altDescription;
  final Urls? urls;
  final ResultLinks? links;
  final int? likes;
  final bool? likedByUser;
  final List<dynamic>? currentUserCollections;
  final dynamic sponsorship;
  final ResultTopicSubmissions? topicSubmissions;
  final ResultUser? user;
  final List<Tag>? tags;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        promotedAt: json["promoted_at"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: json["urls"] == null ? null : Urls.fromMap(json["urls"]),
        links:
            json["links"] == null ? null : ResultLinks.fromMap(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null
            ? []
            : List<dynamic>.from(
                json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: json["topic_submissions"] == null
            ? null
            : ResultTopicSubmissions.fromMap(json["topic_submissions"]),
        user: json["user"] == null ? null : ResultUser.fromMap(json["user"]),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "promoted_at": promotedAt,
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls?.toMap(),
        "links": links?.toMap(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null
            ? []
            : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toMap(),
        "user": user?.toMap(),
        "tags":
            tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toMap())),
      };
}

class ResultLinks {
  ResultLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  final String? self;
  final String? html;
  final String? download;
  final String? downloadLocation;

  factory ResultLinks.fromMap(Map<String, dynamic> json) => ResultLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toMap() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Tag {
  Tag({
    this.type,
    this.title,
    this.source,
  });

  final String? type;
  final String? title;
  final Source? source;

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        type: json["type"],
        title: json["title"],
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "title": title,
        "source": source?.toMap(),
      };
}

class Source {
  Source({
    this.ancestry,
    this.title,
    this.subtitle,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.coverPhoto,
  });

  final Ancestry? ancestry;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? metaTitle;
  final String? metaDescription;
  final CoverPhoto? coverPhoto;

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        ancestry: json["ancestry"] == null
            ? null
            : Ancestry.fromMap(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: json["cover_photo"] == null
            ? null
            : CoverPhoto.fromMap(json["cover_photo"]),
      );

  Map<String, dynamic> toMap() => {
        "ancestry": ancestry?.toMap(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto?.toMap(),
      };
}

class Ancestry {
  Ancestry({
    this.type,
    this.category,
    this.subcategory,
  });

  final Category? type;
  final Category? category;
  final Category? subcategory;

  factory Ancestry.fromMap(Map<String, dynamic> json) => Ancestry(
        type: json["type"] == null ? null : Category.fromMap(json["type"]),
        category: json["category"] == null
            ? null
            : Category.fromMap(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Category.fromMap(json["subcategory"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type?.toMap(),
        "category": category?.toMap(),
        "subcategory": subcategory?.toMap(),
      };
}

class Category {
  Category({
    this.slug,
    this.prettySlug,
  });

  final String? slug;
  final String? prettySlug;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
      );

  Map<String, dynamic> toMap() => {
        "slug": slug,
        "pretty_slug": prettySlug,
      };
}

class CoverPhoto {
  CoverPhoto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.premium,
    this.user,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? promotedAt;
  final int? width;
  final int? height;
  final String? color;
  final String? blurHash;
  final String? description;
  final String? altDescription;
  final Urls? urls;
  final ResultLinks? links;
  final int? likes;
  final bool? likedByUser;
  final List<dynamic>? currentUserCollections;
  final dynamic sponsorship;
  final CoverPhotoTopicSubmissions? topicSubmissions;
  final bool? premium;
  final CoverPhotoUser? user;

  factory CoverPhoto.fromMap(Map<String, dynamic> json) => CoverPhoto(
        id: json["id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        promotedAt: json["promoted_at"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: json["urls"] == null ? null : Urls.fromMap(json["urls"]),
        links:
            json["links"] == null ? null : ResultLinks.fromMap(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null
            ? []
            : List<dynamic>.from(
                json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: json["topic_submissions"] == null
            ? null
            : CoverPhotoTopicSubmissions.fromMap(json["topic_submissions"]),
        premium: json["premium"],
        user:
            json["user"] == null ? null : CoverPhotoUser.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "promoted_at": promotedAt,
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "urls": urls?.toMap(),
        "links": links?.toMap(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null
            ? []
            : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions?.toMap(),
        "premium": premium,
        "user": user?.toMap(),
      };
}

class CoverPhotoTopicSubmissions {
  CoverPhotoTopicSubmissions({
    this.health,
    this.texturesPatterns,
    this.wallpapers,
  });

  final FoodDrink? health;
  final FoodDrink? texturesPatterns;
  final FoodDrink? wallpapers;

  factory CoverPhotoTopicSubmissions.fromMap(Map<String, dynamic> json) =>
      CoverPhotoTopicSubmissions(
        health:
            json["health"] == null ? null : FoodDrink.fromMap(json["health"]),
        texturesPatterns: json["textures-patterns"] == null
            ? null
            : FoodDrink.fromMap(json["textures-patterns"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : FoodDrink.fromMap(json["wallpapers"]),
      );

  Map<String, dynamic> toMap() => {
        "health": health?.toMap(),
        "textures-patterns": texturesPatterns?.toMap(),
        "wallpapers": wallpapers?.toMap(),
      };
}

class FoodDrink {
  FoodDrink({
    this.status,
    this.approvedOn,
  });

  final String? status;
  final String? approvedOn;

  factory FoodDrink.fromMap(Map<String, dynamic> json) => FoodDrink(
        status: json["status"],
        approvedOn: json["approved_on"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "approved_on": approvedOn,
      };
}

class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  final String? raw;
  final String? full;
  final String? regular;
  final String? small;
  final String? thumb;
  final String? smallS3;

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toMap() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}

class CoverPhotoUser {
  CoverPhotoUser({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  final String? id;
  final String? updatedAt;
  final String? username;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final UserLinks? links;
  final ProfileImage? profileImage;
  final String? instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;
  final bool? forHire;
  final PurpleSocial? social;

  factory CoverPhotoUser.fromMap(Map<String, dynamic> json) => CoverPhotoUser(
        id: json["id"],
        updatedAt: json["updated_at"],
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: json["links"] == null ? null : UserLinks.fromMap(json["links"]),
        profileImage: json["profile_image"] == null
            ? null
            : ProfileImage.fromMap(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: json["social"] == null
            ? null
            : PurpleSocial.fromMap(json["social"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "updated_at": updatedAt,
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toMap(),
        "profile_image": profileImage?.toMap(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toMap(),
      };
}

class UserLinks {
  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  final String? self;
  final String? html;
  final String? photos;
  final String? likes;
  final String? portfolio;
  final String? following;
  final String? followers;

  factory UserLinks.fromMap(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toMap() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  final String? small;
  final String? medium;
  final String? large;

  factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toMap() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class PurpleSocial {
  PurpleSocial({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  final String? instagramUsername;
  final String? portfolioUrl;
  final String? twitterUsername;
  final dynamic paypalEmail;

  factory PurpleSocial.fromMap(Map<String, dynamic> json) => PurpleSocial(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
      );

  Map<String, dynamic> toMap() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
      };
}

class ResultTopicSubmissions {
  ResultTopicSubmissions({
    this.foodDrink,
  });

  final FoodDrink? foodDrink;

  factory ResultTopicSubmissions.fromMap(Map<String, dynamic> json) =>
      ResultTopicSubmissions(
        foodDrink: json["food-drink"] == null
            ? null
            : FoodDrink.fromMap(json["food-drink"]),
      );

  Map<String, dynamic> toMap() => {
        "food-drink": foodDrink?.toMap(),
      };
}

class ResultUser {
  ResultUser({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  final String? id;
  final String? updatedAt;
  final String? username;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final UserLinks? links;
  final ProfileImage? profileImage;
  final String? instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;
  final bool? forHire;
  final FluffySocial? social;

  factory ResultUser.fromMap(Map<String, dynamic> json) => ResultUser(
        id: json["id"],
        updatedAt: json["updated_at"],
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: json["links"] == null ? null : UserLinks.fromMap(json["links"]),
        profileImage: json["profile_image"] == null
            ? null
            : ProfileImage.fromMap(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: json["social"] == null
            ? null
            : FluffySocial.fromMap(json["social"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "updated_at": updatedAt,
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toMap(),
        "profile_image": profileImage?.toMap(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toMap(),
      };
}

class FluffySocial {
  FluffySocial({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  final String? instagramUsername;
  final String? portfolioUrl;
  final String? twitterUsername;
  final dynamic paypalEmail;

  factory FluffySocial.fromMap(Map<String, dynamic> json) => FluffySocial(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
      );

  Map<String, dynamic> toMap() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
      };
}
