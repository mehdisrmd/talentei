part of docLib;

class AppointmentSectionWidget extends StatefulWidget {
  const AppointmentSectionWidget({super.key});

  @override
  State<AppointmentSectionWidget> createState() =>
      _AppointmentSectionWidgetState();
}

class _AppointmentSectionWidgetState extends State<AppointmentSectionWidget> {
  bool select = false;
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: HeaderSection(title: 'مشاوره حضوری'),
          ),
          const SizedBox(height: 10),
          BuildAppointmentItem('۶:۳۰', 'بعد از ظهر', '۲۵۰,۰۰۰ تومان',
              (bool value) {
            setState(() {
              select = value;
            });
          }),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0C6D95),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                select ? 'انتخاب' : 'انتخاب نوبت مشاوره حضوری',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildAppointmentItem extends StatefulWidget {
  final String time;
  final String period;
  final String price;
  final ValueChanged<bool> onTap;

  BuildAppointmentItem(this.time, this.period, this.price, this.onTap);

  @override
  State<BuildAppointmentItem> createState() => _BuildAppointmentItemState();
}

class _BuildAppointmentItemState extends State<BuildAppointmentItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap(isSelected);
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
          padding: const EdgeInsets.all(12),
          height: isSelected ? 130 : 70,
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade400 : Colors.white,
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color:
                        isSelected ? Colors.white : GeneralColor.textFormColor,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${widget.time} ${widget.period}',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        '45 دقیفه گفتگو',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected
                              ? Colors.white70
                              : const Color(0xFF353639),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (isSelected)
                AnimatedOpacity(
                  opacity: isSelected ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "دریافت",
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
