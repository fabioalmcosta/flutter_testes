import 'package:flutter/material.dart';
import 'package:meu_primeiro_app/repository/countrys/CountryRepository.dart';
import 'package:meu_primeiro_app/support/conection/api.dart';
import 'package:meu_primeiro_app/repository/countrys/model/CountryCategory.dart';
import 'package:meu_primeiro_app/repository/countrys/model/Category.dart';

class Country extends StatefulWidget {
  final state = new _NoticeListPageState();

  static const routeName = '/extractArguments';


  @override
  _NoticeListPageState createState() => state;
}

class _NoticeListPageState extends State<Country> {
  var repository = new NoticeRepositoryImpl();

  List<Category> categories = new List();

  Future<CountryCategory> countryCategory;

  ScreenArguments args;

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments;

    loadCategory();

    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      title: FutureBuilder<CountryCategory>(
                          future: countryCategory,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                          }),
                      background: Image.network(
                        "https://www.imoveisnoexterior.com.br/wp-content/uploads/2018/09/Untitled-1.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
              ];
            },
            body: new Container(
                margin:
                    new EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 5),
                child: new ListView(children: <Widget>[
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                            child: new Text(
                              "Conheça o destino",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            margin: EdgeInsets.only(bottom: 10)),
                        FutureBuilder<CountryCategory>(
                            future: countryCategory,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.description1,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                            }),
                        new Container(
                          child: new Text(
                            "Atrações turísticas",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                        ),
                        FutureBuilder<CountryCategory>(
                            future: countryCategory,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.description2,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                            }),
                        FutureBuilder<CountryCategory>(
                            future: countryCategory,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.description2,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                            }),
                        FutureBuilder<CountryCategory>(
                            future: countryCategory,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.description2,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                            }),
                        FutureBuilder<CountryCategory>(
                            future: countryCategory,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.description2,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                            }),
                        FutureBuilder<CountryCategory>(
                            future: countryCategory,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.description2,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                            }),
                        FutureBuilder<CountryCategory>(
                            future: countryCategory,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.description2,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 15),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                            }),
                        new Container(
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            child: new ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: new Card(
                                        elevation: 7,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: new Container(
                                          height: 100,
                                          decoration: new BoxDecoration(
                                              image: new DecorationImage(
                                                  image: new NetworkImage(
                                                      categories[index]
                                                          .backgroundImage),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7))),
                                          child: Center(
                                              child: Text(
                                            categories[index].name,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                        )),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Country())),
                                  );
                                })),
                      ])
                ]))));
  }

  @override
  void initState() {

  }

  Widget setCategoryText(CountryCategory countryCategory) {}

  Widget _getTextCountry() {
    return new Container(
        child: new Text(
            "Aos poucos, a Irlanda vem ganhando o gosto dos brasileiros e se tornando um dos destinos preferidos. O principal motivo? Um povo simpático e festeiro em um país que sabe acolher muito bem quem vem de fora. Além disso, preços mais acessíveis e toda a Europa a seu dispor! Apresentamos, com muito prazer, tudo sobre a Irlanda!",
            style: TextStyle(color: Colors.black38, fontSize: 16)));
  }

  void setListCategories(CountryCategory countryCategories) {
    setState(() {
      countryCategories.category.forEach((item) {
        categories.add(item);
      });
    });
  }

  void loadCategory() {
    countryCategory = repository.loadCategory(args.idCountry);
    countryCategory
        .then((countryCategory) => setListCategories(countryCategory));
  }
}

class ScreenArguments {
  final String idCountry;

  ScreenArguments(this.idCountry);
}
