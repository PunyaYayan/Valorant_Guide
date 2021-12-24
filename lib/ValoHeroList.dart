import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ValoHeroDetail.dart';
import 'ValoHeroModel.dart';

class ValoHeroList extends StatefulWidget {
  const ValoHeroList({Key key}) : super(key: key);

  @override
  _ValoHeroListState createState() => _ValoHeroListState();
}

class _ValoHeroListState extends State<ValoHeroList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFromJson();
  }

  bool isloading = true;
  ValoHeroModel valoHeroModel;

  void loadFromJson() async {
    final res = await http.get(Uri.parse("https://valorant-api.com/v1/agents"));
    if (res.statusCode == 200) {
      isloading = false;
      valoHeroModel = ValoHeroModel.fromJson(json.decode(res.body.toString()));
      setState(() {
        isloading = false;
      });
    } else {
      print("Error Load Json");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff152238),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/valo_icon.png",
                      height: 85,
                      width: 85,
                    ),
                    Container(
                      width: 285,
                      child: Text(
                        "Choose Your Awesome Agents",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: valoHeroModel.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ValoHeroDetail(
                                            valoHeroModel: valoHeroModel,
                                            index: index,
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          valoHeroModel.data[index].displayIcon,
                                          height: 150,
                                          width: 150,
                                        ),
                                      ),
                                    ),
                                    //Stroke Text
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(10, 0, 0, 25),
                                      child: Stack(
                                        children: <Widget>[
                                          //outline
                                          Text(
                                            valoHeroModel.data[index].displayName,
                                            style: TextStyle(
                                                fontSize: 20,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 3),
                                          ),
                                          //Warna dasar
                                          Text(
                                            valoHeroModel.data[index].displayName,
                                            style: TextStyle(
                                                fontSize: 20, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                      child: Stack(
                                        children: <Widget>[
                                          //outline
                                          Text(
                                            valoHeroModel.data[index].role == null
                                                ? '-'
                                                : valoHeroModel
                                                    .data[index].role.displayName,
                                            style: TextStyle(
                                                fontSize: 15,
                                                letterSpacing: 0.5,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 3),
                                          ),
                                          //Warna dasar
                                          Text(
                                            valoHeroModel.data[index].role == null
                                                ? '-'
                                                : valoHeroModel
                                                    .data[index].role.displayName,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                letterSpacing: 0.5),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
                ),
            ),
          );
  }
}
