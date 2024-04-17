class Notes{
  int? id;
  final String title;
  final String des;
  Notes({required this.title,required this.des,this.id});
  static Notes fromMap(Map<String, Object?> map){
    final id=map['id'] as int;
    final title=map['title'] as String;
    final des=map['description'] as String;
    return Notes(id:id, title:title, des: des);
  }
}