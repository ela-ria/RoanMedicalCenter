// lib/pages/patientportaldashboard.dart
import 'package:flutter/material.dart';
import '../theme/themecolors.dart';
import '../widgets/portalnavbar.dart';
import '../widgets/responsive.dart';
import 'laboratoryresultpage.dart';
import 'appointmentpage.dart';

class PatientDashboard extends StatelessWidget {
  const PatientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Patient Portal Navbar
            const PortalNavBar(),
            // 2. Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 50),
              color: ThemeColors.secondary.withOpacity(0.1),
              child: const Center(
                child: Text(
                  "Patient Portal",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.textDark,
                  ),
                ),
              ),
            ),

            // 3. Dashboard Cards Section
            Padding(
              padding: const EdgeInsets.all(40),
              child: Responsive(
                desktop: _DashboardCardsDesktop(),
                mobile: _DashboardCardsMobile(),
              ),
            ),

            // 4. Footer
            Container(
              height: 150,
              color: ThemeColors.secondary,
              child: const Center(
                child: Text(
                  "Footer Content - Contact Info, Social Media, etc.",
                  style: TextStyle(color: ThemeColors.textLight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example Widget for the main banner/hero
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // You might make this height responsive later
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/hero.jpg'),
          fit: BoxFit.cover,
          // You can add colorFilter here to darken/lighten the image if text is hard to read
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.1), // Darken the image by 40%
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Responsive(
                // <-- Using Responsive widget here
                desktop: _HeroContentDesktop(),
                mobile: _HeroContentMobile(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Separate widget for Hero Section content for desktop
class _HeroContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome to Roan Medical Center",
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w900,
                  color: ThemeColors.textLight,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Your trusted partner in health and wellness. Experience compassionate care and world-class expertise right here.",
                style: TextStyle(fontSize: 20, color: ThemeColors.textLight),
              ),

              SizedBox(height: 40),

              // Button for something
              ElevatedButton(
                onPressed: null, // Placeholder action
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    ThemeColors.accentDark,
                  ),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                child: Text(
                  "Find a Doctor",
                  style: TextStyle(fontSize: 20, color: ThemeColors.textLight),
                ),
              ),
            ],
          ),
        ),
        // Removed the placeholder image on the right as it's now a background
        // const SizedBox(width: 40),
        // Expanded(
        //   child: Placeholder(
        //     fallbackHeight: 500,
        //     color: ThemeColors.secondary.withOpacity(0.5),
        //   ),
        // )
      ],
    );
  }
}

// Separate widget for Hero Section content for mobile
class _HeroContentMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // Center text for mobile
      children: <Widget>[
        // Title heading
        const Text(
          "Welcome to Roan Medical Center",
          textAlign: TextAlign.center, // Center text on mobile
          style: TextStyle(
            fontSize: 40, // Smaller font size for mobile
            fontWeight: FontWeight.w900,
            color: ThemeColors.textLight,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 15),
        // Subtitle / subheading
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Your trusted partner in health and wellness. Experience compassionate care and world-class expertise right here.",
            textAlign: TextAlign.center, // Center text on mobile
            style: TextStyle(
              fontSize: 16, // Smaller font size for mobile
              color: ThemeColors.textLight,
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Button
        ElevatedButton(
          onPressed: null, // Placeholder action
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(ThemeColors.accent),
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          child: const Text(
            "Find a Doctor",
            style: TextStyle(
              fontSize: 18,
              color: ThemeColors.textLight,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

// Dashboard card widget
class _DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(30),
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: ThemeColors.accent),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Desktop layout: cards side by side
class _DashboardCardsDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _DashboardCard(
          title: "Laboratory Results",
          icon: Icons.science_outlined,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LaboratoryResultPage(),
              ),
            );
          },
        ),
        _DashboardCard(
          title: "Appointments",
          icon: Icons.calendar_today_outlined,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppointmentPage()),
            );
          },
        ),
      ],
    );
  }
}

// Mobile layout: cards stacked
class _DashboardCardsMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DashboardCard(
          title: "Laboratory Results",
          icon: Icons.science_outlined,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LaboratoryResultPage(),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        _DashboardCard(
          title: "Appointments",
          icon: Icons.calendar_today_outlined,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppointmentPage()),
            );
          },
        ),
      ],
    );
  }
}
