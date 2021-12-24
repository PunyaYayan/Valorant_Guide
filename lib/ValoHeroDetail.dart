import 'package:flutter/material.dart';

import 'ValoHeroModel.dart';

class ValoHeroDetail extends StatefulWidget {
  final ValoHeroModel valoHeroModel;
  final int index;

  const ValoHeroDetail(
      {Key key, @required this.valoHeroModel, @required this.index})
      : super(key: key);

  @override
  _ValoHeroDetailState createState() => _ValoHeroDetailState();
}

class _ValoHeroDetailState extends State<ValoHeroDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff152238),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        child: Image.network(widget.valoHeroModel
                            .data[widget.index].bustPortrait ==
                            null
                            ? 'https://png.pngtree.com/png-clipart/20190920/original/pngtree-easter-egg-png-free-png-image_4669160.jpg'
                            : widget
                            .valoHeroModel.data[widget.index].bustPortrait),
                      ),
                      Center(
                          child: Text(
                            widget.valoHeroModel.data[widget.index].role == null
                                ? '-'
                                : widget.valoHeroModel.data[widget.index].role
                                .displayName
                                .toUpperCase(),
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.valoHeroModel.data[widget.index].displayName,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ))
                    ],
                  )),
              Container(
                color: Color(0xff152238),
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '// Biography',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      widget.valoHeroModel.data[widget.index].description,
                      style: TextStyle(color: Colors.white),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount:4 ,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Image.network(
                                  widget.valoHeroModel.data[widget.index]
                                      .abilities[index].displayIcon ==
                                      null
                                      ? 'https://cdn.discordapp.com/attachments/741912290709864549/888263147201392640/Screenshot_489.png'
                                      : widget.valoHeroModel.data[widget.index]
                                      .abilities[index].displayIcon,
                                  width: 50,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width:
                                  MediaQuery.of(context).size.width - 100,
                                  child: Text(
                                    widget.valoHeroModel.data[widget.index]
                                        .abilities[index].description,
                                    softWrap: true,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
