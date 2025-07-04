import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Types Demo',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

var naam = ['Jamie', 'Cersei', 'Arya', 'Stark', 'Mountain'];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Types'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Basic"),
              Tab(text: "Builder"),
              Tab(text: "Separated"),
              Tab(text: "Custom"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BasicListView(),
            BuilderListView(),
            SeparatedListView(),
            CustomListViewExample(),
          ],
        ),
      ),
    );
  }
}

// 1. ListView (basic)
class BasicListView extends StatelessWidget {
  const BasicListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        naam.length,
            (index) => ListTile(
          leading: Text('${index + 1}'),
          title: Text(naam[index]),
          subtitle: Text('+92322481728$index'),
          trailing: const Icon(Icons.call),
        ),
      ),
    );
  }
}

// 2. ListView.builder
class BuilderListView extends StatelessWidget {
  const BuilderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: naam.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text(naam[index]),
          subtitle: Text('Tap to call'),
          trailing: const Icon(Icons.phone),
        );
      },
    );
  }
}

// 3. ListView.separated
class SeparatedListView extends StatelessWidget {
  const SeparatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: naam.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.person),
          title: Text(naam[index]),
          subtitle: Text('Phone: +92322481728$index'),
          trailing: const Icon(Icons.add),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 20,
        color: Colors.grey,
      ),
    );
  }
}

// 4. ListView.custom
class CustomListViewExample extends StatelessWidget {
  const CustomListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.star),
              title: Text(naam[index]),
              subtitle: Text('Custom item #$index'),
              trailing: const Icon(Icons.arrow_forward),
            ),
          );
        },
        childCount: naam.length,
      ),
    );
  }
}
