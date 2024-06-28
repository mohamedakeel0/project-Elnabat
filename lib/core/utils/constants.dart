

class AppConstance{
  static const String baseUrl = "https://ee1d-156-207-11-125.ngrok-free.app/api/"
     ;

  static const int connectTimeoutDuration = 60*1000;
  static const int receiveTimeoutDuration = 60*1000;
  static const int zero = 0;
  static const double zeroD = 0.0;
  static const int minMaxLine = 3;
  static const int maxLine = 5;
  static const double eight = 8;
  static const double f0_5 =  0.5;
  static const double f15 =  15;
  static const double f8 =  8;
  static const int two = 2;
  static const int one = 1;
  static const int three = 3;
  static const int verificationCodeLength = 4;
}





class ProcessImage {
  final String title;
  final String path;
  final String date ;

  ProcessImage({
    required this.title,
    required this.path,
    required this.date,
  });

  factory ProcessImage.fromJson(Map<String, dynamic> json) {
    return ProcessImage(
      title: json['title'] ,
      path: json['path'] ,
      date: json['date'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'path': path,
    };
  }
}
class PostCommit {
  late  String title;
  late  int id;
  late  bool isLike;
 late  String time ;
 late  String comment ;

  PostCommit({
    required this.title,
    required this.id,
    required this.isLike,
    required this.time,
    required this.comment,
  });

  factory PostCommit.fromJson(Map<String, dynamic> json) {
    return PostCommit(
      title: json['title'] ,
      id: json['id'] ,
      isLike: json['isLike'] ,
      time: json['time'] ,
      comment: json['comment'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'isLike': isLike,
      'time': time,
      'comment': comment,
    };
  }
}
enum RequestState {
  loading,
  loaded,
  error,
}