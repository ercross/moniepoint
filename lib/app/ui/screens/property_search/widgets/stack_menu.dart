part of '../screen.dart';

class _StackMenu extends StatefulWidget {
  
  final Function executeAfterClose;
  const _StackMenu({required this.executeAfterClose});

  @override
  State<_StackMenu> createState() => _StackMenuState();
}

class _StackMenuState extends State<_StackMenu> {
  double _width = 0;
  double _height = 0;
  static const _animationDuration = Duration(milliseconds: 1200);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          _width = 160;
          _height = 162;
        });
      });
    });
  }

  _close() {
    setState(() {
      _width = 0;
      _height = 0;
    });
    Future.delayed(_animationDuration, (){widget.executeAfterClose();});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _close,
      child: AnimatedContainer(
        alignment: Alignment.bottomLeft,
        duration: _animationDuration,
        width: _width,
        height: _height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.surfaceContainerLow,
                  Theme.of(context).colorScheme.surfaceContainerHigh
                ])),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _StackMenuItem(
                name: "Cozy areas",
                isActive: false,
                svgIconAsset: AppIcon.secured),
            SizedBox(height: 20),
            _StackMenuItem(
                name: "Price", isActive: true, svgIconAsset: AppIcon.wallet),
            SizedBox(height: 20),
            _StackMenuItem(
                name: "Infrastructure",
                isActive: false,
                svgIconAsset: AppIcon.infrastructure),
            SizedBox(height: 20),
            _StackMenuItem(
                name: "Without any layer",
                isActive: false,
                svgIconAsset: AppIcon.stack),
          ],
        ),
      ),
    );
  }
}

class _StackMenuItem extends StatelessWidget {
  final String name;
  final String svgIconAsset;
  final bool isActive;
  const _StackMenuItem(
      {required this.name, required this.isActive, required this.svgIconAsset});

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).iconTheme.color;
    return Row(
      children: [
        SvgPicture.asset(svgIconAsset,
            height: 18,
            width: 18,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(color!, BlendMode.srcIn)),
        const SizedBox(width: 10),
        Text(
          name,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: color),
        )
      ],
    );
  }
}
