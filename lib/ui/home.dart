import 'dart:async';
import 'package:elsner_practical/base/circular_progress.dart';
import 'package:elsner_practical/base/simple_error_view.dart';
import 'package:elsner_practical/entity/home_data.dart';
import 'package:elsner_practical/ui/repo/home_repo.dart';
import 'package:elsner_practical/ui/view/home_view.dart';
import 'package:elsner_practical/ui/widget/list_Item.dart';
import 'package:elsner_practical/util/app_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeView {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamController _controller = StreamController<List<Data>>();
  HomeRepo _repo;

  StreamController<bool> loadingState = StreamController<bool>.broadcast();

  @override
  void initState() {
    _repo = HomeRepo(view: this);
    _repo.doApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Stack(
              children: <Widget>[
                Positioned(
                  left: 1.0,
                  top: 2.0,
                  child: Icon(Icons.format_list_numbered, color: Colors.yellow, size: 35.0,),
                ),
                Icon(Icons.format_list_numbered, color: Colors.black54,size: 35.0),
              ],
            ),
            SizedBox(width: 5.0,),
            Text(
              "Ballers\nList",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black54,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.yellow,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            )
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black.withOpacity(0.7)),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.location_on,
              color: Colors.black.withOpacity(0.7),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black.withOpacity(0.7)),
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: StreamBuilder<List<Data>>(
            stream: _controller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return Container();
                }

                List<Data> list = snapshot.data;

                return ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  itemBuilder: (_, position) {
                    var positionData = list[position];
                    return ListItem(
                      positionData: positionData,
                    );
                  },
                );
              }

              if (snapshot.hasError) {
                print('HomePage Error: ${snapshot.error}');
                return SimpleErrorView(
                  messageKey: snapshot.error,
                  textColor: Colors.redAccent.withOpacity(0.7),
                );
              }
              return Container();
            },
          ),
        ),
        StreamBuilder(
          stream: loadingState.stream,
          builder: (context, snapshot) {
            print('STATE: ${snapshot.data}');
            if (snapshot.data ?? false) {
              return CircularProgress();
            }
            return Container();
          },
        ),
      ],
    );
  }

  @override
  void hideProgress() {
    loadingState.add(false);
  }

  @override
  void showProgress() {
    loadingState.add(true);
  }

  @override
  void onError(String value) {
    _showSnackBar(value);
  }

  @override
  void showError(String errorMessage) {
    print(errorMessage);
    var snackBar =
        AppUtil().snackBarView(errorMessage, Colors.redAccent.withOpacity(0.7));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _showSnackBar(String errorMessage) {
    var snackBar =
        AppUtil().snackBarView(errorMessage, Colors.redAccent.withOpacity(0.7));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  void onDataAvailable(data) {
    if (data.status != true) {
      _showSnackBar(data.message);
    } else {
      _controller.add(data.data);
    }
  }

  @override
  void dispose() {
    _controller.close();
    loadingState.close();
    super.dispose();
  }
}
