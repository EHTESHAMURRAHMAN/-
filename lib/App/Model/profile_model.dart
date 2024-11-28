class Profile {
  final int id;
  final String fname;
  final String phone;
  final String email;
  final String pass;
  final String dpImage;

  Profile({
    required this.id,
    required this.fname,
    required this.phone,
    required this.email,
    required this.pass,
    required this.dpImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['data']['id'],
      fname: json['data']['fname'],
      phone: json['data']['phone'],
      email: json['data']['email'],
      pass: json['data']['pass'],
      dpImage: json['data']['dpImage'],
    );
  }

  /// Method to convert a Profile object to JSON
  Map<String, dynamic> toJson() {
    return {
      'data': {
        'id': id,
        'fname': fname,
        'phone': phone,
        'email': email,
        'pass': pass,
        'dpImage': dpImage,
      }
    };
  }
}
