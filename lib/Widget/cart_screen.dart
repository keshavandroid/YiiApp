import 'package:flutter/material.dart';

import '../common/CustomHeader.dart';
import '../const/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItemModel> cartItems = [
    CartItemModel(
      image: 'assets/images/tomato.png',
      name: 'Product Name',
      description: 'Lorem Ipsum is simply dummy text of the.',
      price: 10.0,
      quantity: 1,
    ),
    CartItemModel(
      image: 'assets/images/spinach.png',
      name: 'Product Name',
      description: 'Lorem Ipsum is simply dummy text of the.',
      price: 10.0,
      quantity: 1,
    ),
  ];

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: CustomHeader(title: 'Cart'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ...cartItems.map(
                      (item) =>
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: CartItemWidget(
                          item: item,
                          onQuantityChanged: (newQty) {
                            setState(() {
                              item.quantity = newQty;
                            });
                          },
                        ),
                      )
                  ,
                ),
                const SizedBox(height: 16),

                _summaryRow(
                  'Sub Total',
                  '\$${subtotal.toStringAsFixed(2)}',
                  isBold: true,
                  color: AppColors.greentextcolor,
                ),
                const SizedBox(height: 12),
                _summaryRow(
                  'Delivery',
                  'Free',
                  isBold: true,
                  color: AppColors.greentextcolor,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  margin: const EdgeInsets.only(left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blacktextcolor,
                        ),
                      ),

                      Text(
                        '\$${(subtotal + 50).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blacktextcolor,
                        ),
                      ),

                    ],
                  ),
                ),


                // _summaryRow(
                //   'Total',
                //   '\$${(subtotal + 50).toStringAsFixed(2)}',
                //   isBold: true,
                //   color: AppColors.blacktextcolor,
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E4412),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 55),
              ),
              onPressed: () {},
              child: const Text(
                'Proceed Checkout',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ]
        ,
      )
      ,
    );
  }

  Widget _summaryRow(String label,
      String value, {
        bool isBold = false,
        Color? color,
      }) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  final ValueChanged<int> onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Image.asset(item.image, width: 50, height: 50),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.greentextcolor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _circleButton(Icons.remove, () {
                    if (item.quantity > 1) {
                      onQuantityChanged(item.quantity - 1);
                    }
                  }),
                  const SizedBox(width: 6),
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.greytextcolor,
                    child: Text(
                      '${item.quantity}',
                      style: TextStyle(color: AppColors.blacktextcolor),
                    ),
                  ),
                  const SizedBox(width: 6),
                  _circleButton(Icons.add, () {
                    onQuantityChanged(item.quantity + 1);
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: const Color(0xFF2E4412),
      child: IconButton(
        icon: Icon(icon, size: 14, color: Colors.white),
        onPressed: onTap,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

class CartItemModel {
  final String image;
  final String name;
  final String description;
  final double price;
  int quantity;

  CartItemModel({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.quantity = 1,
  });
}
