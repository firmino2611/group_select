import 'package:flutter/material.dart';
import 'package:group_select/controllers/group_select/group_select_controller.dart';
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
  final itemController = SelectGroupController<int>();
  final groupController = SelectGroupController<String>();
  final itemControllerSingle = SelectGroupController<int>(multiple: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Reset',
              style: TextStyle(fontSize: 20),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {
            itemController.resetValues();
            groupController.resetValues();
            itemControllerSingle.resetValues();
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GroupSelect<String>(
                title: 'With groups items',
                activeColor: Colors.green,
                controller: groupController,
                onChange: (values) {
                  print(values);
                },
                groups: [
                  _groupSelectWithGroup,
                ],
              ),
              _groupSelectWithItems,
              _groupSelectSingleWithItems,
            ],
          ),
        ),
      ),
    );
  }

  get _groupSelectWithGroup {
    return Group(
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
    );
  }

  get _groupSelectWithItems {
    return GroupSelect<int>(
      activeColor: Colors.red,
      title: 'With items',
      controller: itemController,
      items: [
        Item(title: 'Item 1', value: 1),
        Item(title: 'Item 2', value: 2),
        Item(title: 'Item 3', value: 3),
        Item(title: 'Item 4', value: 4),
        Item(title: 'Item 5', value: 5),
      ],
    );
  }

  get _groupSelectSingleWithItems {
    return GroupSelect<int>(
      activeColor: Colors.red,
      title: 'Single With items',
      controller: itemControllerSingle,
      items: [
        Item(title: 'Item 1', value: 1),
        Item(title: 'Item 2', value: 2),
        Item(title: 'Item 3', value: 3),
        Item(title: 'Item 4', value: 4),
        Item(title: 'Item 5', value: 5),
      ],
    );
  }
}
