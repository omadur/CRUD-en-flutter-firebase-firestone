import 'package:flutter/material.dart';
import 'package:flutter_crud_firestone/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Appbar'),
      ),
      body: FutureBuilder(
        future: getPeople(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index]['name']),
                  onTap: ((() async {
                    await Navigator.pushNamed(
                      context,
                      '/edit',
                      arguments: {
                        'name': snapshot.data?[index]['name'],
                        'uid': snapshot.data?[index]['uid'],
                      },
                    );
                    setState(() {});
                  })),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
      ),
    );
  }
}
