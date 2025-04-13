import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:talentei/utils/general_color.dart';

class JobAptitudeTestResults extends StatelessWidget {
  const JobAptitudeTestResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Arabic text direction
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              spreadRadius: 10,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.03))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Color(0xFFE7E7E8))),
                    child: Center(
                        child: Text(
                      'نتیجه آزمون رغبت‌سنجی شغلی',
                      style: TextStyle(
                          color: GeneralColor.headerTitleColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    )),
                  ),
                  const SizedBox(height: 16),

                  // Radar Chart Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 300,
                      child:
                          BarChartWidget(), // Replace JobRadarChart with BarChartWidget
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Complete Other Tests Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF51A2C8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'تکمیل سایر آزمون‌ها',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Personality Assessment Booklet Section
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7E8F4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Book Image
                        Container(
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/book.png'),
                              // If you don't have this asset, replace with a placeholder
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Title
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            'دفترچه شخصیت شناسی اختصاصی',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Description
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            'شما می‌توانید نتیجه ی اولیه هر یک از آزمون‌ها را به صورت رایگان مشاهده کنید اما برای دریافت تشریح کامل و تحلیل نتیجه آزمون‌ها در کنار هم نیاز است دفترچه اختصاصی تحلیل شخصیت را تهیه کنید این دفترچه به همراه نظر اختصاصی مشاورین مجرب مجموعه به صورت فایل PDF به شما ارائه خواهد شد. برای دریافت دفترچه ی تحلیل شخصیت پاسخگویی به حداقل دو آزمون نئو و طبع و مزاج الزامی می‌باشد لکن تکمیل سایر آزمون‌ها در تحلیل و ارزیابی دقیق به مشاورین ما کمک خواهد کرد.',
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Color(0xFF353639),
                                fontWeight: FontWeight.w400,
                                height: 24 / 16,
                                letterSpacing: 0,
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Get Booklet Button
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF51A2C8),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.download_outlined),
                                SizedBox(width: 8),
                                Text('دریافت دفترچه',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Get Consultation Button
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xFF51A2C8)),
                              foregroundColor: Color(0xFF51A2C8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'دریافت مشاوره',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Replace the JobRadarChart class with this new implementation
class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => BarChartWidgetState();
}

class BarChartWidgetState extends State<BarChartWidget> {
  final Color barColor = const Color(0xFF51A2C8);
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Color(0xFF316FB1),
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'پژوهشی';
        break;
      case 1:
        text = 'هنری';
        break;
      case 2:
        text = 'اجتماعی';
        break;
      case 3:
        text = 'قراردادی';
        break;
      case 4:
        text = 'تجاری';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      meta: meta,
      angle: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(text, style: style),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    return SideTitleWidget(
      meta: meta,
      child: Text(
        value.toInt().toString(),
        style: const TextStyle(
          fontSize: 10,
          color: Color(0xFF316FB1),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return BarChart(
              BarChartData(
                maxY: 100,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    fitInsideHorizontally: true,
                    fitInsideVertically: true,
                    tooltipPadding: const EdgeInsets.all(8),
                    tooltipMargin: 8,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${rod.toY.toInt()}%',
                        const TextStyle(
                          color: Color(0xFF316FB1),
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  touchCallback: (event, response) {
                    setState(() {
                      if (response?.spot != null) {
                        touchedIndex = response!.spot!.touchedBarGroupIndex;
                      } else {
                        touchedIndex = -1;
                      }
                    });
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitles,
                      interval: 20,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 20 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: const Color(0xFFE7E8EC),
                    strokeWidth: 1,
                  ),
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  generateBarGroup(0, 75),
                  generateBarGroup(1, 60),
                  generateBarGroup(2, 85),
                  generateBarGroup(3, 45),
                  generateBarGroup(4, 65),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  BarChartGroupData generateBarGroup(int x, double value) {
    bool isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          gradient: LinearGradient(
            colors: isTouched
                ? [barColor.withOpacity(0.8), barColor]
                : [barColor.withOpacity(0.6), barColor.withOpacity(0.8)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          width: 22,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: const Color(0xFFE7E8EC),
          ),
        ),
      ],
      showingTooltipIndicators: isTouched ? [0] : [],
    );
  }
}
