class ChatMessageEntity{
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity({required this.text, required this.createdAt, required this.id,required this.author, this.imageUrl});
  factory ChatMessageEntity.fromJson(Map<String, dynamic> json){
    return ChatMessageEntity(text: json['text'], imageUrl: json['image'], createdAt: json['createdAt'], id: json['id'], author: Author.fromJson(json['author']));
  }
}

class Author{
  String userName;
  Author({required this.userName});

  factory Author.fromJson(Map<String, dynamic> json){
    return Author(userName: json['username']);
  }
}