import 'package:flutter/material.dart';

import '../../../design/glass.dart';
import '../../../design/tokens.dart';
import '../../../design/widgets/bottom_nav.dart';

class MonitorPage extends StatefulWidget {
  const MonitorPage({super.key});

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  AppTab _activeTab = AppTab.monitor;
  bool _cameraOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.warm),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: _Header(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: _CameraFeed(isOn: _cameraOn),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: _Controls(
                  cameraOn: _cameraOn,
                  onToggleCamera: () => setState(() => _cameraOn = !_cameraOn),
                ),
              ),
              AppBottomNav(
                activeTab: _activeTab,
                onTabChanged: (tab) => setState(() => _activeTab = tab),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Baby Monitor',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.foreground,
              ),
        ),
        GlassContainer(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 8, color: AppColors.statusOffline),
              const SizedBox(width: AppSpacing.xs),
              Text(
                'Offline',
                style: TextStyle(color: AppColors.mutedFg, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CameraFeed extends StatelessWidget {
  final bool isOn;
  const _CameraFeed({required this.isOn});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: SizedBox.expand(
        child: Center(
          child: isOn
              ? Text('Camera feed will appear here',
                  style: TextStyle(color: AppColors.mutedFg))
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.videocam_off, color: AppColors.mutedFg, size: 48),
                    const SizedBox(height: AppSpacing.sm),
                    Text('Camera is off',
                        style: TextStyle(color: AppColors.mutedFg)),
                  ],
                ),
        ),
      ),
    );
  }
}

class _Controls extends StatelessWidget {
  final bool cameraOn;
  final VoidCallback onToggleCamera;
  const _Controls({required this.cameraOn, required this.onToggleCamera});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.md,
        horizontal: AppSpacing.xl,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onToggleCamera,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: cameraOn
                    ? AppColors.primary.withOpacity(0.2)
                    : AppGlass.buttonBg,
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(
                  color: cameraOn
                      ? AppColors.primary.withOpacity(0.5)
                      : AppGlass.borderColor,
                ),
                boxShadow: cameraOn ? [AppGlows.primary] : null,
              ),
              child: Icon(
                cameraOn ? Icons.videocam : Icons.videocam_off,
                color: cameraOn ? AppColors.primary : AppColors.mutedFg,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
