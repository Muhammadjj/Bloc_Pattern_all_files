import 'package:flutter/material.dart';

@immutable
abstract class InternetCubicStates{}


        // Todo: Different classes states because of block response create a states
        // Todo: and return ui or Uis update . 
class InterNetInitialStates  extends InternetCubicStates{}

class InterNetLostStates extends InternetCubicStates{}

class InterNetGainedStates  extends InterNetInitialStates{}

