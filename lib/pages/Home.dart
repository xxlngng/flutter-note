import 'package:flutter/material.dart';
import 'CategoryPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        children: [
          MaterialButton(
            color: Colors.yellow,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CategoryPage())
              );
            },
            child: Text('轮播图'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/appBarPage');
              }
              ,
              child: Text('appbar')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tabBarControlPage');
              }
              ,
              child: Text('tabBarControlPage')
          ),

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(onPressed: () {}, child: Text('RaiseButton 已经停用')),
              RaisedButton.icon(onPressed: null, icon: Icon(Icons.access_time_sharp), label: Text('图标')),
              FlatButton(onPressed: () {}, child:  Text('FlatButton 已经停用')),
              OutlineButton(onPressed: () {}, child:  Text('OutlineButton 已经停用')),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.access_time_sharp),
                color: Colors.yellow,
                constraints: BoxConstraints(),
              ),
              ElevatedButton(
                onPressed: () {}, 
                child: Text('圆角'), 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shadowColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(10), // 阴影
                  // shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(30)  // 圆角
                  // )),
                  shape: MaterialStateProperty.all(
                    CircleBorder(side: BorderSide(color: Colors.white)) // 圆角
                  ),
                ),
              ),


            ],
          ),
          FloatingActionButton(
            onPressed: () => {},
            child: Icon(Icons.add),
            tooltip: 'add',
          )
        ],
      )
      
    );
  }
}


