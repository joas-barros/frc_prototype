class ProfileModel {
  final String email;
  final String password;
  final String name;
  final String lastName;
  final String phoneNumber;


  ProfileModel({
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
    required this.phoneNumber,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'last_name': lastName,
      'phone_number': phoneNumber,
    };
  }
  
  @override
  String toString() {
    return 'ProfileModel{email: $email, password: $password, name: $name, lastName: $lastName, phoneNumber: $phoneNumber}';
  }
}
