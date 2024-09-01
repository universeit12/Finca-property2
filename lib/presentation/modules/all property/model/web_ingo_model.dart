class WebIngoModel {
  int? id;
  String? logo;
  String? facebookSocialLink;
  String? twitterSocialLink;
  String? linkedinSocialLink;
  String? instagramSocialLink;
  String? youtubeSocialLink;
  String? address;
  List<Phones>? phones;

  WebIngoModel(
      {this.id,
        this.logo,
        this.facebookSocialLink,
        this.twitterSocialLink,
        this.linkedinSocialLink,
        this.instagramSocialLink,
        this.youtubeSocialLink,
        this.address,
        this.phones});

  WebIngoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    facebookSocialLink = json['facebook_social_link'];
    twitterSocialLink = json['twitter_social_link'];
    linkedinSocialLink = json['linkedin_social_link'];
    instagramSocialLink = json['instagram_social_link'];
    youtubeSocialLink = json['youtube_social_link'];
    address = json['address'];
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(new Phones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['facebook_social_link'] = this.facebookSocialLink;
    data['twitter_social_link'] = this.twitterSocialLink;
    data['linkedin_social_link'] = this.linkedinSocialLink;
    data['instagram_social_link'] = this.instagramSocialLink;
    data['youtube_social_link'] = this.youtubeSocialLink;
    data['address'] = this.address;
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phones {
  String? name;

  Phones({this.name});

  Phones.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}