class CoronaDetails {
  List<Main> main;
  CoronaDetails({this.main});
  CoronaDetails.fromJson(Map<String,dynamic> json){
    if(json['Main']!=null){
      main = List<Main>();
      json['Main'].forEach((i){
        main.add(Main.fromJson(i));
      });
    }
  }
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = Map<String,dynamic>();
    if(this.main != null)
      data['Main'] = this.main.map((i) => i.toJson()).toList();
    return data;
  }
}

class Main{
  String coronaCases;
  String coronaClose;
  String coronaCritical;
  String coronaCurrent;
  String coronaDeaths;
  String coronaDischarged;
  String coronaMild;
  String recovered;
  Main({
    this.coronaCases,
    this.coronaClose,
    this.coronaCritical,
    this.coronaCurrent,
    this.coronaDeaths,
    this.coronaDischarged,
    this.coronaMild,
    this.recovered
  });
  Main.fromJson(Map<String,dynamic> json) {
    coronaCases = json['CoronaCases'];
    coronaClose = json['CoronaClose'];
    coronaCritical = json['CoronaCritical'];
    coronaCurrent = json['CoronaCurrent'];
    coronaDeaths = json['CoronaDeaths'];
    coronaDischarged = json['CoronaDischarged'];
    coronaMild = json['CoronaMild'];
    recovered = json['Recoverd'];
  }
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['CoronaCases'] = this.coronaCases;
    data['CoronaClose'] = this.coronaClose;
    data['CoronaCritical'] = this.coronaCritical;
    data['CoronaCurrent'] = this.coronaCurrent;
    data['CoronaDeaths'] = this.coronaDeaths;
    data['CoronaDischarged'] = this.coronaDischarged;
    data['CoronaMild'] = this.coronaMild;
    data['Recoverd'] = this.recovered;
    return data;
  }
}