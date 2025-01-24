// import 'package:draggable_fab/draggable_fab.dart';
// import 'package:flutter/material.dart';

// class DriftingButton extends StatefulWidget {
//   const DriftingButton({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _DriftingButtonState createState() => _DriftingButtonState();
// }

// class _DriftingButtonState extends State<DriftingButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize animation controller
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);

//     // Set up a drifting animation
//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(0, 0),
//       end: const Offset(0, -0.1),
//     ).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _offsetAnimation,
//       child: DraggableFab(
//         child: FloatingActionButton(
//           backgroundColor: const Color.fromARGB(255, 193, 240, 19),
//           onPressed: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("printing start")),
//             );
//           },
//           child: const Icon(Icons.print_rounded),
//         ),
//       ),
//     );
//   }
// }

