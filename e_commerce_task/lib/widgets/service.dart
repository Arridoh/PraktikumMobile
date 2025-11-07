import 'package:flutter/material.dart';
import '../screens/my_home_page.dart';

class Card3 extends StatelessWidget {
  final Service service;
  const Card3({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 200, 
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 140, 
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage(service.serviceImageUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(150),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 0, 
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(200),
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(service.providerImageUrl),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          service.providerName, 
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    service.serviceName,
                    style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 13, 106, 114)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: const Color.fromARGB(185, 251, 193, 45), size: 16),
                          const SizedBox(width: 4),
                          Text(
                            service.rating.toString(), // Data dinamis
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10), // Padding lebih kecil
                          backgroundColor: Color.fromARGB(150, 130, 240, 250),
                          foregroundColor: Colors.blue,
                          elevation: 0,
                          textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), // Teks lebih kecil
                        ),
                        child: const Text('Book Now'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}