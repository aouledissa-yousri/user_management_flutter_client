class User {

  String username = "";
  String email = "";
  String password = "";

  User(String username, String email, String password){
    this.username = username;
    this.email = email;
    this.password = password;
  }
  
  User.empty(){}

  Map<String, dynamic> getData(){
    return {
      "username": this.username,
      "password": this.password,
      "email": this.email,
    };
  }



}