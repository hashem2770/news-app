import 'package:flutter/material.dart';
import 'package:hands_on/Second_Screen.dart';
import 'package:hands_on/model_types.dart';
import 'package:hands_on/networking/AuthorApi.dart';
import 'package:hands_on/networking/Author_Model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthorApi authorApi = AuthorApi();
  Future<Authors> businessData;
  Future<Authors> entertainmentData;
  Future<Authors> healthData;
  Future<Authors> scienceData;
  Future<Authors> techData;
  Future<Authors> sportData;
  var send;
  int selectedIndex = 0;

  deciderData() {
    switch (selectedIndex) {
      case 0:
        return businessData;
        break;
      case 1:
        return entertainmentData;
        break;
      case 2:
        return healthData;
        break;
      case 3:
        return scienceData;
        break;
      case 4:
        return sportData;
        break;
      case 5:
        return techData;
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    businessData = authorApi.fetchBusinessData();
    entertainmentData = authorApi.fetchEntertainmentData();
    healthData = authorApi.fetchHealthData();
    scienceData = authorApi.fetchScienceData();
    techData = authorApi.fetchTechData();
    sportData = authorApi.fetchSportsData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.only(left: 12.0, top: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'TODAY',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontFamily: 'palatino'),
                      ),
                      TextSpan(
                        text: ' NEWS',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontFamily: 'palatino',
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                  SizedBox(height: 18.0),
                  containerType(),
                ],
              ),
            ),
            SizedBox(height: 4.0),
            Expanded(
              child: FutureBuilder(
                future: deciderData(),
                builder: (context, AsyncSnapshot<Authors> snapShot) {
                  if (snapShot.hasData) {
                    return ListView.builder(
                      itemCount: snapShot.data.articles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                send = snapShot.data.articles[index].url;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (e) => SecondScreen(send),
                                  ),
                                );
                              },
                            );
                          },
                          child: ListTile(
                            leading: Container(
                              width: 120.0,
                              height: 100.0,
                              child: snapShot.data.articles[index].urlToImage !=
                                      null
                                  ? Image(
                                      image: NetworkImage(snapShot
                                          .data.articles[index].urlToImage),
                                      fit: BoxFit.cover,
                                    )
                                  : Image(
                                      image: NetworkImage(
                                        'https://images.pexels.com/photos/3932961/pexels-photo-3932961.jpeg?cs=srgb&dl=pexels-tatiana-syrikova-3932961.jpg&fm=jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            title: Text(snapShot.data.articles[index].title),
                          ),
                        );
                      },
                    );
                  } else if (snapShot.hasError) {
                    return Center(
                      child: Text('error snapShot'),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerType() {
    return Container(
      height: 110.0,
      child: ListView.separated(
        separatorBuilder: (c, i) => SizedBox(width: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: ModelTypes.samples.length,
        itemBuilder: (c, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 70.0,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage:
                        AssetImage(ModelTypes.samples[index].image),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '${ModelTypes.samples[index].title}'.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color:
                          selectedIndex == index ? Colors.blue : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
/*
Row(
                    children: [
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              child: Icon(Icons.list, size: 30),
                            ),
                            SizedBox(height: 8.0),
                            Text('All')
                          ],
                        ),
                      ),
                      SizedBox(width: 14.0),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  AssetImage('images/business.jpg'),
                            ),
                            SizedBox(height: 8.0),
                            Text('Business')
                          ],
                        ),
                      ),
                      SizedBox(width: 14.0),
                      Container(
                        width: 90.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('images/enter.jpg'),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Entertainment',
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 14.0),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                          backgroundImage:
                          AssetImage('images/spoerts.jpg'),
                        ),

                            SizedBox(height: 8.0),
                            Text('Sports')
                          ],
                        ),
                      ),
                      SizedBox(width: 14.0),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                              AssetImage('images/health.jpg'),
                            ),
                            SizedBox(height: 8.0),
                            Text('Health')
                          ],
                        ),
                      ),
                      SizedBox(width: 14.0),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                              AssetImage('images/tech.jpg'),
                            ),
                            SizedBox(height: 8.0),
                            Text('Tech')
                          ],
                        ),
                      ),
                      SizedBox(width: 14.0),
                      Container(
                        width: 60.0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                              AssetImage('images/sci.jpg'),
                            ),
                            SizedBox(height: 8.0),
                            Text('Science')
                          ],
                        ),
                      ),
                    ],
                  ),
 */
/*
Container(
                    height:400.0,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: NetworkImage(
                                snapShot.data.articles[index].urlToImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(snapShot.data.articles[index].title),
                        ),
                      ],
                    ),
                  );
 */
