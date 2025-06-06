class FilterChipModel {
  final String label;
  bool isSelected;

  FilterChipModel({required this.label, this.isSelected = false});
  FilterChipModel copyWith({String? label, bool? isSelected}) {
    return FilterChipModel(
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
