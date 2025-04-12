part of docLib;

class CalenderSectionWidget extends StatefulWidget {
  const CalenderSectionWidget({super.key});

  @override
  _CalenderSectionWidgetState createState() => _CalenderSectionWidgetState();
}

class _CalenderSectionWidgetState extends State<CalenderSectionWidget> {
  Jalali? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final Jalali? picked = await showPersianDatePicker(
      context: context,
      textDirection: TextDirection.rtl,
      initialDate: Jalali.now(),
      firstDate: Jalali(1400, 6),
      lastDate: Jalali(1450, 12),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.secondaryColor,
              onPrimary: AppColors.extraBackground,
              surface: AppColors.secondaryBackground,
              onSurface: AppColors.primaryColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textDark,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewSectionWidget.buildSectionHeader('رزرو وقت مشاوره'),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBtnColor,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              selectedDate != null
                  ? 'تاریخ انتخاب شده: ${selectedDate!.formatFullDate()}'
                  : 'انتخاب تاریخ',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
