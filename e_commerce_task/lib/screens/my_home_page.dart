import 'package:bab_3/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/freelancer.dart';
import '../widgets/service.dart'; 
import '../widgets/topdeal.dart';
import '../widgets/workshop.dart';
import '../widgets/booking.dart';
import '../widgets/header.dart';
import '../widgets/deal.dart';

class Freelancer {
  final String name;
  final String job;
  final String imageUrl; 
  final double rating;

  Freelancer({
    required this.name,
    required this.job,
    required this.imageUrl,
    required this.rating,
  });
}

class Service {
  final String serviceName;
  final String providerName;
  final String providerImageUrl;
  final String serviceImageUrl;
  final double rating;

  Service({
    required this.serviceName,
    required this.providerName,
    required this.providerImageUrl,
    required this.serviceImageUrl,
    required this.rating,
  });
}

class Workshop {
  final String title;
  final String category;
  final String imageUrl;
  final double rating;

  Workshop({
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });
}

class Booking {
  final String title;
  final String providerName;
  final String imageUrl;
  final double rating;

  Booking({
    required this.title,
    required this.providerName,
    required this.imageUrl,
    required this.rating,
  });
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Freelancer> topFreelancers = [
    Freelancer(
        name: 'Wade Warren',
        job: 'Beautician',
        imageUrl: 'assets/images/craftman.jpg',
        rating: 4.9),
    Freelancer(
        name: 'Jane Cooper',
        job: 'Stylist',
        imageUrl: 'assets/images/craftman.jpg',
        rating: 4.8),
    Freelancer(
        name: 'Robert Fox',
        job: 'Masseuse',
        imageUrl: 'assets/images/craftman.jpg',
        rating: 4.9),
    Freelancer(
        name: 'Esther Howard',
        job: 'Therapist',
        imageUrl: 'assets/images/craftman.jpg',
        rating: 4.7),
  ];

  final List<Service> topServices =  [
    Service(
      serviceName: 'Luxury Manicure',
      providerName: 'Miss Zachary Will',
      providerImageUrl: 'assets/images/craftman.jpg',
      serviceImageUrl: 'assets/images/ModelGokuv2.jpg',
      rating: 4.9,
    ),
    Service(
      serviceName: 'Luxury Manicure',
      providerName: 'Miss Zachary Will',
      providerImageUrl: 'assets/images/craftman.jpg',
      serviceImageUrl: 'assets/images/ModelGokuv2.jpg',
      rating: 4.9,
    ),
    Service(
      serviceName: 'Luxury Manicure',
      providerName: 'Miss Zachary Will',
      providerImageUrl: 'assets/images/craftman.jpg',
      serviceImageUrl: 'assets/images/ModelGokuv2.jpg',
      rating: 4.9,
    ),
  ];

  final List<Booking> bestBookings =  [
    Booking(
      title: 'Optimus Prime',
      providerName: 'Paramount Pictures',
      imageUrl: 'assets/images/OptimusPrime.jpg',
      rating: 4.9,
    ),
    Booking(
      title: 'Groot',
      providerName: 'Marvel Studio\'s',
      imageUrl: 'assets/images/GrootStand.jpg',
      rating: 5.0,
    ),
  ];

  final List<Workshop> recommendedWorkshops =  [
    Workshop(
      title: 'Air Plane',
      category: 'Flight Attendant',
      imageUrl: 'assets/images/airplaneS.jpg',
      rating: 4.9,
    ),
    Workshop(
      title: 'Relaxing',
      category: 'Sleep Therapy',
      imageUrl: 'assets/images/GokuTdr.jpg',
      rating: 4.8,
    ),
    Workshop(
      title: 'Cat therapy',
      category: 'Kitty Care',
      imageUrl: 'assets/images/kucingAnime.jpg',
      rating: 4.9,
    ),
    Workshop(
      title: 'Spidey',
      category: 'Stylist',
      imageUrl: 'assets/images/SpidyGantung.jpg',
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('E-Commers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined), 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),

            Card1(),

            // --- Top Rated Freelances ---
            const Header(title: 'Top Rated Freelances'),
            const SizedBox(height: 10),
            _buildTopFreelancesList(),

            // --- Top Services ---
            const Header(title: 'Top Services'),
            const SizedBox(height: 8),
            _buildTopServicesList(), // Diubah menjadi method

            // --- Best Bookings ---
            const Header(title: 'Best Bookings'),
            const SizedBox(height: 8),
            Card4(),
            const SizedBox(height: 8),
            _buildBestBookingsList(),

            // --- Recommended Workshops ---
            const Header(title: 'Recommended'),
            const SizedBox(height: 8),
            _buildWorkshopsGrid(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget private untuk Search Bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(270),
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(270),
                  spreadRadius: 1,
                  blurRadius: 5,
                )
              ],
            ),
            child: const Icon(Icons.tune, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Widget private untuk List Horizontal Freelancer
  Widget _buildTopFreelancesList() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(210),
            spreadRadius: 1,
            blurRadius: 5,
          )
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: topFreelancers.length, // Menggunakan data
        itemBuilder: (context, index) {
          // Mengirim data ke Card2
          return Card2(freelancer: topFreelancers[index]);
        },
      ),
    );
  }

  // Widget private untuk List Vertikal Services
  Widget _buildTopServicesList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: topServices.length,
      itemBuilder: (context, index) {
        // Mengirim data ke Card3
        return Card3(service: topServices[index]);
      },
    );
  }

  // Widget private untuk List Vertikal Best Bookings (BARU)
  Widget _buildBestBookingsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bestBookings.length,
      itemBuilder: (context, index) {
        // Mengirim data ke Card6
        return Card6(booking: bestBookings[index]);
      },
    );
  }

  // Widget private untuk Grid Workshops
  Widget _buildWorkshopsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 280,
        // childAspectRatio: 0.8, // Sesuaikan rasio ini jika perlu
      ),
      itemCount: recommendedWorkshops.length, // Menggunakan data
      itemBuilder: (context, index) {
        // Mengirim data ke Card5
        return Card5(workshop: recommendedWorkshops[index]);
      },
    );
  }
}