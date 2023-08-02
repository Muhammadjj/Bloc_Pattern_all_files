part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}



///*(InterNetInitialState) jo Events hm bhj raha ha any block check krta ha
///* aur processing krta ha as ka bd block stream ka zrya states ko bnta ha
///* ab hmy states sa hi pata lgy ga ka Hmra (NetWork) ON ha Ya OFF ha .
/// Todo: jo hm yaha use kr raha ha ya wohe (states) ha jo ka hmy block sa mila ga
class InterNetInitialState extends InternetState {}



///*(InterNetLostState) jo Events hm bhj raha ha any block check krta ha
///* aur processing krta ha as ka bd block stream ka zrya states ko bnta ha
///* ab hmy states sa hi pata lgy ga ka Hmra (NetWork) ON ha Ya OFF ha .
/// Todo: jo hm yaha use kr raha ha ya wohe (states) ha jo ka hmy block sa mila ga
class InterNetLostState extends InternetState {}



///*(InterNetGainedState) jo Events hm bhj raha ha any block check krta ha
///* aur processing krta ha as ka bd block stream ka zrya states ko bnta ha
///* ab hmy states sa hi pata lgy ga ka Hmra (NetWork) ON ha Ya OFF ha .
/// Todo: jo hm yaha use kr raha ha ya wohe (states) ha jo ka hmy block sa mila ga
class InterNetGainedState extends InternetState {}
