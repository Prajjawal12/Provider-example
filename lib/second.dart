import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/list_provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});
  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            value.add();
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
                value.numbers.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 200,
                width: double.maxFinite,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.numbers.length,
                    itemBuilder: (context, index) {
                      return Text(
                        value.numbers[index].toString(),
                        style: const TextStyle(fontSize: 30),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
