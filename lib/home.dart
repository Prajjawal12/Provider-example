import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/list_provider.dart';
import 'package:provider_tutorial/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, NumbersProviderModel, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            NumbersProviderModel.add();
          },
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.add,
          ),
        ),
        body: SizedBox(
          child: Column(
            children: [
              Text(
                NumbersProviderModel.numbers.last.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: NumbersProviderModel.numbers.length,
                      itemBuilder: (context, index) {
                        return Text(
                          NumbersProviderModel.numbers[index].toString(),
                          style: const TextStyle(fontSize: 30),
                        );
                      })),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Second(),
                      ),
                    );
                  },
                  child: const Text(
                    'Second',
                    style: TextStyle(backgroundColor: Colors.amber),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
