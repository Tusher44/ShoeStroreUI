import 'package:flutter/material.dart';

void main() {
  runApp(const ShoeStoreApp());
}

class ShoeStoreApp extends StatelessWidget {
  const ShoeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showAllCategories = false;
  bool showAllProducts = false;

  // Categories List
  List<String> categoryNames = [
    "Sneakers",
    "Running",
    "Casual",
    "Boots",
    "Sandals",
    "Formal",
    "Trainers",
    "Loafers"
  ];
  List<String> categoryImages = [
    "assets/Sneakers.png",
    "assets/Running.png",
    "assets/Casual.png",
    "assets/Boot.png",
    "assets/Sandals.png",
    "assets/Formal.png",
    "assets/Trainers.png",
    "assets/Loafers.png"
  ];

  // Product List
  List<String> productNames = [
    "Nike Air",
    "Adidas UltraBoost",
    "Puma Sport",
    "Reebok Classic",
    "Under Armour",
    "New Balance",
    "Under Armour 2.0",
    "New Balance Vintage"
  ];
  List<int> productPrices = [2500, 2200, 1800, 1500, 2700, 2000, 2500, 2150];
  List<double> productRatings = [3.9, 4.5, 4.2, 4.0, 4.6, 4.3, 4.6, 4.4];
  List<String> productImages = [
    "assets/shoe.png",
    "assets/Adidas.png",
    "assets/Puma.png",
    "assets/Reebok.png",
    "assets/UnderArmour.png",
    "assets/Newbalance.png",
    "assets/Running.png",
    "assets/NewBalance2.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: const Color.fromARGB(82, 249, 247, 247),
                  ),
                ),
                const SizedBox(width: 5),
                const Text('Home',
                    style: TextStyle(color: Colors.black, fontSize: 12))
              ],
            ),
            const Row(
              children: [
                Text('Customer Name',
                    style: TextStyle(color: Colors.black, fontSize: 12)),
                SizedBox(width: 8), // Space between text and avatar
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 15,
                  child: Icon(Icons.person, color: Colors.white, size: 16),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Category',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showAllCategories = !showAllCategories;
                      });
                    },
                    child: Text(
                      showAllCategories ? 'Show Less' : 'View all',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: showAllCategories ? categoryNames.length : 5,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          categoryImages[index],
                          height: 19, // Adjust image size
                        ),
                        const SizedBox(height: 5),
                        Text(
                          categoryNames[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Popular Products Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular Products',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showAllProducts = !showAllProducts;
                      });
                    },
                    child: Text(
                      showAllProducts ? 'Show Less' : 'View all',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: showAllProducts ? productNames.length : 4,
                itemBuilder: (context, index) => ProductCard(
                  name: productNames[index],
                  price: productPrices[index],
                  rating: productRatings[index],
                  imagePath: productImages[index],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final double rating;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(rating.toString()),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${price.toString()}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
