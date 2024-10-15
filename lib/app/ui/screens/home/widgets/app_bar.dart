part of '../screen.dart';

class _AppBar extends StatelessWidget {
  final Duration animationDuration;
  const _AppBar({required this.animationDuration});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: HomeScreen._topScreenPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _AnimatedLocationView(animationDuration),
          const Expanded(child: SizedBox()),
          _AnimatedCircleAvatar(animationDuration)
        ],
      ),
    );
  }
}

class _AnimatedCircleAvatar extends StatefulWidget {
  final Duration animationDuration;
  const _AnimatedCircleAvatar(this.animationDuration);

  @override
  State<_AnimatedCircleAvatar> createState() => __AnimatedCircleAvatarState();
}

class __AnimatedCircleAvatarState extends State<_AnimatedCircleAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 5, end: 22).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => CircleAvatar(
        radius: _animation.value,
        foregroundImage: Image.asset(AppImage.profilePics).image,
      ),
    );
  }
}

class _AnimatedLocationView extends StatefulWidget {
  final Duration animationDuration;
  const _AnimatedLocationView(this.animationDuration);

  @override
  State<_AnimatedLocationView> createState() => _AnimatedLocationViewState();
}

class _AnimatedLocationViewState extends State<_AnimatedLocationView> {
  late bool _startAnimation;

  @override
  void initState() {
    super.initState();
    _startAnimation = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _startAnimation = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.animationDuration,
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      height: 45,
      width: _startAnimation ? 160 : 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFEFFFE)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcon.location,
            height: 18,
            width: 18,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
          ),
          const SizedBox(width: 6),
          BlurText(
            text: "Saint Petersburg",
            duration: const Duration(milliseconds: 3000),
            type: AnimationType.letter,
            textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
