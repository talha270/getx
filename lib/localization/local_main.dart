import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/localization/localization_translator.dart';

void main(){
  runApp(LocalHome());
}
class LocalHome extends StatelessWidget {
  const LocalHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "localization",
      // theme: ThemeData.dark().copyWith(),
      locale: Localizationservices.locale,
      fallbackLocale: Localizationservices.fallbackLocale,
      translations: Localizationservices(),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  Homepage({super.key});
  var uselocal=Locale("en","US");
  updatelocal(){
    Get.updateLocale(uselocal);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text("hello".tr,style: TextStyle(fontSize: 20),),
            Spacer(),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: Divider()),
                SizedBox(width: 10,),
                Text("change_lang".tr),
                SizedBox(width: 10,),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  uselocal=Locale("en","us");
                  updatelocal();
                }, child: Text("english")),
                ElevatedButton(onPressed: () {
                  uselocal=Locale("es","ES");
                  updatelocal();
                  }, child: Text("Spanish")),
                ElevatedButton(onPressed: () {
                  uselocal=Locale("fr","Fr");
                  updatelocal();

                }, child: Text("French")),

              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

