class TaskDto {
  int? id;
  int? iconChange;
  String? textTask;
  int? date;
  String? color;
  String? project;

  TaskDto(
      {this.id,
      this.iconChange,
      this.textTask,
      this.date,
      this.color,
      this.project});

  factory TaskDto.fromJson(Map<String, dynamic> json) {
    return TaskDto(
      id: json['id'],
      iconChange: json['iconChange'],
      textTask: json['textTask'],
      date: json['date'],
      color: json['color'],
      project: json['project'],
    );
  }

  Map<String, dynamic> toJson() => {
        'iconChange': iconChange,
        'textTask': textTask,
        'date': date,
        'color': color,
        'project': project,
      };
}
