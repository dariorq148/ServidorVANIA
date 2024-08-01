import 'package:flutter/material.dart';
import 'package:frontvania/Services/services.dart';
import '../Models/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  model? mod;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    obtenerCambios();
  }

  Future<void> obtenerCambios() async {
    mod = await Services().fetchData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : mod != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Title: ${mod!.title}'),
            Text('Description: ${mod!.description}'),
          ],
        )
            : Text('Failed to load data'),
      ),
    );
  }
}
