import 'package:elsner_practical/ui/widget/text_layout.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final positionData;

  const ListItem({
    Key key,
    @required this.positionData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 1.0,
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: <Widget>[
          Image.network(
            positionData.image,
            width: double.infinity,
            height: 200.0,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Icon(
                Icons.favorite,
                size: 40,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200.0),
            child: Container(margin: EdgeInsets.all(10.0),child: Column(
              children: <Widget>[
                TextLayout(
                  text: positionData.firstname,
                  align: TextAlign.center,
                  color: Colors.black87,
                  fontSize: 20.0,
                  maxLine: 1,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.blur_circular,
                      size: 16,
                      color: Colors.black45,
                    ),
                    TextLayout(
                      text: positionData.tags[0].name,
                      align: TextAlign.center,
                      color: Colors.black45,
                      fontSize: 16.0,
                      maxLine: 1,
                      fontWeight: FontWeight.w500,
                    ),
                    TextLayout(
                      text: "-",
                      align: TextAlign.center,
                      color: Colors.black45,
                      fontSize: 16.0,
                      maxLine: 1,
                      fontWeight: FontWeight.w500,
                    ),
                    TextLayout(
                      text: positionData.serviceTypeName,
                      align: TextAlign.center,
                      color: Colors.black45,
                      fontSize: 16.0,
                      maxLine: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.black45,
                    ),
                    TextLayout(
                      text: positionData.date,
                      align: TextAlign.center,
                      color: Colors.black45,
                      fontSize: 16.0,
                      maxLine: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.black45,
                    ),
                    TextLayout(
                      text: positionData.location,
                      align: TextAlign.center,
                      color: Colors.black45,
                      fontSize: 16.0,
                      maxLine: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Container(
                  width: 70.0,
                  decoration: new BoxDecoration(
                    color: Colors.green.withOpacity(0.5),
                    borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color:  Colors.green.withOpacity(0.5),
                        offset: Offset(1.0, 2.0),
                        blurRadius: 0.05,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextLayout(
                        text: "${double.parse(positionData.rating)}",
                        align: TextAlign.center,
                        color: Colors.white,
                        fontSize: 18.0,
                        maxLine: 1,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.white,
                      ),

                    ],
                  ),
                )],)
              ],
            ),),
          )
        ],
      ),
    );
  }
}
