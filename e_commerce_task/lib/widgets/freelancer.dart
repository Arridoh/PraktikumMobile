import 'package:flutter/material.dart';
import '../screens/my_home_page.dart';

class Card2 extends StatelessWidget {
  final Freelancer freelancer; // Menerima data
  const Card2({super.key, required this.freelancer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:110,
      margin: const EdgeInsets.only(
        top: 8, 
        bottom: 8,
        left: 4,
        right: 4,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(200),
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(freelancer.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 55,
              margin: const EdgeInsets.only(top: 70),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                freelancer.name, // Data dinamis
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1, 
                overflow: TextOverflow.ellipsis,
                ),
                Text(
                freelancer.job,
                style: const TextStyle(fontSize: 10, color: Color.fromARGB(255, 0, 0, 0)),
                maxLines: 1, 
                overflow: TextOverflow.ellipsis, 
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: const Color.fromARGB(176, 251, 193, 45), size: 12),
                    const SizedBox(width: 4),
                    Text(
                      freelancer.rating.toString(),
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ]
                ),
              ],
              ),
            )
          ),
        ]
      ),
    );
  }
}