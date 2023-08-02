part of 'internet_bloc.dart';



        ///* Events mean ka jo hmra button press pa ya internet ka(Off ya On)hona 
        ///* pr ak specific time ka andr create hota ha aur mostly (Events) hmre
        ///* Uis generate krte ha aur ya Events hmra block ka ps jata ha jo ka an 
        ///* Events pr Processing kr ka (stream) ka zrya (states) ko create krta ha 
        ///* an states ko pr hmra StreamBuilder automatically Ui pr text ya koi aur 
        ///* ko update krta rhta ha 

@immutable
abstract class InternetEvent {}

///* (InterNetLoserEvent) ya class hm ny as laya use ki q ka hm ny network ka (off)
///* pr check krna ha ka Hmra Event (InterNetLoserEvent) block ma ja kr kya stream
///* ya state ma Do,nt Network hi show krta ha ya kuch aur error dyta ha .
///Todo: mtlb InterNet off ha ya ON ha
class InterNetLoseEvent extends InternetEvent {}

///* (InterNetGainedEvent) ya class hm ny as laya use ki q ka hm ny network ka (ON)
///* pr check krna ha ka Hmra Event (InterNetGainedEvent) block ma ja kr kya stream
///* ya state ma Network avaliable hi show krta ha ya kuch aur error dyta ha .
/// Todo: mtlb InterNet off ha ya ON ha
class InterNetGainedEvent extends InternetEvent {}
