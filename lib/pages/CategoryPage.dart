import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List imgList = [
    { 'url': "https://www.itying.com/images/flutter/1.png" },
    { 'url': "https://www.itying.com/images/flutter/2.png" },
    { 'url': "https://www.itying.com/images/flutter/3.png" },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('swiper'),

      ),
      body: new Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network(this.imgList[index]['url'],fit: BoxFit.fill,);
        },
        itemCount: this.imgList.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),

    );
  }
}

