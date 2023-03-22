class ProjectModel {
  String? id;
  String? customerId;
  String? title;
  String? details;
  String? amount;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedFlag;
  String? deletedBy;
  String? deletedDate;
  String? status;
  String? projectType;
  String? customerName;
  String? customerEmail;
  String? paymentsReceived;
  String? expenses;

  ProjectModel(
      {this.id,
        this.customerId,
        this.title,
        this.details,
        this.amount,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate,
        this.deletedFlag,
        this.deletedBy,
        this.deletedDate,
        this.status,
        this.projectType,
        this.customerName,
        this.customerEmail,
        this.paymentsReceived,
        this.expenses});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    title = json['title'];
    details = json['details'];
    amount = json['amount'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    deletedFlag = json['deleted_flag'];
    deletedBy = json['deleted_by'];
    deletedDate = json['deleted_date'];
    status = json['status'];
    projectType = json['project_type'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    paymentsReceived = json['payments_received'];
    expenses = json['expenses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['title'] = this.title;
    data['details'] = this.details;
    data['amount'] = this.amount;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['updated_by'] = this.updatedBy;
    data['updated_date'] = this.updatedDate;
    data['deleted_flag'] = this.deletedFlag;
    data['deleted_by'] = this.deletedBy;
    data['deleted_date'] = this.deletedDate;
    data['status'] = this.status;
    data['project_type'] = this.projectType;
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['payments_received'] = this.paymentsReceived;
    data['expenses'] = this.expenses;
    return data;
  }
}
class ProjectModel {
  String? id;
  String? customerId;
  String? title;
  String? details;
  String? amount;
  String? createdBy;
  String? createdDate;
  Null? updatedBy;
  Null? updatedDate;
  String? deletedFlag;
  Null? deletedBy;
  Null? deletedDate;
  String? status;
  String? projectType;
  String? customerName;
  String? customerEmail;
  String? paymentsReceived;
  String? expenses;

  ProjectModel(
      {this.id,
        this.customerId,
        this.title,
        this.details,
        this.amount,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate,
        this.deletedFlag,
        this.deletedBy,
        this.deletedDate,
        this.status,
        this.projectType,
        this.customerName,
        this.customerEmail,
        this.paymentsReceived,
        this.expenses});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    title = json['title'];
    details = json['details'];
    amount = json['amount'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    deletedFlag = json['deleted_flag'];
    deletedBy = json['deleted_by'];
    deletedDate = json['deleted_date'];
    status = json['status'];
    projectType = json['project_type'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    paymentsReceived = json['payments_received'];
    expenses = json['expenses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['title'] = this.title;
    data['details'] = this.details;
    data['amount'] = this.amount;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['updated_by'] = this.updatedBy;
    data['updated_date'] = this.updatedDate;
    data['deleted_flag'] = this.deletedFlag;
    data['deleted_by'] = this.deletedBy;
    data['deleted_date'] = this.deletedDate;
    data['status'] = this.status;
    data['project_type'] = this.projectType;
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['payments_received'] = this.paymentsReceived;
    data['expenses'] = this.expenses;
    return data;
  }
}

