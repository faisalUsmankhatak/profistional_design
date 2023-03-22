class SupplierModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? createdBy;
  String? createdDate;
  String? deletedFlag;
  String? deletedBy;
  String? deletedDate;
  String? updatedBy;
  String? updatedDate;

  SupplierModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.createdBy,
        this.createdDate,
        this.deletedFlag,
        this.deletedBy,
        this.deletedDate,
        this.updatedBy,
        this.updatedDate});

  SupplierModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
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
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
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