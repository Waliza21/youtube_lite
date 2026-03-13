import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class YoutubeNavTile extends StatelessWidget {
  const YoutubeNavTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                  fontWeight: .w600,
                ),
              ),
            ),

            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.iconMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
