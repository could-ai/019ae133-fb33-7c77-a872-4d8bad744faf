import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/xbox_tile.dart';

class DashboardGrid extends StatelessWidget {
  final int selectedIndex;

  const DashboardGrid({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == 1) {
      return _buildMyGames(context);
    }
    
    // Default Home View
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero Section (Last played game)
        SizedBox(
          height: 250,
          width: double.infinity,
          child: XboxTile(
            title: "Halo Infinite",
            imageColor: Colors.blueGrey,
            isHero: true,
            icon: Icons.gamepad,
            imageUrl: "https://picsum.photos/800/400?random=1",
          ),
        ),
        const SizedBox(height: 30),
        
        // "Jump back in" Row
        const Text(
          "Jump back in",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              XboxTile(title: "Forza Horizon 5", color: Colors.orange, imageUrl: "https://picsum.photos/200/200?random=2"),
              const SizedBox(width: 15),
              XboxTile(title: "Minecraft", color: Colors.green, imageUrl: "https://picsum.photos/200/200?random=3"),
              const SizedBox(width: 15),
              XboxTile(title: "Starfield", color: Colors.indigo, imageUrl: "https://picsum.photos/200/200?random=4"),
              const SizedBox(width: 15),
              XboxTile(title: "Netflix", color: Colors.red, icon: Icons.movie),
              const SizedBox(width: 15),
              XboxTile(title: "Spotify", color: Colors.greenAccent, icon: Icons.music_note),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // "Store & Deals" Row
        const Text(
          "Store & Deals",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 180,
                child: XboxTile(
                  title: "Game Pass",
                  subtitle: "Discover your next favorite game",
                  color: const Color(0xFF107C10),
                  icon: Icons.card_membership,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 180,
                child: XboxTile(
                  title: "Store",
                  subtitle: "Deals up to 50% off",
                  color: Colors.deepOrange,
                  icon: Icons.local_offer,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 180,
                child: XboxTile(
                  title: "Community",
                  subtitle: "See what friends are playing",
                  color: Colors.blue,
                  icon: Icons.people,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMyGames(BuildContext context) {
    // Grid of all installed "apps"
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "My Games & Apps",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 1.0,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return XboxTile(
              title: "Game ${index + 1}",
              color: Colors.primaries[index % Colors.primaries.length],
              icon: Icons.videogame_asset,
            );
          },
        ),
      ],
    );
  }
}
