// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:hris_project/presentation/screens/home_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//
//     _fadeAnimation =
//         CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
//     _scaleAnimation =
//         CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack);
//
//     _animationController.forward();
//
//     Timer(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const HomeScreen()),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Animated Gradient Background
//           AnimatedContainer(
//             duration: const Duration(seconds: 3),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color(0xFF0F2027),
//                   Color(0xFF203A43),
//                   Color(0xFF2C5364),
//                 ],
//               ),
//             ),
//           ),
//           // Centered logo with fade & scale animation
//           Center(
//             child: FadeTransition(
//               opacity: _fadeAnimation,
//               child: ScaleTransition(
//                 scale: _scaleAnimation,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // Logo image
//                     Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(60),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.blueAccent.withOpacity(0.5),
//                             blurRadius: 20,
//                             spreadRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: Image.asset(
//                           'assets/images/HRIS.png',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     // Optional tagline
//                     const Text(
//                       "Empowering Workspaces",
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400,
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
