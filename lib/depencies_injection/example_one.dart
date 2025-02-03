// import 'counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CounterController extends GetxController {
  // Observable variable
  var count = 0.obs;

  // Method to increment the counter
  void increment() {
    count++;
  }
}



class CounterBinding extends Bindings {
  @override
  void dependencies() {
    // Injecting CounterController lazily
    Get.lazyPut<CounterController>(() => CounterController());
  }
}


class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the injected CounterController
    final CounterController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Counter Page')),
      body: Center(
        child: Obx(
              () => Text(
            'Count: ${controller.count}',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/counter',
      getPages: [
        GetPage(
          name: '/counter',
          page: () => CounterPage(),
          binding: CounterBinding(), // Attach the binding here
        ),
      ],
    );
  }
}
