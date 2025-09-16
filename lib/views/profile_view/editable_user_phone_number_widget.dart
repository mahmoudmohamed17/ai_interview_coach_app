import 'dart:developer';
import 'package:ai_interview_coach_app/backend/models/country_code_model.dart';
import 'package:ai_interview_coach_app/views/auth_view/country_code_item.dart';
import 'package:flutter/material.dart';

class EditableUserPhoneNumberWidget extends StatefulWidget {
  const EditableUserPhoneNumberWidget({
    super.key,
    this.onNumberChanged,
    this.onCodeChanged,
    required this.phoneNumber,
    required this.countryCode,
  });

  final Function(String)? onNumberChanged;
  final Function(String)? onCodeChanged;
  final String phoneNumber;
  final String countryCode;

  @override
  State<EditableUserPhoneNumberWidget> createState() =>
      _EditableUserPhoneNumberWidgetState();
}

class _EditableUserPhoneNumberWidgetState
    extends State<EditableUserPhoneNumberWidget> {
  CountryCodeModel? item;

  @override
  void initState() {
    super.initState();
    item = countriesCodes.firstWhere(
      (item) => item.dialCode == widget.countryCode,
      orElse: () => countriesCodes.first,
    );
    log('Item code: ${item!.dialCode}');
  }

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
                    widget.onCodeChanged?.call(item!.dialCode);
                  }),
                  value: item,
                  dropdownColor: Theme.of(context).colorScheme.surface,
                  padding: EdgeInsets.zero,
                  underline: const SizedBox.shrink(),
                  isDense: true,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                onFieldSubmitted: (value) {
                  if (item != null) {
                    widget.onNumberChanged?.call(value);
                  }
                },
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w400,
                ),
                initialValue: widget.phoneNumber,
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
