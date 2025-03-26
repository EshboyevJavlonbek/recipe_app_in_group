
import 'package:flutter/material.dart';
import 'package:profile/core/core.dart';
import 'package:profile/features/auth/presentation/manager/complete_profile_view_model.dart';
import 'package:provider/provider.dart';

class RecipeBioField extends StatelessWidget {
  const RecipeBioField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bio",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 14),
        TextField(
          minLines: 5,
          maxLines: 5,
          controller: context.read<CompleteProfileViewModel>().bioController,
          style: TextStyle(color: AppColors.beigeColor),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            filled: true,
            fillColor: AppColors.pink,
            hintText: "About yourself",
            hintStyle: TextStyle(
              color: AppColors.beigeColor.withValues(alpha: 0.5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ],
    );
  }
}
