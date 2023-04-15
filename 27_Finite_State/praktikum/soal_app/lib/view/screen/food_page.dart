import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_app/viewmodel/provider/food_provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FoodProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Food List"),
        ),
        body: Consumer<FoodProvider>(
          builder: (context, provider, child) {
            if (provider.foods.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: provider.foods.length,
              itemBuilder: (context, index) {
                final food = provider.foods[index];
                return ListTile(
                  title: Text(food.name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
