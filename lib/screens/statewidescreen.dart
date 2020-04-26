import 'package:covid/screens/screensize.dart';
import 'package:covid/screens/state_detail.dart';
import 'package:covid/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StateScreen extends StatefulWidget {
  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  String s = "https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise";
  var jsonData;
  bool check=false;
  List<dynamic> data,sample;
  List<String> stateNames= List<String>();
  Future<void> getData() async{
    final response = await http.get(s);
    jsonData = json.decode(response.body);
    data = jsonData['data']['statewise'];
    for(var i=0;i<data.length;i++){
      stateNames.add(data[i]['state']);
    }
    print(data[0]['confirmed']);
    setState(() {
      sample=stateNames;
      check =true;
    });
  }
  TextEditingController textEditingController = TextEditingController();
  clearTextInput() {
    textEditingController.clear();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text('Cases Around States')),
        backgroundColor: Colors.black26,
        elevation: 3,
      ),
      backgroundColor: Bgcolor,
      body: check == false
          ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ) :
      RefreshIndicator(
        onRefresh: getData,
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: ListView.builder(
                      itemCount: stateNames.length,
                      itemBuilder: (BuildContext context,int index){
                        return Container(
                          padding: EdgeInsets.all(7.0),
                          child: InkWell(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) => CoronaState(
                                        name: data[index]['state'],
                                        confirmed: data[index]['confirmed'],
                                        deaths: data[index]['deaths'],
                                        recovered: data[index]['recovered'],
                                        active: data[index]['active']
                                      )
                                    ));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 5
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                                color: Bgcolor,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/abc.png"),
                                  ),
                                  title: Text(stateNames[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  subtitle: Text('Confirmed Cases: ${data[index]['confirmed']}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
