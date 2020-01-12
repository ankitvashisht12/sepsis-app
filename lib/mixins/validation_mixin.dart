class ValidationMixin{
  String emailValidationMixin(String value){
              if(!value.contains('@gmail.com'))
                return "Invalid Email address !";
              return null;
            }
  String passwordValidationMixin(String value){
            if(value.length < 8)
              return 'Password must be atleast 8 characters';
            return null;
          }
}