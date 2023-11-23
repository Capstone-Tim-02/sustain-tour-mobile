class SearchHistoryModel {
  final int id;
  final int userId;
  final String query;

  SearchHistoryModel({
    required this.id,
    required this.userId,
    required this.query
  });

    Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'userID' : userId,
      'query' : query,
    };
  }

  factory SearchHistoryModel.fromMap(Map<String,dynamic> map){
    return SearchHistoryModel(
      id : map['id'],
      userId : map['userId'],
      query : map['query'],
    );
  }
}