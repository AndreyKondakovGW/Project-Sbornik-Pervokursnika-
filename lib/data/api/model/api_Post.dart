class ApiPost {
  final String title;
  final String text;
  final String image;
  final String id;
  final List<String> tegs;

  ///метод который обрабатывет пришедьшие с бэкэнда данные
  ///(НУЖНО ПЕРЕПИСАТЬ в виде ApiPost.fromApi(JASON))  
  ApiPost.fromApi({this.id,this.title,this.text,this.image,this.tegs});
}

class ApiPostList {
  final List<ApiPost> posts;
  ///метод который обрабатывет пришедьшие с бэкэнда данные
  ///(НУЖНО ПЕРЕПИСАТЬ в виде ApiPostList.fromApi(JASON)) 
  ApiPostList.fromApi({this.posts});
}