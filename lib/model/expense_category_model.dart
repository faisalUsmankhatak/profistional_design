class ExpenseCategoryModel {
  String? id;
  String? title;

  ExpenseCategoryModel({this.id, this.title});

  ExpenseCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}