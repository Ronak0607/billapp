import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController txtproduct = TextEditingController();
  TextEditingController txtQty = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtDis = TextEditingController();
  List product = [];

  int last = 0;


  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Customer page"),
        centerTitle: true,
        backgroundColor: Color(0xFF323232),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Enter Your Name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Contect No.'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Payment Stust'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'Address'),
            ),
            SizedBox(
              height: 25,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Product Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txtproduct,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Product'),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: txtQty,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Qty.'),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: txtprice,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'price'),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: txtDis,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Disscount'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                shadowColor: Colors.black,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(200, 40),
              ),
              onPressed: () {
                Product pro = Product(
                    product: txtproduct.text,
                    dic: txtDis.text,
                    price: txtprice.text,
                    qty: txtQty.text);
                setState(() {
                  product.add(pro);
                });
                Total();
              },
              child: Text("Add"),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFE3E3E3),
                  ),
                  child: ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "${product[index].product}",
                        ),
                        leading: Text(
                          "${product[index].qty}",
                        ),
                        subtitle: Text(
                          "${product[index].price}",
                        ),
                        trailing: Text(
                          "${product[index].dic}",
                        ),
                      );
                    },
                  )),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF323232),

              ),
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text("Total Amount  : ${last}",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    ));
  }
  void Total()
  {
    int Amount = 0;
    int Disc = 0;

    for(int i=0;i<product.length;i++)
      {
        Amount = (int.parse(product[i].price) *  int.parse(product[i].qty)) + Amount;
        Disc = int.parse(product[i].dic) + Disc;
      }
  setState((){
    last = Amount - Disc;
  });
  }

}

class Product {
  String? product, qty, price, dic;

  Product({this.product, this.qty, this.price, this.dic});
}
