part of '../screen.dart';

class _BottomButtons extends StatefulWidget {
  final Duration animationDuration;
  const _BottomButtons({required this.animationDuration});

  @override
  State<_BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<_BottomButtons> {
  double _roundButtonSize = 0;
  double _listButtonHeight = 0;
  double _listButtonWidth = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _roundButtonSize = 42;
        _listButtonHeight = 44;
        _listButtonWidth = 140;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color containerColor = Colors.white38;
    const Color iconColor = Colors.white;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: _toggleMenuOverlay,
              child: AnimatedContainer(
                key: _buttonKey,
                height: _roundButtonSize,
                width: _roundButtonSize,
                duration: widget.animationDuration,
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
            ),
            const SizedBox(height: 6),
            AnimatedContainer(
              height: _roundButtonSize,
              width: _roundButtonSize,
              duration: widget.animationDuration,
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: containerColor),
              child: SvgPicture.asset(AppIcon.send,
                  height: 18,
                  width: 18,
                  fit: BoxFit.contain,
                  colorFilter:
                      const ColorFilter.mode(iconColor, BlendMode.srcIn)),
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        AnimatedContainer(
          duration: widget.animationDuration,
          height: _listButtonHeight,
          width: _listButtonWidth,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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

  final GlobalKey _buttonKey = GlobalKey();
  Offset _findButtonGlobalPosition() {
    final RenderBox renderBox =
        _buttonKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  OverlayEntry? _entry;
  _toggleMenuOverlay() {
    if (_entry == null) {
      _showStackMenuOverlay(_findButtonGlobalPosition());
      return;
    }
  }

  _showStackMenuOverlay(Offset globalPosition) {
    _entry = OverlayEntry(
        canSizeOverlay: true,
        builder: (ctx) {
          return GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              child: Material(
                elevation: 0,
                color: Colors.white10,
                child: Stack(children: [
                  Positioned(
                    top: globalPosition.dy - 120,
                    left: globalPosition.dx,
                    child: _StackMenu(
                      executeAfterClose: _removeOverlayEntry,
                    ),
                  ),
                ]),
              ));
        });
    Overlay.of(context).insert(_entry!);
  }

  _removeOverlayEntry() {
    _entry!.remove();
    _entry = null;
  }
}
