part of 'scaffold.dart';

class _CustomBottomNavBar extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTapIndex;
  const _CustomBottomNavBar(
      {required this.activeIndex, required this.onTapIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Material(
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Item(
                  isActive: activeIndex == 0,
                  onPressed: () {
                    onTapIndex(0);
                  },
                  svgIconAsset: AppIcon.searchFilled),
              _Item(
                  isActive: false,
                  svgIconAsset: AppIcon.chat,
                  onPressed: () {
                    onTapIndex(300);
                  }),
              _Item(
                  isActive: activeIndex == 1,
                  svgIconAsset: AppIcon.home,
                  onPressed: () {
                    onTapIndex(1);
                  }),
              _Item(
                  isActive: false,
                  svgIconAsset: AppIcon.favorite,
                  onPressed: () {
                    onTapIndex(300);
                  }),
              _Item(
                  isActive: false,
                  svgIconAsset: AppIcon.person,
                  onPressed: () {
                    onTapIndex(300);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final bool isActive;
  final String svgIconAsset;

  final Function() onPressed;
  const _Item(
      {required this.isActive,
      required this.onPressed,
      required this.svgIconAsset});

  @override
  Widget build(BuildContext context) {
    final double buttonSize = isActive ? 50 : 40;
    const double iconSize = 22;

    return CustomRippleButton(
      onPressed: onPressed,
      size: const Size(50, 50),
      child: AnimatedContainer(
        height: buttonSize,
        width: buttonSize,
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.tertiary,
            shape: BoxShape.circle),
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(
          height: iconSize,
          width: iconSize,
          fit: BoxFit.contain,
          svgIconAsset,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class CustomRippleButton extends StatefulWidget {
  final Widget child;
  final Size size;
  final Function() onPressed;
  const CustomRippleButton(
      {required this.child,
      required this.size,
      required this.onPressed,
      super.key});

  @override
  CustomRippleButtonState createState() => CustomRippleButtonState();
}

class CustomRippleButtonState extends State<CustomRippleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
  }

  void _startRipple() {
    _controller.forward(from: 0.0);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startRipple,
      child: SizedBox(
        height: widget.size.height,
        width: widget.size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(child: widget.child),
            if (_controller.isAnimating)
              _RippleAnimation(controller: _controller, button: widget.child),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _RippleAnimation extends StatelessWidget {
  final AnimationController controller;
  final Widget button;
  const _RippleAnimation({required this.controller, required this.button});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          painter: RipplePainter(controller.value),
        );
      },
    );
  }
}

class RipplePainter extends CustomPainter {
  final double progress;

  RipplePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(1.0 - progress) // Fading effect
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0; // Thickness of the ripple rings

    double maxRadius = size.width / 2; // Max radius based on the button's width
    double rippleCount = 3; // Number of ripple rings

    for (int i = 0; i < rippleCount; i++) {
      double radius = (i + progress) / rippleCount * maxRadius;
      canvas.drawCircle(size.center(Offset.zero), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
