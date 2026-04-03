import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const Color primaryGreen = Color(0xFF2EB97C);
  static const Color bgColor = Color(0xFFF3F6F3);
  static const Color dangerRed = Color(0xFFD32F2F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _header(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _alertCard(),
                    const SizedBox(height: 16),
                    _dangerCard(),
                    const SizedBox(height: 16),

                    /// 🔥 MAP CARD
                    _mapCard(),

                    const SizedBox(height: 16),

                    /// 🔥 COOL SPOTS LIST
                    _coolSpots(),

                    const SizedBox(height: 16),

                    /// 🔥 WEATHER + HYDRATION
                    Row(
                      children: [
                        Expanded(child: _weatherCard()),
                        const SizedBox(width: 12),
                        Expanded(child: _hydrationCard()),
                      ],
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),

            _bottomNav(),
          ],
        ),
      ),
    );
  }

  /// ================= HEADER =================
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.ac_unit, color: Colors.white),
          ),
          const SizedBox(width: 10),
          const Text(
            "GIGCHILL",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.person, size: 16),
                SizedBox(width: 6),
                Text("Alex K."),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// ================= ALERT =================
  Widget _alertCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.orange.withOpacity(0.4)),
      ),
      child: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Extreme Heat Advisory\nHeat index exceeds safe threshold.",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= DANGER =================
  Widget _dangerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("REAL-TIME HEAT RISK", style: TextStyle(fontSize: 12)),
          const SizedBox(height: 6),
          const Text(
            "DANGER ZONE",
            style: TextStyle(
                color: Colors.red, fontSize: 26, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: dangerRed),
                  onPressed: () {},
                  child: const Text("SOS Alert"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Cool Spot"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// ================= MAP =================
  Widget _mapCard() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text("MAP VIEW (Park / Cafe / Shelter)"),
      ),
    );
  }

  /// ================= COOL SPOTS =================
  Widget _coolSpots() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("YOUR COOL SPOTS",
                style: TextStyle(fontWeight: FontWeight.w700)),
            Text("See All", style: TextStyle(color: primaryGreen)),
          ],
        ),
        const SizedBox(height: 10),

        _coolItem("Green Park Shelter", "0.5 km", "28°"),
        _coolItem("Cool Brew Café", "0.8 km", "22°"),
        _coolItem("City Cool Shelter", "1.2 km", "19°"),
      ],
    );
  }

  Widget _coolItem(String name, String distance, String temp) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const Icon(Icons.place, color: primaryGreen),
          const SizedBox(width: 10),
          Expanded(
            child: Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ),
          Text(temp,
              style:
                  const TextStyle(color: primaryGreen, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  /// ================= WEATHER =================
  Widget _weatherCard() {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("WEATHER"),
          SizedBox(height: 10),
          Text("41°C",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Text("Hazy Sunshine"),
        ],
      ),
    );
  }

  /// ================= HYDRATION =================
  Widget _hydrationCard() {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("HYDRATION"),
          const SizedBox(height: 10),
          const Text("4/8",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: primaryGreen)),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryGreen,
            ),
            onPressed: () {},
            child: const Text("+ Log Water"),
          )
        ],
      ),
    );
  }

  /// ================= NAV =================
  Widget _bottomNav() {
    return BottomNavigationBar(
      selectedItemColor: primaryGreen,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Alerts"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}