enum TravelType{
  Domestic,
  International,
}

extension TarvelTypeExtension on TravelType{
  String get label{
    switch(this){
      case TravelType.Domestic:
        return "Domestic Travel";
      case TravelType.International:
        return "International Travel";
    }
  }
}