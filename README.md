rn 在原生和ios都支持跨平台

flutter 只能在android上实现跨平台   ios上不支持

环境

- 安装java
  - cmd 输入 java 有输出
- 安装Flutter SDK
  - 解压flutter sdk
  - 配置环境变量 --path加入bin的路径
  - cmd运行flutter -h
  - flutter doctor 检测环境
- 安装 android studio  连接
  - 安装flutter 插件 Configure =》 plugin
  - 查找flutter  ==》install
  - flutter doctor --android-licenses  安装证书 一直按 y
- 注意
  插件中 Android APK Support  要启用才支持flutter项目

项目配置

- 修改 android/build.gradle 文件
       repositories {
      //        google()
      //        jcenter()
              maven { url 'https://maven.aliyun.com/repository/google' }
              maven { url 'https://maven.aliyun.com/repository/jcenter' }
              maven { url 'http://maven.aliyun.com/nexus/content/groups/public'}
          }
          // 有两个地方要改


  - ！！！ sdk 里面的flutter.gradle 也要改
      'D:\Flutter\flutter\packages\flutter_tools\gradle'
      buildscript {
          repositories {
              //jcenter()
              // maven {
              //     url 'https://dl.google.com/dl/android/maven2'
              // }
              maven{
                  url 'https://maven.aliyun.com/repository/jcenter'
              }
              maven{
                  url 'http://maven.aliyun.com/nexus/content/groups/public'
              }
          }
          dependencies {
              classpath 'com.android.tools.build:gradle:3.1.2'
          }
      }



添加环境变量

    PUB_HOSTED_URL=https://pub.flutter-io.cn
    FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn





配置 vs code

安装插件 flutter

快捷启动模拟器

可以使用---夜神模拟器

    桌面创建 .bat 文件
    找到emulate.exe文件目录 在emulate下的 写入
    D:\Android\Sdk\emulator -netdelay none -netspeed full -avd Nexus_5X_API_30




Dart

- 入口方法 main()
- 有 var 也可以有类型定义变量  有类型校验 区分大小写

文档  https://www.dartcn.com/guides/language/language-tour#%E7%B1%BB

类型

    var a = 'dart'     // var 定义的类型回自动进行类型推断，不一致会报错
    String str = 'dart'
    int num = 66
    const pi = 3.14  // 常量
    final x = '常量'

    print("$a $x")  // ==》 dart 常量    也可以用+连接

    int // 整形
    double // 浮点型
    bool // true false

    if 判断 == 不会进行类型转换


    Map
    var ma = {
        "name": "aa",
        "arr": [1,2,3]
    }
    ma.keys() // 获取所有key值
    values()  // 获取所有的value值
    remove(key)  删除指定key的数据
    addAll({...})  合并映射
    containsValue   查看映射内的值  返回true/false

    print(ma['name'])

    var p = new Map()
    p['name'] = '张三'

    判断类型  is
    if(str is String)


- 三个引号包起来跟 pre一样保持原格式输出



List

- 常用属性
  - length 长度
  - reversed       反转
  - isEmpty         是否为空
  - isNotEmpty    是否不为空
- 常用方法
  - add            增加
  - addAll          拼接数组
  - indexOf        查找    传入具体值  查到返回索引，如果没有返回 -1
  - remove         删除    传入具体值
  - removeAt      删除   传入索引值
  - fillRange(start, end, value)        修改
  - insert(index, value)         指定位置插入
  - insertAll                              指定位置插入数组
  - toList()           其他类型转换成List
  - join()               List转换成字符串
  - split()               字符串转化成List
  - forEach((value){})    // 只能传value
  - map((value){})
  - where((value) { return  value > 4 })    满足条件返回
  - any()            有一个满足条件返回 true
  - every            每一个都满足条件 返回true

    List (数组)
    var li = ['a', 1, true]
    var len = li.length   // 下标和js一样

    var li1 = <String>['a', 'b']

    var li2 = []
    li2.add('a')  //添加

    var li3 = List.filled(2, 'a')  // ['a','a']  固定长度 不能增加也不能修改长度
    addall







