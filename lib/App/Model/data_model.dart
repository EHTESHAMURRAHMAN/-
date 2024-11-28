class AccountRequest {
  final int id;
  final String fname;
  final String phone;
  final String email;
  final String pass;
  final String dpImage;

  AccountRequest({
    required this.id,
    required this.fname,
    required this.phone,
    required this.email,
    required this.pass,
    required this.dpImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fname': fname,
      'phone': phone,
      'email': email,
      'pass': pass,
      'dpImage': dpImage,
    };
  }
}

class AccountResponse {
  final int id;
  final String status;
  final String message;

  AccountResponse(
      {required this.id, required this.status, required this.message});

  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return AccountResponse(
      id: json['account']['id'],
      status: json['status'],
      message: json['message'],
    );
  }
}
