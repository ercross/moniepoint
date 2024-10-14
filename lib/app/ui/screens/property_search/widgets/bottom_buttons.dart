part of '../screen.dart';

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const Color containerColor = Colors.white38;
    const Color iconColor = Colors.white;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: containerColor),
              child: SvgPicture.asset(AppIcon.stack,
                  height: 18,
                  width: 18,
                  fit: BoxFit.cover,
                  colorFilter:
                      const ColorFilter.mode(iconColor, BlendMode.srcIn)),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: containerColor),
              child: SvgPicture.asset(AppIcon.send,
                  height: 16,
                  width: 16,
                  fit: BoxFit.contain,
                  colorFilter:
                      const ColorFilter.mode(iconColor, BlendMode.srcIn)),
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              SvgPicture.asset(AppIcon.leftAlign,
                  height: 14,
                  width: 14,
                  fit: BoxFit.contain,
                  colorFilter:
                      const ColorFilter.mode(iconColor, BlendMode.srcIn)),
              const SizedBox(width: 10),
              const Text(
                "List of variants",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white54),
              )
            ],
          ),
        )
      ],
    );
  }
}
