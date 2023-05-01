import 'package:flutter/material.dart';
class SavedShortListed extends StatefulWidget {
   SavedShortListed({Key? key,}) : super(key: key);

  @override
  State<SavedShortListed> createState() => _SavedShortListedState();
}

class _SavedShortListedState extends State<SavedShortListed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Saved"),),
    );
  }
}
