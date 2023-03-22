class LoginModel {
  Record? record;
  String? status;
  String? msg;

  LoginModel({this.record, this.status, this.msg});

  LoginModel.fromJson(Map<String, dynamic> json) {
    record =
    json['record'] != null ? new Record.fromJson(json['record']) : null;
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.record != null) {
      data['record'] = this.record!.toJson();
    }
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class Record {
  String? id;
  String? name;
  String? email;
  String? password;
  String? deletedFlag;
  String? dated;
  String? roleId;
  String? updatedDate;
  String? userId;

  Record(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.deletedFlag,
        this.dated,
        this.roleId,
        this.updatedDate,
        this.userId});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    deletedFlag = json['deleted_flag'];
    dated = json['dated'];
    roleId = json['role_id'];
    updatedDate = json['updated_date'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['deleted_flag'] = this.deletedFlag;
    data['dated'] = this.dated;
    data['role_id'] = this.roleId;
    data['updated_date'] = this.updatedDate;
    data['user_id'] = this.userId;
    return data;
  }
}