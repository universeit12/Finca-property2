class ProfileModel {
  int? id;
  String? phone;
  String? email;
  String? fullName;
  bool? isCustomer;
  bool? isSeller;
  bool? isStaff;
  bool? isSuperuser;
  String? image;
  String? dateOfBirthday;
  String? monthlyIncome;
  String? permanentAddress;
  String? presentAddress;
  int? user;

  ProfileModel(
      {this.id,
        this.phone,
        this.email,
        this.fullName,
        this.isCustomer,
        this.isSeller,
        this.isStaff,
        this.isSuperuser,
        this.image,
        this.dateOfBirthday,
        this.monthlyIncome,
        this.permanentAddress,
        this.presentAddress,
        this.user});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    email = json['email'];
    fullName = json['full_name'];
    isCustomer = json['is_customer'];
    isSeller = json['is_seller'];
    isStaff = json['is_staff'];
    isSuperuser = json['is_superuser'];
    image = json['image'];
    dateOfBirthday = json['date_of_birthday'];
    monthlyIncome = json['monthly_income'];
    permanentAddress = json['permanent_address'];
    presentAddress = json['present_address'];
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
    data['date_of_birthday'] = this.dateOfBirthday;
    data['monthly_income'] = this.monthlyIncome;
    data['permanent_address'] = this.permanentAddress;
    data['present_address'] = this.presentAddress;
    data['user'] = this.user;
    return data;
  }
}