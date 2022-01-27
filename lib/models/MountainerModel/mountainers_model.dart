import 'blog_list.dart';

class MountainersModel {
  List<BlogList>? blogList;
  String? message;
  String? status;
  int? totalCount;

  MountainersModel({
    this.blogList,
    this.message,
    this.status,
    this.totalCount,
  });

  factory MountainersModel.fromJson(Map<String, dynamic> json) {
    return MountainersModel(
      blogList: (json['BlogList'] as List<dynamic>?)
          ?.map((e) => BlogList.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['Message'] as String?,
      status: json['Status'] as String?,
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'BlogList': blogList?.map((e) => e.toJson()).toList(),
        'Message': message,
        'Status': status,
        'TotalCount': totalCount,
      };


      MountainersModel.withError(String errorMessage) {
    message = errorMessage;
  }
}
