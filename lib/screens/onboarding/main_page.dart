import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/language_selector.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Row(children: [const LanguageSelector()]),
              SvgPicture.asset('assets/hi.svg', height: 200),
              const SizedBox(height: 40),
              Text(
                S.of(context).onboarding_title,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).onboarding_subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 50),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A57AB),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  S.of(context).common_login,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              const SizedBox(height: 20),

              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.signup);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF5A57AB)),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  S.of(context).common_signup,
                  style: TextStyle(color: Color(0xFF5A57AB), fontSize: 18),
                ),
              ),

              const SizedBox(height: 40),

              Text(
                S.of(context).onboarding_social_text,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialIcon(Icons.facebook, Colors.blue),
                  const SizedBox(width: 15),
                  socialIcon(Icons.g_mobiledata, Colors.red),
                  const SizedBox(width: 15),
                  socialIcon(Icons.link, Colors.blueAccent),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget socialIcon(IconData icon, Color color) {
  return CircleAvatar(
    radius: 20,
    backgroundColor: color,
    child: Icon(icon, color: Colors.white),
  );
}
