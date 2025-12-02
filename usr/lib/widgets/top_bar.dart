import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          // User Profile
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF107C10), width: 2),
            ),
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage('https://ui-avatars.com/api/?name=User&background=random'),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "PlayerOne",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          // Status Icons
          const Icon(Icons.wifi, color: Colors.white70, size: 20),
          const SizedBox(width: 15),
          const Icon(Icons.battery_full, color: Colors.white70, size: 20),
          const SizedBox(width: 15),
          Text(
            _getCurrentTime(),
            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }
}
