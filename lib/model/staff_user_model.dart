class StaffUserModel {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? accountNo;
  String? createdBy;
  String? createdDate;
  String? deletedFlag;
  String? deletedBy;
  String? deletedDate;
  String? updatedBy;
  String? updatedDate;

  StaffUserModel(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.accountNo,
        this.createdBy,
        this.createdDate,
        this.deletedFlag,
        this.deletedBy,
        this.deletedDate,
        this.updatedBy,
        this.updatedDate});

  StaffUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    accountNo = json['account_no'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    deletedFlag = json['deleted_flag'];
    deletedBy = json['deleted_by'];
    deletedDate = json['deleted_date'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['account_no'] = this.accountNo;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['deleted_flag'] = this.deletedFlag;
    data['deleted_by'] = this.deletedBy;
    data['deleted_date'] = this.deletedDate;
    data['updated_by'] = this.updatedBy;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}