import 'package:ai_interview_coach_app/backend/models/country_code_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/views/auth_view/country_code_item.dart';
import 'package:flutter/material.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({super.key, this.onCompleted});
  final Function(String)? onCompleted;

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  CountryCodeModel? item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          'Phone number',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 13.0,
                  horizontal: 6.0,
                ),
                alignment: Alignment.center,
                child: DropdownButton<CountryCodeModel>(
                  items: countriesCodes
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          alignment: Alignment.centerLeft,
                          child: CountryCodeItem(model: item),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() {
                    item = value;
                  }),
                  dropdownColor: Theme.of(context).colorScheme.surface,
                  value: countriesCodes.first,
                  padding: EdgeInsets.zero,
                  selectedItemBuilder: (context) {
                    return countriesCodes.map((country) {
                      return CountryCodeItem(
                        model: item ?? countriesCodes.first,
                      );
                    }).toList();
                  },
                  underline: const SizedBox.shrink(),
                  isDense: true,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                onSubmitted: (value) {
                  if (item != null) {
                    widget.onCompleted?.call("${item!.dialCode}$value");
                  }
                },
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Type your phone number',
                  hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  contentPadding: const EdgeInsets.all(16.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
