import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_pass/core/theme/app_colors.dart';

class GeneratorDropdown<T> extends StatelessWidget {
  const GeneratorDropdown({
    super.key,
    required this.headingText,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
  });

  final String headingText;
  final T value;
  final List<T> items;
  final String Function(T value) itemLabel;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headingText,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.slate,
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
        ),
        const Gap(8),
        DropdownFlutter<T>(
          items: items,
          initialItem: value,
          excludeSelected: false,
          overlayHeight: 190,
          closedHeaderPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          expandedHeaderPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          itemsListPadding: const EdgeInsets.symmetric(vertical: 6),
          listItemPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          decoration: CustomDropdownDecoration(
            closedFillColor: AppColors.surface,
            expandedFillColor: AppColors.surface,
            closedBorder: Border.all(width: 2, color: AppColors.border),
            expandedBorder: Border.all(width: 2, color: AppColors.border),
            closedBorderRadius: BorderRadius.circular(14),
            expandedBorderRadius: BorderRadius.circular(14),
            closedShadow: const [],
            expandedShadow: const [],
            closedSuffixIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.slate,
              size: 22,
            ),
            expandedSuffixIcon: const Icon(
              Icons.keyboard_arrow_up_rounded,
              color: AppColors.slate,
              size: 22,
            ),
            listItemDecoration: ListItemDecoration(
              highlightColor: AppColors.input,
              selectedColor: AppColors.input,
              selectedIconColor: AppColors.primary,
            ),
          ),
          headerBuilder: (context, selectedItem, enabled) {
            return Text(
              itemLabel(selectedItem),
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.slate,
                fontWeight: FontWeight.w400,
              ),
            );
          },
          listItemBuilder: (context, item, isSelected, onItemSelect) {
            return Row(
              children: [
                Expanded(
                  child: Text(
                    itemLabel(item),
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.slate,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
              ],
            );
          },
          onChanged: onChanged,
        ),
      ],
    );
  }
}
