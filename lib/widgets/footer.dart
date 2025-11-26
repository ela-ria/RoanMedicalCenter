// lib/widgets/footer.dart
import 'package:flutter/material.dart';
import '../theme/themecolors.dart';
import 'responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ThemeColors.secondaryDark,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Responsive(desktop: _FooterDesktop(), mobile: _FooterMobile()),
    );
  }
}

// Desktop version
class _FooterDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_HospitalLogoFooter(), _FooterLinksAndCopyright()],
    );
  }
}

// Mobile version
class _FooterMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _HospitalLogoFooter(),

        SizedBox(height: 30),

        _FooterLinksAndCopyright(isMobile: true),
      ],
    );
  }
}

class _HospitalLogoFooter extends StatelessWidget {
  const _HospitalLogoFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Logo
        Image.asset('assets/logos/logo.png', height: 40),
        const SizedBox(width: 10),
        // Name
        const Text(
          "Roan Medical Center",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: ThemeColors.textLight,
          ),
        ),
      ],
    );
  }
}

class _FooterLinksAndCopyright extends StatelessWidget {
  final bool isMobile;
  const _FooterLinksAndCopyright({this.isMobile = false});

  String _getRoute(String title) {
    switch (title) {
      case 'Home':
        return '/';
      case 'Login':
        return '/login';
      case 'About Us':
        return '/about';
      case 'Our Services':
        return '/services';
      case 'Our Doctors':
        return '/doctors';
      case 'Contact Us':
        return '/contact';
      case 'Book Appointment':
        return '/appointment';
      default:
        return '/';
    }
  }

  Widget _link(String title, BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(_getRoute(title));
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          title,
          style: const TextStyle(color: ThemeColors.accent, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.end,
      children: [
        // Links
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.end,
          runSpacing: 5,
          spacing: 10,
          children: [
            _link('Home', context),
            _link('Login', context),
            _link('About Us', context),
            _link('Our Services', context),
            _link('Our Doctors', context),
            _link('Contact Us', context),
            _link('Book Appointment', context),
          ],
        ),
        const SizedBox(height: 15),
        // Copyright
        Text(
          "© ${DateTime.now().year} Roan Medical Center. All Rights Reserved.",
          style: const TextStyle(color: ThemeColors.textLight, fontSize: 14),
        ),
      ],
    );
  }
}
