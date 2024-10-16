part of 'scaffold.dart';

final ValueNotifier<int> activeIndex = ValueNotifier(1);

class _CustomBottomNavBar extends StatelessWidget {
  final Function(int) onTapIndex;
  const _CustomBottomNavBar({required this.onTapIndex});

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
                  index: 0,
                  onPressed: () {
                    onTapIndex(0);
                  },
                  svgIconAsset: AppIcon.searchFilled),
              _Item(
                  index: 300,
                  svgIconAsset: AppIcon.chat,
                  onPressed: () {
                    onTapIndex(300);
                  }),
              _Item(
                  index: 1,
                  svgIconAsset: AppIcon.home,
                  onPressed: () {
                    onTapIndex(1);
                  }),
              _Item(
                  index: 301,
                  svgIconAsset: AppIcon.favorite,
                  onPressed: () {
                    onTapIndex(301);
                  }),
              _Item(
                  index: 302,
                  svgIconAsset: AppIcon.person,
                  onPressed: () {
                    onTapIndex(302);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final String svgIconAsset;
  final int index;
  final Function() onPressed;
  const _Item(
      {required this.index,
      required this.onPressed,
      required this.svgIconAsset});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  double _size = 40;
  late Color _color;
  late bool _isActive;
  late bool _showRippleButton;
  static const _rippleAnimationDuration = Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _showRippleButton = false;
    _isActive = false;
    _color = Colors.transparent;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isActive = activeIndex.value == widget.index;
        _color = _isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary;
        _size = _isActive ? 50 : 40;
      });
    });

    activeIndex.addListener(() {
      if (activeIndex.value == widget.index) {
        setState(() {
          _isActive = true;
          _size = 50;
          _color = Theme.of(context).colorScheme.primary;
        });
      } else {
        setState(() {
          _isActive = false;
          _size = 40;
          _color = Theme.of(context).colorScheme.tertiary;
        });
      }
    });
  }

  /// switch between [CustomRippleButton] and [_Item]
  _switchButtons() {
    if (_isActive) {
      return;
    }

    activeIndex.value == widget.index;
    Future.delayed(_rippleAnimationDuration, () {
      setState(() => _showRippleButton = false);
      widget.onPressed();
    });
    setState(() => _showRippleButton = true);
  }

  @override
  Widget build(BuildContext context) {
    const double iconSize = 22;
    return GestureDetector(
      onTap: _switchButtons,
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 2),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _showRippleButton
            ? const CustomRippleButton(
                size: Size(50, 50), animationDuration: _rippleAnimationDuration)
            : AnimatedContainer(
                height: _size,
                width: _size,
                duration: const Duration(milliseconds: 1200),
                decoration:
                    BoxDecoration(color: _color, shape: BoxShape.circle),
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  height: iconSize,
                  width: iconSize,
                  fit: BoxFit.contain,
                  widget.svgIconAsset,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
      ),
    );
  }
}

class CustomRippleButton extends StatefulWidget {
  final Size size;
  final Duration animationDuration;
  const CustomRippleButton(
      {required this.animationDuration, required this.size, super.key});

  @override
  CustomRippleButtonState createState() => CustomRippleButtonState();
}

class CustomRippleButtonState extends State<CustomRippleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: _RippleAnimation(controller: _controller),
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
  const _RippleAnimation({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return CustomPaint(
          painter: RipplePainter(controller.value),
          child: Container(),
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
