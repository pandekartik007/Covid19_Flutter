import 'dart:convert';
import '../utils/colors.dart';
import 'screensize.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/world.dart';
import 'country_detail.dart';

class WorldList extends StatefulWidget {
  @override
  _WorldListState createState() => _WorldListState();
}

class _WorldListState extends State<WorldList> {
  TextEditingController textEditingController = TextEditingController();
  List<Corona> test, sample, _dat1;
  int index;
  var jsondata;
  Details d, temp, a;
  String s = "https://api-corona.herokuapp.com/";
  Future<void> getData() async {
    final response = await http.get(s);
    jsondata = json.decode(response.body);
    d = Details.fromJson(jsondata);
    test = d.corona;
    setState(() {
      sample = test;
      _dat1 = sample;
    });
    for(int i=0;i<_dat1.length;i++){
      if(_dat1[i].country.toLowerCase() == 'india'){
        index=i;
        break;
      }
    }
    print(_dat1[index].country);
    print(_dat1[index].totalCases);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  clearTextInput() {
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text('Cases Around the world')),
        backgroundColor: Colors.black26,
        elevation: 3,
      ),
      //backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
      //backgroundColor:Color(0xFFFF3B4254),
      backgroundColor: Bgcolor,
      body: d == null
          ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(Fgcolor),
        ),
      )
          : RefreshIndicator(
        onRefresh: getData,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: screenAwareSize(40, context),
              decoration: BoxDecoration(
                  color: Colors.white,//Color(0xFF262626),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: TextField(
                controller: textEditingController,
                style: new TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search For Any Country',
                  hintStyle:
                  TextStyle(color: Colors.grey, fontSize: 14.0),
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(icon: Icon(Icons.close), onPressed: () {
                    clearTextInput();
                    setState(() {
                      _dat1 = sample.where((r) => (r.country.toLowerCase().contains(textEditingController.text.trim().toLowerCase()))).toList();
                    });
                  })
                ),
                onChanged: (text) {
                  setState(() {
                    _dat1 = sample.where((r) => (r.country.toLowerCase().contains(text.trim().toLowerCase()))).toList();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: _dat1.map((pointer) =>
                    Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    padding: EdgeInsets.only(left: 7),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Coronad(
                                  corona: pointer,
                                )));
                      },
                      child: Card(
                        color: Bgcolor,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/abc.png"),
                          ),
                          title: Text(
                            pointer.country,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          subtitle: Text(
                            "Total Cases : " +
                                pointer.totalCases.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            iconSize: 31,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Coronad(
                                            corona: pointer,
                                          )));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
