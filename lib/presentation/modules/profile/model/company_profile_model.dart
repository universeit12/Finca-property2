class CompanyProfileModel {
  int? id;
  String? phone;
  String? email;
  String? fullName;
  bool? isCustomer;
  bool? isSeller;
  bool? isStaff;
  bool? isSuperuser;
  String? image;
  String? companyName;
  String? designation;
  String? phone2;
  String? officeAddress;
  int? user;

  CompanyProfileModel(
      {this.id,
        this.phone,
        this.email,
        this.fullName,
        this.isCustomer,
        this.isSeller,
        this.isStaff,
        this.isSuperuser,
        this.image,
        this.companyName,
        this.designation,
        this.phone2,
        this.officeAddress,
        this.user});

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    email = json['email'];
    fullName = json['full_name'];
    isCustomer = json['is_customer'];
    isSeller = json['is_seller'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    image = json['image'];
    companyName = json['company_name'];
    designation = json['designation'];
    phone2 = json['phone2'];
    officeAddress = json['office_address'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['full_name'] = this.fullName;
    data['is_customer'] = this.isCustomer;
    data['is_seller'] = this.isSeller;
    data['is_staff'] = this.isStaff;
    data['is_superuser'] = this.isSuperuser;
    data['image'] = this.image;
    data['company_name'] = this.companyName;
    data['designation'] = this.designation;
    data['phone2'] = this.phone2;
    data['office_address'] = this.officeAddress;
    data['user'] = this.user;
    return data;
  }
}