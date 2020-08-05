import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var isSameAddress = true;

  // For the sake of simplicity, Form widget, _formkey, and textController
  // has been removed

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Shipping address 1',
              hintText: 'Number and street',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Shipping address 2',
              hintText: '(optional) APT number, c/o',
            ),
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("Billing address same as shipping address"),
            value: isSameAddress,
            onChanged: (bool newValue) {
              setState(() {
                isSameAddress = newValue;
              });
            },
          ),
          if (!isSameAddress)
            Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Billing address 1',
                    hintText: 'Number and street',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Billing address 2',
                    hintText: '(optional) APT number, c/o',
                  ),
                ),
              ],
            ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Credit Card #',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'CCV',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Contact Phone Number',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Delivery instruction',
              hintText: 'how to find the address, delivery at frontdoor, etc',
            ),
          ),
        ],
      );
}
