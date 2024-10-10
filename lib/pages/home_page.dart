import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Sugar',
        price: 5000,
        imageURL:
            'https://static.toiimg.com/thumb/msid-108469108,imgsize-101770,width-400,resizemode-4/108469108.jpg',
        rating: 4,
        stok: 10),
    Item(
        name: 'Salt',
        price: 2000,
        imageURL:
            'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-560w,f_auto,q_auto:best/streams/2014/May/140501/2D274905752907-surprising-uses-for-salt.jpg',
        rating: 4.3,
        stok: 15),
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App '),
        backgroundColor: const Color.fromARGB(255, 14, 138, 200),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3 / 2, 
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/item', arguments: item);
                    },
                    child: GridTile(
                      footer: Container(
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name ?? 'Unknown',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Price: Rp. ${item.price}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Stock: ${item.stok}',
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: List.generate(5, (i) {
                                  return Icon(
                                    i < item.rating.round()
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 16.0,
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      child: Image.network(
                        item.imageURL ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 50, // adjust the height as needed
            color: Colors.grey, // adjust the color as needed
            child: const Center(
              child: Text('Halur Muhammad Abiyyu / 2141720072'),
            ),
          ),
        ],
      ),
    );
  }
}