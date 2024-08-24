import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherShimmer extends StatelessWidget {
  const WeatherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Shimmer effect for the city name
          Container(
            width: 150,
            height: 30,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          // Shimmer effect for the temperature
          Container(
            width: 200,
            height: 60,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          // Shimmer effect for the weather description
          Container(
            width: 120,
            height: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          // Shimmer effect for the weather icon
          Container(
            width: 100,
            height: 100,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          // Shimmer effect for detailed weather information
          _buildDetailShimmer(context),
          _buildDetailShimmer(context),
          _buildDetailShimmer(context),
          _buildDetailShimmer(context),
        ],
      ),
    );
  }

  Widget _buildDetailShimmer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 40,
      color: Colors.white,
    );
  }
}
