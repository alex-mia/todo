
class ProjectDto {
  int? id;
  String? text;
  String? color;
  String? icon;
  int? counter;

  ProjectDto({this.id, this.text, this.color, this.icon, this.counter});
  factory ProjectDto.fromJson(Map<String, dynamic> json){
    return ProjectDto(
      id: json['id'],
      text: json['text'],
      color: json['color'],
        icon: json['icon'],
      counter: json['counter'],
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'color': color,
    'icon': icon,
    'counter': counter,
  };
}