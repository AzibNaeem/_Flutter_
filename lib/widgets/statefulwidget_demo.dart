import 'package:flutter/material.dart';




class LikeVehicleCard extends StatefulWidget {
  const LikeVehicleCard({super.key});

  @override
  State<LikeVehicleCard> createState() => _LikeVehicleCardState();
}

class _LikeVehicleCardState extends State<LikeVehicleCard> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Like Button Demo')),
      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Suzuki Hayabusa',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text('Likes: $likeCount'),
                const SizedBox(height: 20),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      likeCount += isLiked ? 1 : -1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
