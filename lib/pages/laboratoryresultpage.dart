// lib/pages/laboratory_result_page.dart
import 'package:flutter/material.dart';
import '../theme/themecolors.dart';
import '../widgets/portalnavbar.dart';
import '../widgets/responsive.dart';

class LaboratoryResultPage extends StatelessWidget {
  const LaboratoryResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 1. Navigation Bar
            const PortalNavBar(),

            // 2. Hero Section
            const HeroSection(),

            // 3. Laboratory Results Section
            const LaboratoryResultsSection(),

            // 4. Footer
            Container(
              height: 200,
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

// Hero Section
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/hero.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Responsive(
            desktop: _HeroContentDesktop(),
            mobile: _HeroContentMobile(),
          ),
        ),
      ),
    );
  }
}

class _HeroContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Laboratory Results",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: ThemeColors.textLight,
                  height: 1.1,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Check your latest laboratory tests and health records here.",
                style: TextStyle(fontSize: 20, color: ThemeColors.textLight),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeroContentMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "Laboratory Results",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: ThemeColors.textLight,
            height: 1.1,
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Check your latest laboratory tests and health records here.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: ThemeColors.textLight),
          ),
        ),
      ],
    );
  }
}

// Laboratory Results Section
class LaboratoryResultsSection extends StatelessWidget {
  const LaboratoryResultsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: <Widget>[
          const Text(
            "Laboratory Results",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: ThemeColors.textDark,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Here are your latest laboratory results.",
            style: TextStyle(fontSize: 20, color: ThemeColors.secondary),
          ),
          const SizedBox(height: 40),

          // Responsive Tables
          Responsive(desktop: _TablesDesktop(), mobile: _TablesMobile()),
        ],
      ),
    );
  }
}

// Helper function to create table with dynamic content
Widget labTable(String title, List<List<String>> rowsData, String Date) {
  return Card(
    elevation: 3,
    color: ThemeColors.accentDark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: ThemeColors.textDark,
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text("TEST")),
                DataColumn(label: Text("RESULT")),
                DataColumn(label: Text("NORMAL VALUE")),
              ],
              rows: rowsData
                  .map(
                    (row) => DataRow(
                      cells: row.map((cell) => DataCell(Text(cell))).toList(),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    ),
  );
}

class _TablesDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600), // max width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            labTable("HEMATOLOGY", [
              ["Hemoglobin", "116", "M:137-175 F:112-157"],
              ["Hematocrit", "0.38", "M:0.41-0.51 F:0.34-0.45"],
              ["RBC Ct", "4.85", "M:4.6-6.1 F:3.9-5.2"],
              ["WBC Ct", "8.6", "M:4.2-9.1 F:4.0-10.0"],
              ["Platelet Count", "456", "160-370 x10 u/L"],
            ], "DATE: November 12, 2025"),
            const SizedBox(height: 30),
            labTable("URINALYSIS", [
              ["Color", "Yellow", "Yellow"],
              ["Appearance", "Clear", "Clear"],
              ["pH", "6.0", "4.5-8.0"],
              ["Protein", "Negative", "Negative"],
              ["Glucose", "Negative", "Negative"],
              ["Ketones", "Negative", "Negative"],
            ], "DATE: November 12, 2025"),
          ],
        ),
      ),
    );
  }
}

// Mobile version: two tables stacked
class _TablesMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        labTable("HEMATOLOGY", [
          ["Hemoglobin", "116", "M:137-175 F:112-157"],
          ["Hematocrit", "0.38", "M:0.41-0.51 F:0.34-0.45"],
          ["RBC Ct", "4.85", "M:4.6-6.1 F:3.9-5.2"],
          ["WBC Ct", "8.6", "M:4.2-9.1 F:4.0-10.0"],
          ["Platelet Count", "456", "160-370 x10 u/L"],
        ], "DATE: November 12, 2025"),
        const SizedBox(height: 20),
        labTable("URINALYSIS", [
          ["Color", "Yellow", "Yellow"],
          ["Appearance", "Clear", "Clear"],
          ["pH", "6.0", "4.5-8.0"],
          ["Protein", "Negative", "Negative"],
          ["Glucose", "Negative", "Negative"],
          ["Ketones", "Negative", "Negative"],
        ], "DATE: November 12, 2025"),
      ],
    );
  }
}
