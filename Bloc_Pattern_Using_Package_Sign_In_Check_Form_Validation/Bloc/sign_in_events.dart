//  ** Add this Events (Bloc)
abstract class SignInEvents {}

///* (SignInTextChangeEvents) as class ma hm ny email aur password as laya laya
///* q ka phle bt hm (SignIn) ka page bna raha ha js ma hmy Email aur Password ki
///* textField chaye hote ha ab hm Events ma jo bhi data bhja da wohe data return
///* (states) ki sorat ma maly ga ab hm na email aur password ko events ka zrya
///* bhjna ha ka jo bhi text as ma view ho ga ays pr hm (Validation) lga skty ha
///* aur events ko apny bloc ma bhj skty ha js pr hmy different (states) mil skte ha
///* aur an states ko hm apne mrzi sa design kr ka (UIs) pr show krwa skty ha
class SignInTextChangeEvents extends SignInEvents {
  String? emailValue;
  String? passwordValue;
  SignInTextChangeEvents({this.emailValue, this.passwordValue});
}

///* (SignInSubmittedButtonEvent) as class ma hm ny ak button bnya js ka
///* click pr events generates ho ga aur an events ma hm ny email aur password
///* ko check krwana ha ka agr button ka click pr email aur password ka events
///* Invalid hota ha to hm ny as ka click pr kn sa process krwana ha.
class SignInSubmittedButtonEvent extends SignInEvents {
  String? email;
  String? password;
  SignInSubmittedButtonEvent({this.email, this.password});
}
