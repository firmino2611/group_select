import 'package:flutter/material.dart';
import 'package:group_select/group_select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SelectController<int> controller = SelectController<int>();
  final SelectController<String> controller2 = SelectController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Reset'),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () {
          controller.resetValues();
          controller2.resetValues();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GroupSelect<int>(
              activeColor: Colors.red,
              title: 'With items',
              controller: controller,
              items: [
                Item(title: 'Item 1', value: 1),
                Item(title: 'Item 2', value: 2),
                Item(title: 'Item 3', value: 3),
                Item(title: 'Item 4', value: 4),
                Item(title: 'Item 5', value: 5),
              ],
            ),
            GroupSelect<String>(
              title: 'With groups items',
              activeColor: Colors.green,
              controller: controller2,
              groups: [
                Group(
                  title: 'Grupo 1',
                  id: '1',
                  items: [
                    Item(
                      title: 'Item 1',
                      value: '1',
                      leading: const Icon(Icons.circle),
                    ),
                    Item(
                      title: 'Item 2',
                      value: '2',
                      leading: const Icon(Icons.circle),
                    ),
                    Item(
                      title: 'Item 3',
                      value: '3',
                      leading: const Icon(Icons.circle),
                    ),
                    Item(
                      title: 'Item 4',
                      value: '4',
                      leading: const Icon(Icons.circle),
                    ),
                    Item(title: 'Item 5', value: '5'),
                  ],
                ),
                Group(
                  title: 'Grupo 2',
                  id: '',
                  items: [
                    Item(title: 'Item 1', value: '6'),
                    Item(title: 'Item 2', value: '7'),
                    Item(title: 'Item 3', value: '8'),
                    Item(title: 'Item 4', value: '9'),
                    Item(title: 'Item 5', value: '10'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
