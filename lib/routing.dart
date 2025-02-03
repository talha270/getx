import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(tryapp());
}
class tryapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:Home(), //if you use the routing then no use this
      initialRoute: "/",
      routes: {
        "/":(context)=>Home(),
        "/second":(context)=>Nextpage()
      },
    );
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, "/second");
            }, child: Text("next")),
          )
        ],
      ),
    );
  }
}

class Nextpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Platform.isAndroid.toString(),style: TextStyle(fontSize: 40),),
            Text(Platform.isIOS.toString(),style: TextStyle(fontSize: 40)),
            Text(Platform.isLinux.toString(),style: TextStyle(fontSize: 40)),
            Text(Platform.isFuchsia.toString(),style: TextStyle(fontSize: 40)),
            Text(Platform.isMacOS.toString(),style: TextStyle(fontSize: 40)),
            Text(Platform.isWindows.toString(),style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
  }
}