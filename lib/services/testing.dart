class EmployModel {
  final String? name;
  final int? age;
  final String? email;
  final String? distination;

  EmployModel({this.name, this.age, this.email, this.distination});

  // from jeson

  factory EmployModel.fromJson(Map<String, dynamic> json) {
    return EmployModel(
        name: json["name"],
        age: json["age"],
        email: json["email"],
        distination: json["distination"]);
  }
}



















































// class UserModel {
//   final String? name;
//   final String? email;
//   final int? age;
//   UserModel({this.age, this.email, this.name});

//  factory UserModel.fromJson(Map<String,dynamic> json) {
  
//    UserModel (  name : json["name"],
//       email : json["email"],
//       age : json["age"],
//     );
//   }

//   Map<String,dynamic> toJson() => {
//     "name" : name ,
//     "email" : email,
//     "age" : age,
//   };
// }
