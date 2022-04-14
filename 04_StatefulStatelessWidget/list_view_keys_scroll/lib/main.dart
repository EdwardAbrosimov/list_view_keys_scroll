import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Просмотр изображений'),
          centerTitle: true,
          bottom: TabBar(
            tabs: data.keys.map((String item) => Tab(text: item)).toList(),
          ),
        ),
        body: TabBarView(
          children: data.keys.map((name) {
            return ListView(
              key: PageStorageKey(name),
              children: <Widget>[
                for (var item in data.entries)
                  if (item.key == name)
                    for (String e in item.value)
                      // Container(
                      //   alignment: Alignment.center,
                      //   height: 400,
                      //   margin: const EdgeInsets.all(32.0),
                      //   padding: const EdgeInsets.all(32.0),
                      //   child: Image.network(
                      //     '$e',
                      //     loadingBuilder: (context, child, loadingProgress) {
                      //       return loadingProgress == null
                      //           ? child
                      //           : LinearProgressIndicator(
                      //               minHeight: 16,
                      //             );
                      //     },
                      //   ),
                      // )
                      Container(
                        alignment: Alignment.center,
                        height: 200.0,
                        width: 500,
                        margin: const EdgeInsets.all(32),
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                e,
                              )),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
