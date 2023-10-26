import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/bg.jpg"), // Ganti dengan path ke gambar latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Selamat datang di Dashboard",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              DashboardIconsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    'assets/download.png'), // Ganti dengan path ke gambar profil
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Nama: Irfan Maiyola",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "NPM: 21670100",
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              "Kelas: 5A",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DashboardIconsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: <Widget>[
        DashboardIcon(
          icon: Icons.person,
          label: "Profil", // Tambahkan label sesuai ikon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
        DashboardIcon(
          icon: Icons.favorite,
          label: "Favorit", // Tambahkan label sesuai ikon
        ),
        DashboardIcon(
          icon: Icons.email,
          label: "Email", // Tambahkan label sesuai ikon
        ),
        DashboardIcon(
          icon: Icons.camera,
          label: "Kamera", // Tambahkan label sesuai ikon
        ),
        DashboardIcon(
          icon: Icons.music_note,
          label: "Musik", // Tambahkan label sesuai ikon
        ),
        DashboardIcon(
          icon: Icons.settings,
          label: "Pengaturan", // Tambahkan label sesuai ikon
        ),
      ],
    );
  }
}

class DashboardIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color iconColor;

  DashboardIcon({
    required this.icon,
    required this.label,
    this.onPressed = _dummyOnPressed,
    this.iconColor = Colors.blue,
  });

  static void _dummyOnPressed() {
    print("Tombol belum dikonfigurasi.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color for the container
        borderRadius: BorderRadius.circular(6), // Optional: Add border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: iconColor,
            ),
            iconSize: 50,
            onPressed: onPressed,
          ),

          SizedBox(height: 10), // Adjust the spacing as needed
          Text(
            label,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
