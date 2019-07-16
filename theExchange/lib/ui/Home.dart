import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/repository/countrys/CountryRepository.dart';
import 'package:meu_primeiro_app/support/conection/api.dart';
import 'package:meu_primeiro_app/ui/Country.dart';
import 'package:meu_primeiro_app/repository/countrys/model/CountryDTO.dart';

class Home extends StatefulWidget {
  final state = new _NoticeListPageState();

  @override
  _NoticeListPageState createState() => state;
}

class _NoticeListPageState extends State<Home> {
  List _news = new List();
  var repository = new NoticeRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Países"),
      ),
      body: new Container(
        child: _getListViewWidget(),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    loadNotices();
  }

  Widget _getListViewWidget() {
    return new Container(
        margin: new EdgeInsets.only(top: 10, left: 15, right: 15),
        child: new ListView(children: <Widget>[
          new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Escolha seu destino",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 18),
                ),
                new Container(
                  margin: new EdgeInsets.only(top: 10),
                  child: new ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: _news.length,
                      padding: new EdgeInsets.only(top: 5.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: new Container(
                            margin:
                            const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0, top: 15.0),
                            child: new Material(
                                child: new Container(
                                  height: 95.0,
                                  child: new Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill, image: new NetworkImage(_news[index].img)))),
                                      new Expanded(
                                          child: new Container(
                                            decoration: new BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(width: .5, color: Colors.black26),
                                                )),
                                            margin: new EdgeInsets.only(left: 15),
                                            child: new Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                new Text(
                                                  _news[index].name,
                                                  maxLines: 1,
                                                  style: new TextStyle(
                                                      fontSize: 18, fontWeight: FontWeight.bold),
                                                ),
                                                new Container(
                                                  margin: new EdgeInsets.only(top: 5.0),
                                                  child: new Text(
                                                    _news[index].description,
                                                    maxLines: 2,
                                                    style: new TextStyle(fontSize: 15, color: Colors.black38),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                )),
                          ),
                          onTap: () => Navigator.pushNamed(
                              context,
                            Country.routeName,
                            arguments: ScreenArguments(
                              _news[index].idCountry
                            ),),
                        );
                      }),
                )
              ])
        ]));
  }

  _showImplError(onError) {
    print(onError);
    if (onError is FetchDataException) {
      print("codigo: ${onError.code()}");
    }
  }

  setNotices(List result) {
    setState(() {
      result.forEach((item) {
        _news.add(item);
      });
    });
  }

  loadNotices() async {
    await repository
        .loadCountrys()
        .then((country) => setNotices(country))
        .catchError(_showImplError);
  }
}
