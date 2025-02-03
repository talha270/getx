import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

// Controller for managing the counter
class CounterController extends GetxController {
  var count = 0.obs; // Observable variable

  void increment() {
    count++;
  }
}

class MyApp extends StatelessWidget {
  // Injecting the controller using Get.put
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  // Use GetMaterialApp instead of MaterialApp
      title: 'GetX Example',
      initialRoute: '/',    // Initial route
      
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/next', page: () => NextPage()),
      ],
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  final CounterController controller = Get.find();  // Retrieve the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Obx(() => Text(
          'Count: ${controller.count}',
          style: TextStyle(fontSize: 25),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();  // Increment the count
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/next');  // Navigate to the NextPage
          },
          child: Text('Go to Next Page'),
        ),
      ),
    );
  }
}

// Next Page
class NextPage extends StatelessWidget {
  final CounterController controller = Get.find();  // Retrieve the same controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page')),
      body: Center(
        child: Obx(() => Text(
          'Count on Next Page: ${controller.count}',
          style: TextStyle(fontSize: 25),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();  // Navigate back to the HomePage
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
