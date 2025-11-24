// lib/pages/homepage.dart
import 'package:flutter/material.dart';
import '../theme/themecolors.dart';
import '../widgets/navbar.dart';
import '../widgets/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 1. Navigation Bar (Stays on top)
            const NavBar(),

            // 2. Hero Section (The main image/banner and primary message)
            const HeroSection(),

            // 3. Key Services Overview (e.g., Doctors, Departments, Emergency)
            const ServicesOverviewSection(),

            // 4. Footer (for contact info, map, links—you can create a separate widget for this later)
            Container(
              height: 200,
              color: ThemeColors
                  .secondary, // Use a distinguishing color for the footer
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
        // Text and Call-to-Action (Left Side)
        const Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome to Serenity Hospital",
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
          "Welcome to Serenity Hospital",
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

// Example Widget for key information section (remains unchanged)
class ServicesOverviewSection extends StatelessWidget {
  const ServicesOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: <Widget>[
          const Text(
            "Our Key Services",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: ThemeColors.textDark,
            ),
          ),
          const SizedBox(height: 40),
          // Use GridView or Wrap for a responsive set of cards
          Responsive(
            // Make the services grid responsive too
            desktop: _ServiceGridDesktop(),
            mobile: _ServiceGridMobile(),
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 60, color: color),
            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

// Widgets for responsive service grid
class _ServiceGridDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // 3 columns on desktop
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
      childAspectRatio: 1.5,
      children: <Widget>[
        const ServicesOverviewSection()._serviceCard(
          'Emergency Care',
          Icons.local_hospital_outlined,
          ThemeColors.accent,
        ),
        const ServicesOverviewSection()._serviceCard(
          'Find a Specialist',
          Icons.person_search_outlined,
          ThemeColors.secondary,
        ),
        const ServicesOverviewSection()._serviceCard(
          'Request a Test',
          Icons.science_outlined,
          ThemeColors.accent,
        ),
      ],
    );
  }
}

class _ServiceGridMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1, // 1 column on mobile
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2.5, // Taller cards for mobile
      children: <Widget>[
        const ServicesOverviewSection()._serviceCard(
          'Emergency Care',
          Icons.local_hospital_outlined,
          ThemeColors.accent,
        ),
        const ServicesOverviewSection()._serviceCard(
          'Find a Specialist',
          Icons.person_search_outlined,
          ThemeColors.secondary,
        ),
        const ServicesOverviewSection()._serviceCard(
          'Request a Test',
          Icons.science_outlined,
          ThemeColors.accent,
        ),
      ],
    );
  }
}
