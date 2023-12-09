class CategoryTime {
  CategoryTime({this.name, required this.focusTime, required this.breakTime});

  final String? name;
  final String focusTime;
  final String breakTime;

  getCategoryName() {
    return name;
  }

  toJson() {
    return {'name': name, 'focusTime': focusTime, 'breakTime': breakTime};
  }

  static CategoryTime fromJson(Map<String, dynamic> json) {
    return CategoryTime(
      name: json['name'],
      focusTime: json['focusTime'],
      breakTime: json['breakTime'],
    );
  }
}
