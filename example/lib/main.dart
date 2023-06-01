import 'package:br_validators/br_validators.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                bool isCpfValid = BRValidators.validateCPF(cpfController.text);
                print('Is CPF valid? $isCpfValid');

                bool isCnpjValid =
                    BRValidators.validateCNPJ(cnpjController.text);
                print('Is CNPJ valid? $isCnpjValid');
              },
              child: const Text('Validate Documents'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: cpfController,
              decoration: InputDecoration(
                labelText: 'CPF',
              ),
              inputFormatters: [BRMasks.cpf],
            ),
            TextFormField(
              controller: cnpjController,
              decoration: InputDecoration(
                labelText: 'CNPJ',
              ),
              inputFormatters: [BRMasks.cnpj],
            ),
          ],
        ),
      ),
    );
  }
}
