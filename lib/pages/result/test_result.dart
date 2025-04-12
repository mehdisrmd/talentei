// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:graphic/graphic.dart';

// class JobAptitudeTestResults extends StatelessWidget {
//   const JobAptitudeTestResults({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Arabic text direction
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.grey[50],
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 3,
//                           offset: const Offset(0, 1),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         'نتیجه آزمون رغبت‌سنجی شغلی',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF316FB1),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Radar Chart Card
//                   Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 3,
//                           offset: const Offset(0, 1),
//                         ),
//                       ],
//                     ),
//                     child: SizedBox(
//                       height: 300,
//                       child: JobRadarChart(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Complete Other Tests Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 55,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF51A2C8),
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         'تکمیل سایر آزمون‌ها',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Personality Assessment Booklet Section
//                   Container(
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF5F7FB),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       children: [
//                         // Book Image
//                         Container(
//                           height: 180,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             image: const DecorationImage(
//                               image: AssetImage('assets/personality_book.png'),
//                               // If you don't have this asset, replace with a placeholder
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),

//                         // Title
//                         Text(
//                           'دفترچه شخصیت شناسی اختصاصی',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 12),

//                         // Description
//                         Text(
//                           'شما می‌توانید نتیجه‌ی اولیه هر یک از آزمون‌ها را به صورت رایگان مشاهده کنید. اما برای دریافت تشریح کامل و تحلیل نتیجه آزمون‌ها در کنار هم نیاز است دفترچه اختصاصی تحلیل شخصیت را تهیه کنید. این دفترچه به همراه نظر اختصاصی مشاورین مجرب مجموعه به صورت فایل PDF به شما ارائه خواهد شد. برای دریافت دفترچه تحلیل شخصیت پاسخگویی به حداقل دو آزمون نئو و طبع و مزاج الزامی می‌باشد. لکن تکمیل سایر آزمون‌ها در تحلیل و ارزیابی دقیق به مشاورین ما کمک خواهد کرد.',
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.black87,
//                             height: 1.5,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 16),

//                         // Get Booklet Button
//                         SizedBox(
//                           width: double.infinity,
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFF51A2C8),
//                               foregroundColor: Colors.red,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.download_outlined),
//                                 SizedBox(width: 8),
//                                 Text('دریافت دفترچه',
//                                     style: TextStyle(fontSize: 16)),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 12),

//                         // Get Consultation Button
//                         SizedBox(
//                           width: double.infinity,
//                           height: 50,
//                           child: OutlinedButton(
//                             onPressed: () {},
//                             style: OutlinedButton.styleFrom(
//                               side: BorderSide(color: Color(0xFF51A2C8)),
//                               foregroundColor: Color(0xFF51A2C8),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                             child: const Text(
//                               'دریافت مشاوره',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Custom Radar Chart Widget
// class JobRadarChart extends StatelessWidget {
//   const JobRadarChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: RadarChart(
//         curve: Curves.bounceIn,
//         RadarChartData(
//           // Increase title offset to prevent overlap with more lines
//           titlePositionPercentageOffset: 0.07,
//           titleTextStyle: const TextStyle(color: Colors.black, fontSize: 14),
//           getTitle: (index, angle) {
//             switch (index) {
//               case 0:
//                 return RadarChartTitle(text: 'پژوهشی');
//               case 1:
//                 return RadarChartTitle(text: 'هنری');
//               case 2:
//                 return RadarChartTitle(text: 'اجتماعی');
//               case 3:
//                 return RadarChartTitle(text: 'قراردادی');
//               case 4:
//                 return RadarChartTitle(text: 'تجاری');
//               case 5:
//                 return RadarChartTitle(text: 'واقع‌گرا');
//               default:
//                 return const RadarChartTitle(text: '');
//             }
//           },
//           dataSets: [
//             RadarDataSet(
//               fillColor: Colors.blue.withOpacity(0.2),
//               borderColor: Colors.blue,
//               entryRadius: 3,
//               dataEntries: [
//                 const RadarEntry(value: 70),
//                 const RadarEntry(value: 80),
//                 const RadarEntry(value: 60),
//                 const RadarEntry(value: 40),
//                 const RadarEntry(value: 45),
//               ],
//             ),
//             // Second dataset for comparison
//           ],
//           radarShape: RadarShape.polygon,
//           radarBackgroundColor: Colors.transparent,
//           borderData: FlBorderData(show: false),
//           radarBorderData: BorderSide(color: Colors.grey[900]!),
//           gridBorderData: BorderSide(color: Colors.grey[900]!, width: 0.5),
//           tickCount: 10, // Increased from 8 to 10 for more lines
//           ticksTextStyle: const TextStyle(color: Colors.black, fontSize: 10),
//           tickBorderData: const BorderSide(color: Colors.transparent),
//           // Extend axis lines to the edge
//         ),
//       ),
//     );
//   }
// }

// class GraphicRadarChart extends StatelessWidget {
//   const GraphicRadarChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RadarChart(
//       data: [
//         {'category': 'Angle 1', 'value': 50},
//         {'category': 'Angle 2', 'value': 70},
//         {'category': 'Angle 3', 'value': 80},
//         {'category': 'Angle 4', 'value': 60},
//         {'category': 'Angle 5', 'value': 90},
//       ],
//       variables: [
//         Variable(
//           accessor: (Map map) => map['category'] as String,
//           scale: OrdinalScale(),
//         ),
//         Variable(
//           accessor: (Map map) => map['value'] as num,
//           scale: LinearScale(min: 0, max: 100),
//         ),
//       ],
//       elements: [
//         PolygonElement(
//           shape: ShapeAttr(value: BasicPolygonShape(smooth: true)),
//           color: ColorAttr(value: Colors.blue.withOpacity(0.3)),
//         ),
//       ],
//       coord: PolarCoord(transposed: false),
//     );
//   }
// }
