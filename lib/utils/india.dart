/*class India {
  List<data> stats;
  India({this.stats});
  String i = 'summary';

  India.fromJson(Map<String,dynamic> json){
    if(json['data']['summary']!= null){
      stats = List<data>();
      stats.add(json['data']['summary'].fromJson());
    }
  }
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = Map<String,dynamic>();
    if(this.stats !=null)
      data['data'] = this.stats.map((i) => i.toJson()).toList();
    return data;
  }
}

class data{
  String total;
  String confirmedCasesIndian;
  String confirmedCasesForeign;
  String discharged;
  String deaths;

  data({
    this.total,
    this.confirmedCasesIndian,
    this.confirmedCasesForeign,
    this.discharged,
    this.deaths
  });
  data.fromJson(Map<String,dynamic> json) {
    total = json['total'];
    confirmedCasesIndian = json['confirmedCasesIndian'];
    confirmedCasesForeign = json['confirmedCasesForeign'];
    discharged = json['discharged'];
    deaths = json['deaths'];
  }
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['total'] = this.total;
    data['confirmedCasesIndian'] = this.confirmedCasesIndian;
    data['confirmedCasesForeign'] = this.confirmedCasesForeign;
    data['discharged'] = this.discharged;
    data['deaths'] = this.deaths;
    return data;
  }
}*/
/*class India{
  List<Data> stats;
  India({this.stats});
  India.fromJson(Map<String,dynamic> json){
    if(json['data']!=null){
      stats= List<Data>();
      stats.add(Data.fromJson(json['data']['summary']));
    }
  }
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = Map<String,dynamic>();
    if(this.stats != null)
      data['data'] = this.stats.map((v) => v.toJson()).toList();
  }
}*/
/*class Data{
  Summary summary;
  Data({
    this.summary,
  });
  factory Data.fromJson(Map<String,dynamic> json) {
      return Data(summary : Summary.fromJson(json['summary']));
  }
  Map<String,dynamic> toJson() {
    final Map<String, dynamic> data =Map<String, dynamic>();
    data['summary'] = this.summary;
    return data;
  }
}
class Summary{
  String total;
  String confirmedCasesIndian;
  String confirmedCasesForeign;
  String discharged;
  String deaths;
  Summary({
    this.total,
    this.confirmedCasesIndian,
    this.confirmedCasesForeign,
    this.discharged,
    this.deaths
  });
  factory Summary.fromJson(Map<String,dynamic> json) {
    return Summary(total : json['total'],
      confirmedCasesIndian : json['confirmedCasesIndian'],
      confirmedCasesForeign : json['confirmedCasesForeign'],
      discharged : json['discharged'],
      deaths : json['deaths']);
  }
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['total:'] = this.total;
    data['confirmedCasesIndian'] = this.confirmedCasesIndian;
    data['confirmedCasesForeign'] = this.confirmedCasesForeign;
    data['discharged'] = this.discharged;
    data['deaths'] = this.deaths;
    return data;
  }
}*/
