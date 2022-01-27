class BlogList {
  String? blogId;
  String? bloggerId;
  String? bloggerName;
  String? latitude;
  String? liked;
  String? likes;
  String? longitude;
  String? mountain;
  String? postTime;
  String? shortDescription;
  String? wordsByBlogger;
  String? image;

  BlogList({
    this.blogId,
    this.bloggerId,
    this.bloggerName,
    this.latitude,
    this.liked,
    this.likes,
    this.longitude,
    this.mountain,
    this.postTime,
    this.shortDescription,
    this.wordsByBlogger,
    this.image,
  });

  factory BlogList.fromJson(Map<String, dynamic> json) => BlogList(
        blogId: json['BlogID'] as String?,
        bloggerId: json['BloggerID'] as String?,
        bloggerName: json['BloggerName'] as String?,
        latitude: json['Latitude'] as String?,
        liked: json['Liked'] as String?,
        likes: json['Likes'] as String?,
        longitude: json['Longitude'] as String?,
        mountain: json['Mountain'] as String?,
        postTime: json['PostTime'] as String?,
        shortDescription: json['ShortDescription'] as String?,
        wordsByBlogger: json['WordsByBlogger'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'BlogID': blogId,
        'BloggerID': bloggerId,
        'BloggerName': bloggerName,
        'Latitude': latitude,
        'Liked': liked,
        'Likes': likes,
        'Longitude': longitude,
        'Mountain': mountain,
        'PostTime': postTime,
        'ShortDescription': shortDescription,
        'WordsByBlogger': wordsByBlogger,
        'image': image,
      };
}
