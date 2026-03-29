import 'package:flutter/material.dart';

import '../glass.dart';
import '../tokens.dart';

enum AppTab { monitor, alerts, config }

class AppBottomNav extends StatelessWidget {
  final AppTab activeTab;
  final ValueChanged<AppTab> onTabChanged;

  const AppBottomNav({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  static const _tabs = [
    (tab: AppTab.monitor, label: 'Monitor', icon: Icons.videocam_rounded),
    (tab: AppTab.alerts,  label: 'Alerts',  icon: Icons.notifications_rounded),
    (tab: AppTab.config,  label: 'Config',  icon: Icons.settings_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md, AppSpacing.xs, AppSpacing.md, AppSpacing.lg,
      ),
      child: GlassContainer(
        padding: const EdgeInsets.all(AppSpacing.xs),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _tabs
              .map((t) => _NavTabButton(
                    label: t.label,
                    icon: t.icon,
                    isActive: activeTab == t.tab,
                    onTap: () => onTabChanged(t.tab),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _NavTabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavTabButton({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? AppColors.primary : AppColors.mutedFg,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppFonts.display,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isActive ? AppColors.primary : AppColors.mutedFg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
