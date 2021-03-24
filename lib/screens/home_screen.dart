import 'package:flutter/material.dart';
import 'package:pricecompare/models/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = [
    Product(
      quantiy: 0,
      price: 0,
      color: Colors.accents[0],
      name: '',
    ),
    Product(
      quantiy: 0,
      price: 0,
      color: Colors.accents[1],
      name: '',
    )
  ];

  bool _calculated = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Price Compare'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          final product = _products[index];
                          return ListTile(
                            tileColor: product.color,
                            leading: SizedBox(
                              width: width * 0.33,
                              child: TextField(
                                onChanged: (value) {
                                  _products[index] =
                                      _products[index].copyWith(name: value);
                                  _calculated = false;
                                  setState(() {});
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  prefix: Text('Name: '),
                                  hintText: 'Name',
                                  hintStyle: TextStyle(color: Colors.grey[200]),
                                ),
                              ),
                            ),
                            title: SizedBox(
                              width: width * 0.33,
                              child: TextField(
                                onChanged: (value) {
                                  _products[index] = _products[index].copyWith(
                                    quantiy: double.parse(value),
                                  );
                                  _calculated = false;
                                  setState(() {});
                                },
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefix: Text('Qty: '),
                                  hintText: 'Quantity',
                                  hintStyle: TextStyle(color: Colors.grey[200]),
                                ),
                              ),
                            ),
                            trailing: SizedBox(
                              width: width * 0.33,
                              child: TextField(
                                onChanged: (value) {
                                  _products[index] = _products[index].copyWith(
                                    price: double.parse(value),
                                  );
                                  _calculated = false;
                                  setState(() {});
                                },
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefix: Text('Rs: '),
                                  hintText: 'Price',
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        _products.removeAt(index);
                                        _calculated = false;
                                        setState(() {});
                                      }),
                                  hintStyle: TextStyle(color: Colors.grey[200]),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: _products.length < 7
                              ? () {
                                  _products.add(
                                    Product(
                                        quantiy: 0,
                                        price: 0,
                                        color: Colors.accents[_products.length],
                                        name: ''),
                                  );
                                  _calculated = false;
                                  setState(() {});
                                }
                              : null,
                          child: Text('Add Product'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent,
                          ),
                          onPressed: _calculated
                              ? null
                              : () {
                                  setState(() {
                                    _calculated = true;
                                  });
                                },
                          child: Text(
                            'Compare Price',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 1),
            Text(
              'Price for Single Unit',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(thickness: 1),
            Expanded(
              flex: 4,
              child: _calculated
                  ? ListView.builder(
                      itemCount: _products.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        return ListTile(
                          leading: Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          tileColor: product.color,
                          trailing: Text(
                            'Rs: ${(product.price / product.quantiy).toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Add products and press Compare Price',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
