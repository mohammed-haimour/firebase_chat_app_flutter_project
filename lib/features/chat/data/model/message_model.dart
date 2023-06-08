class MessageModel{
  final String message ;
  final String date ;
  final String email ;

  MessageModel({required this.message, required this.date, required this.email});

  factory MessageModel.fromJson(dynamic jsonData){
    return MessageModel(message: jsonData['message'], date: jsonData['createdAt'] , email: jsonData['email']);
  }
}