方法

    void main() {}



类

- 使用static 关键字来实现类级别的静态属性和静态方法
- 静态方法不能访问非静态成员，非静态方法能访问静态成员

    class Person {
        static name
        int age
        static void show () {
            print(name)
        }

        void printInfo() {
            print(name)
            print(this.age)
        }
    }

    Person.name

- 类继承
  1. 子类用extends 关键词来继承父类
  2. 子类会继承父类里面可见的属性和方法，但不会继承构造函数
  3. 子类能复写父类的方法 getter和setter



    class Person {
        String name
        Number age
        Person(this.name, this.age);
    }

    class Son extend Persen {
        Son(name, age):super(name, age);
    }



抽象类

抽象类主要用于定义标准，子类可以继承抽象类，也可以实现抽象类接口。

1. 抽象类通过abstract关键字来定义
2. Dart中的抽象方法不能用abstract声明，Dart中没有方法体的方法我们称为抽象方法
3. 如果子类继承抽象类必须得实现里面的抽象方法
4. 如果抽象类当作接口实现的话必须得实现抽象类里面定义的所有属性和方法
5. 抽象类不能被实例化，只有继承他的子类可以

- extends抽象类 和 implement 的区别

1. 如果复用抽象类里面的方法，并且要用抽象方法约束的话我们就用extends继承抽象类
2. 如果只是把抽象类当作标准的话我们就用implement实现抽象类

    abstract class Animal {
        eat() // 抽象方法
        info() {
            // 正常继承的方法
        }
    }

    class Dog extends Animal {
        @override
        eat() {
            print('Dog);
        }
    }

    class Cat extends Animal {
        @override
        eat() {
            print('Cat');
        }
    }
    main() {
        Animal d = New Dag();
        d.eat();
        Animal c = New Cat();
        c.eat();
    }





多态

- 允许将子类类型的指针赋值给父类类型的指针，同一个函数调用会有不同的执行效果
- 子类的实例赋值给父类的引用
- 多态就是父类定义一个方法不去实现，让继承他的子类去实现，每个子类有不同的表现

接口

    absteact class A {
        printA('aa');
    }

    abstract class B {
        printB('b');
    }

    class C implements A,B {
        @override
        printA(){...}
        @override
        printB(){...}
    }



Mixins

1. 作为mixins的类只能继承自 Object，不能继承其他类
2. 作为mixins不能有构造函数
3. mixins 不是继承，也不是接口，而是一种全新的特性

    class A {
        printA('aa');
    }

    class B {
        printB('b');
    }

    class AB {
        AB(this.name) // 构造函数
    }

    class C with A, C {
    // mixins了A和B的方法和属性
    }

    // 继承了AB minxins 了A和B
    class D extends AB with A,B {
        D(name): super(name)
    }



泛型

解决 类、接口、方法的复用性以及不特定数据类型的支持(类型校验)

    T getData<T>(T value) {
        return T value;
    }

    main() {
        getData<String> ('string');
    }

    // 泛型类
    class MyList<T> {
        List li = <T>[];
        void add(T value) {
            this.li.add(value);
        }
    }







运算符

    算数运算符
    + - * / ~/(取整)  %（取余）
    关系运算符
    ==   !=  >= <= < >
    逻辑运算符
    =    ??=
    var a = 1  b??=2   // 如果b为空 则b=2
    &&   ||

    +=  -=  *= /=  %=  ~/=
    a? true: false

    var c = 10
    a= c ?? 2  c有值用c

类型转换

    toSting()  转成字符串类型
    int.parse()  转成int类型
    double.parse() 转成 double 类型
    isEmpty   判断是否为空   a.isEmpty
    null
    isNan



类

默认构造函数

在没有声明构造函数的情况下， Dart 会提供一个默认的构造函数。 默认构造函数没有参数并会调用父类的无参构造函数。

构造函数不被继承

子类不会继承父类的构造函数。 子类不声明构造函数，那么它就只有默认构造函数 (匿名，没有参数) 。

命名构造函数

使用命名构造函数可为一个类实现多个构造函数， 也可以使用命名构造函数来更清晰的表明函数意图：

抽象类

使用 abstract 修饰符来定义 抽象类 — 抽象类不能实例化。 抽象类通常用来定义接口，以及部分实现。 如果希望抽象类能够被实例化，那么可以通过定义一个 工厂构造函数 来实现。



一个类可以通过 implements 关键字来实现一个或者多个接口， 并实现每个接口要求的 API。

库

1. 我们自定义的库
   import 'lib/xxx.dart'
2. 系统内置库
   import 'dart:math';
   import 'dart:io'
   import 'dart:convert'
3. Pub包管理系统中的库
   https://pub.dev/packages
   https://pubflutter-io.cn/packegas
   https://pubflutter-io.cn/packegas
   - 需要自己在根目录新建一个pubspec.yaml
   - 在pubspec.yaml文件配置名称、表述、依赖等信息
   - 运行pub get 获取包下载到本地
   - 项目中引入库  import 'package:http/http.dart' as http   //看文档使用



- 库的重命名和冲突解决

    import 'lib/Persin1.dart' as lib;

- 库部分引入用 show \ 隐藏用hide

    import 'lib/Persin1.dart' show getName;
    import 'lib/Persin1.dart' hide getName;

- 延迟加载   deferred as

也称懒加载， 可以在与需要的时候再进行加载

懒加载的最大好处是可以减少APP的启动时间

    import 'package:deferred/hello.dart' deferred as hello;
    当需要使用的时候，使用 loadLibrary()

    gerrt() async {
        await hello.loadLibrary();
        hello.say();
    }



空安全

Null safrty 可以帮助开发中避免一些日常开发中很难被发现的错误，并且可以改善性能

？可空类型

！类型断言

    int a = 1; // 非空int类型
    a = null;  //报错 空安全

    int? b = 2; // 可空类型
    b = bull;

    // 类型断言
    String? str = 'sssss';
    str.length;
    str = null
    str!.length;   // 类型断言  str 不等于null会打印长度 等于null会抛出异常

    String getLength(String value) {
    try{
        return value!.length;
    } catch(e) {
        ...
    }
    }

- late 用于延迟初始化

    Class Per {
       late String name;
       late int age;
       void setInfo(String name, int age) {...}
    }



- required

最开始 @required 是注解 现在已经作为内置修饰符 主要用于标记参数为必填









flutter

r Hot reload.

R Hot restart.

h Repeat this help message.

d Detach (terminate "flutter run" but leave application running).

c Clear the screen

q Quit (terminate the application on the device).

p 网格

-     flutter run --no-sound-null-safety   // 不适用空安全启动

常用组件

Text

  名称             	功能
  textDicrection 	为本方向（ltr,rtl）
  overflow       	文字超出屏幕之后的处理方式（clip裁剪，fade,渐隐，ellipsis省略号）
  textScaleFactor	文字显示倍率
  maxLines       	文字显示最大行数
  style          	字体的样式设置
  textAlign      	文本对其方式（center, left, right, justfy 两端对其）

- TextStyle

  名称             	功能
  decorationColor	文字装饰线颜色
  decoration     	文字装饰线（none，lineThrough,overline,underline）
  decorationStyle	文字装饰风格(dashed,dotted,double,solid,wavy波浪线)
  wordSpacing    	单词间隙



    // 文字组件
    		 // child: Text(
              //   '仅仅一行剧中的文字仅仅一行剧中的文字仅仅一行剧中的文字仅仅一行剧中的文字仅仅一行剧中的文字',
              //   textAlign: TextAlign.center,
              //   maxLines: 1,
    		  //   overflow: TextOverflow.ellipsis,
              //   style: TextStyle(
              //     fontSize: 28.0,
              //     color: Color.fromARGB(120, 120, 120, 120),
              //     decoration: TextDecoration.underline,
              //     decorationStyle: TextDecorationStyle.dotted
              //   ),
              // ),



ContainedBox



Container  容器组件

  名称              	共能
  width           	宽
  height          	高
  alignment       	Alignment.bottomLeft;topRight,center
  padding         	EdgeInset.fromLTRB(10,10,10,10)
  margin          	EdgeInset.fromLTRB(10,10,10,10)
  transform       	Matrix4.traslationValues(x,y,z)
  decoration      	BoxDecoration(...)
  decoration.image	NetworkImage(uri, fit:BoxFit.cover)



    //  容器组件
    		  child: Container(
    		  //             child: Text(
    //               'dfd men11111111111111111111111111111',
    //               style: TextStyle(fontSize: 32.0),
    //             ),
    //             // 容器内内容的对其方式
    //             alignment: Alignment.topLeft,
    //             width: 500.0,
    //             height: 400.0,
    //             // color: Colors.lightBlue,
    //             padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 30.0),
    //             margin: const EdgeInsets.all(50.0),
    // //            修饰背景和边框
    //             decoration: new BoxDecoration(
    //                 gradient: const LinearGradient(colors: [
    //                   Colors.lightBlue,
    //                   Colors.greenAccent,
    //                   Colors.purple
    //                 ]),
    //                 border: Border.all(width: 2.0, color: Colors.red)),
    			child:
                    new Image.network('http://10.88.243.217/img/logo.bfde2617.png',
    				scale:2.0,),
                width: 400.0,
                height: 300.0,
                color: Colors.lightBlue,
              ),



Image

Image.asset  本地图片

Image.network  网络图片

    Image.network('www.tupian.com',option)

  Option
  alignment     	bootomRight,topLeft...
  color         	背景
  colorBlendMode	BlendMode.screen (混合颜色)
  fit           	BoxFix.cover,fill
  repeat        	ImageRepeat.repeat
  width         	100
  height        	100

- ClipOval  图片圆形处理

    child: ClipOval(
      child: Image.network(uri)
    )

- 加载本地图片

1. 项目中新建 images 目录
2. 添加子目录 2.0x  3.0x  4.0x   每个文件夹中添加图片
3. pubspec.yaml 修改

    assets:
    	- images/2.0x/a.jpg
    	- images/3.0x/a.jpg


    Image.asset('images/a.jpg')



ListView

1. 垂直列表
2. 垂直图文列表
3. 水平列表
4. 动态列表
5. 矩阵列表



  名称             	类型                	说明
  scrollDirection	Axis              	Axis.hrizantal 水平列表   .vertical垂直列表
  padding        	EdgeInsetsGeometry	内边距
  resolve        	bool              	组件反向排序
  children       	<Widget>[]        	ListTile()


- ListView.builder()

    return ListView.builder(
    itemCount: length,
    itemBuilder: (context, index) {
        return ListTile(
        title: Text(index))
    }
    )



    body: new LiseView(
    	children: <Widget> [
            new ListTile(
            	leading: new Icon(Icons.perm_camera_mic),
            	title:new Text('ListView Widget')
            )
    	]
    )



GridView

- 可以通过GridView 实现网络布局
- 通过GridView.builder 实现网络布局

  名称              	类型                                      	说明
  scrollDirection 	Axis                                    	滚动方法
  padding         	EdgeInsetGeometry                       	内边距
  crossAxisSpacing	double                                  	水平Widget之间间距
  mainAxisSpacing 	double                                  	垂直Widget之间间距
  crossAxisCount  	int                                     	一行Widget数量
  childAspectRatio	dounle                                  	子Wiget宽高比
  children        	                                        	<Widget>[]
  gredDelegate    	SliverGridDelegateWithFixedCrossAxisCount(常用)    SliverGridDelegateWithMaxCrossAxisExtent	控制布局主要在Grid View.builder里面



- GridView.builder

    GridView.builder(
    	itemCount: 10,
    	itemBuilder: <Widget>,
    	gridelegate:SliverGridelegateWithFixedCrossAxisCount(
    		crossAxisCount: 3,
    		...
    	)
    )



Padding 组件

    Padding(
    	padding: EdgeInsets.all(10),
    	child: ...
    )



Column 垂直布局组件

  属性                	说明
  mainAxisAlignment 	主轴的排序方式
  crossAxisAlignment	次轴的排序方式
  children          	子组件

Row 水平布局组件

  属性                	说明
  mainAxisAlignment 	主轴的排序方式
  crossAxisAlignment	次轴的排序方式
  children          	子组件

Expanded 组件  类似Web中 flex布局

Expanded 可以用在 Row Colunm 布局中

  属性   	说明
  flex 	元素占整个父组件Row/ column 的比例
  child	子组件

    children: <Widget> [
        Expanded(
        	flex: 1,
        	child: ....,
        ),
        Expanded(
        	flex: 2,
        	child: ....,
        ),
    ]




SizeBox 间距设计

    SizeBox(width: 10)  // 宽10 的间距
    SizeBox(heigth: 10); // 高10 的间距




Stack 层叠组件 定位布局

  属性       	说明
  alignment	配置所有子元素的显示位置
  children 	子组件

- Stack Align

可以控制每个子元素的显示位置

  属性        	说明
  alignment 	Alignment.topLeft
  childchild	子组件

Positioned

  属性                    	说明
  child                 	Alignment.topLeft
  let  top  bottom right

Align 相对父组件定位



AspectRatio

设置调整子元素的宽高比

  属性         	说明
  aspectRatio	宽高比 要看外层是否允许这个比率布局  这只是个参考值
  child



Card

  属性    	说明
  margin	EdgeInset 外边距
  child 	子组件
  Shape 	阴影效果



Wrap

和Row、column表现几乎一致，但是在mainAxis上空间不足时，会向crossAxis上扩展 ===流布局的实现

  属性        	说明
  spacing   	间距
  runspacing	间距
  alignment 	WrapAlignment  对齐



ElevatedButton按钮



BottomNavigationBar

底部栏

  属性          	说明
  items       	List<BottomNavigationBarIterm> 按钮集合
  iconSize    	icon 大小
  currentIndex	默认选中第几个
  onTap       	回调函数
  Type        	BottomNavigationBarType.fixed (底部可以有多个按钮)    .shifting



UserAccountsDrawerHeader

  属性                   	描述
  decoration           	设置顶部背景颜色
  accountName          	账户名称
  accountEmail         	邮箱
  currentAccountPicture	头像
  otherAccountsPictrues	设置当前头账户其他账户头像
  margin



Button

- TaiseButton 突起的按钮 其实就是Material Design风格的 Button
- FlatButton  扁平化按钮
- OutlineButton  线框按钮

2.0 的按钮

- IconButton 图标按钮
- ButtonBar 按钮组
- FloatingActionButton  浮动按钮
- ElevateButton  凸起按钮
- TextButton 扁平化按钮
- OutLinedButton  线框按钮



InkWell()

添加点击属性的组件



ShowDialog

- simpleDialog   option选择
- alertDialog   弹框提示
- showModalBottomsheet   底部弹窗
- fluttertoast  第三方库的弹框

Divider 分割线



LinearProgressIndicator  进度条



CircularProgressIndicator loading加载



GestureDetector  包含点击事件

点击、双击、长按、拖拽



Table 表格

- Table

- DataTable
  - columns
  - rows





Timer  定时器

    import 'dart:async'

    _showTimer(context) {
        var timer;
        timer = Timer.periodic(
           Duration(milliseconds: 1000), (t) {
               print('执行');
               // Navigator.pop(context);
               t.cancel();  // 取消
           }
        )
    }




性能

编辑器侧边栏 Flutter Performance 栏





路由

    Navigator.of(context).push(
    	MaterialPageRoute(builder: (context) => CategoryPage())
    );

    Navigator.of(context).pop(); // 返回


1. 基本路由
2. 命名路由

    routes: {
            '/form': (context) => FormPage(),
          }, // 在main中定义路由

    Navigator.pushNamed(context, '/form');




网络请求

数据转换

- json.encode()
- json.decode()

    import 'dart:convert';
    var mapData = {'name': 'zhangsan', 'age': '20'};
    var strData = {'name': 'zhangsan', 'age'};

    json.encode(mapData);  Map 转换成Json
    json.decode(strData);  Json 字符串转 Map




http

- 安装插件 http



dio






