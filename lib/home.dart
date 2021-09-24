import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pts_rafyattala_rpl2/detail.dart';
import 'package:pts_rafyattala_rpl2/teammodel.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<TeamModel> list = [];
  late List<dynamic> data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    setState(() {
      isLoading = true;
    });

    final response = await get(Uri.parse( 
        'https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League'));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var res = jsonDecode(response.body);
      setState(() {
        data = res['teams'];
        for (int i = 0; i < data.length; i++) {
          list.add(new TeamModel(
              data[i]['strTeam'],
              data[i]['strDescriptionEN'],
              data[i]['strTeamBadge']));
        }
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load teams');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: isLoading
          ? Center(
          child: CircularProgressIndicator(color: Colors.blue[800]))
          : Container(
        decoration: BoxDecoration(
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildList(list)
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildList(List<TeamModel> list) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(list[index]);
              }));
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(list[index].strTeamBadge),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(list[index].strTeam,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16)),
                          SizedBox(height: 10),
                          Text(
                            '${list[index].strDescriptionEN}',
                            style: TextStyle(fontSize: 14),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: list.length,
    );
  }
}
