import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Jual Barang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

enum ItemCondition { newCondition, usedCondition }

class _FormScreenState extends State<FormScreen> {
  TextEditingController itemNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  ItemCondition? itemCondition;
  bool? isLocalDelivery = false;
  bool? isReturnAccepted = false;

  @override
  void dispose() {
    itemNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void navigateToDetailScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          itemName: itemNameController.text,
          description: descriptionController.text,
          price: priceController.text,
          itemCondition: itemCondition,
          isLocalDelivery: isLocalDelivery ?? false,
          isReturnAccepted: isReturnAccepted ?? false,
          nim: '6701213099',
          name: 'Baskoro Pradito',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Jual Barang'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Barang',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: itemNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Deskripsi',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Harga',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Kondisi Barang',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Radio(
                    value: ItemCondition.newCondition,
                    groupValue: itemCondition,
                    onChanged: (value) {
                      setState(() {
                        itemCondition = value as ItemCondition?;
                      });
                    },
                  ),
                  Text('Baru'),
                  Radio(
                    value: ItemCondition.usedCondition,
                    groupValue: itemCondition,
                    onChanged: (value) {
                      setState(() {
                        itemCondition = value as ItemCondition?;
                      });
                    },
                  ),
                  Text('Bekas'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Pengiriman dalam kota saja',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isLocalDelivery,
                    onChanged: (value) {
                      setState(() {
                        isLocalDelivery = value;
                      });
                    },
                  ),
                  Text('Ya'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Menerima Retur',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isReturnAccepted,
                    onChanged: (value) {
                      setState(() {
                        isReturnAccepted = value;
                      });
                    },
                  ),
                  Text('Menerima retur'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: navigateToDetailScreen,
                child: Text('PUBLIKASIKAN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String itemName;
  final String description;
  final String price;
  final ItemCondition? itemCondition;
  final bool? isLocalDelivery;
  final bool? isReturnAccepted;
  final String nim;
  final String name;

  DetailScreen({
    required this.itemName,
    required this.description,
    required this.price,
    required this.itemCondition,
    required this.isLocalDelivery,
    required this.isReturnAccepted,
    required this.nim,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama barang: $itemName',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Deskripsi: $description',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Harga: $price',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Kondisi barang: ${getConditionText()}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Pengiriman dalam kota saja: ${isLocalDelivery ?? false ? 'Ya' : 'Tidak'}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Menerima retur: ${isReturnAccepted ?? false ? 'Ya' : 'Tidak'}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Dikerjakan oleh: $nim - $name',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  String getConditionText() {
    switch (itemCondition) {
      case ItemCondition.newCondition:
        return 'Baru';
      case ItemCondition.usedCondition:
        return 'Bekas';
      default:
        return '';
    }
  }
}