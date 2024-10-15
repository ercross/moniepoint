part of '../screen.dart';

class _PropertiesSectionView extends StatelessWidget {
  const _PropertiesSectionView();

  @override
  Widget build(BuildContext context) {
    const double radius = 20;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius)),
          color: Colors.white),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          axisDirection: AxisDirection.down,
          crossAxisSpacing: 6,
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: _PropertyView(
                asset: AppImage.property1,
                radius: radius,
                address: "Gladkova St., 25",
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: _PropertyView(
                asset: AppImage.property2,
                radius: radius,
                address: "Trevoleva St., 43",
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: _PropertyView(
                asset: AppImage.property3,
                radius: radius,
                address: "Gubina St., 1",
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: _PropertyView(
                asset: AppImage.property4,
                radius: radius,
                address: "Sedova St., 22",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PropertyView extends StatelessWidget {
  final String asset;
  final double radius;
  final String address;
  const _PropertyView(
      {required this.asset, required this.radius, required this.address});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 0,
              child: _PropertyAddressBar(address, constraints.maxWidth))
        ],
      ),
    );
  }
}

class _PropertyAddressBar extends StatefulWidget {
  final String address;
  final double maxWidth;
  const _PropertyAddressBar(this.address, this.maxWidth);

  @override
  State<_PropertyAddressBar> createState() => _PropertyAddressBarState();
}

class _PropertyAddressBarState extends State<_PropertyAddressBar> {
  static const double _buttonSize = 45;
  double _width = 49;
  double _addressOpacity = 0;
  late bool _showAddress;
  late final double _horizontalMargin;
  @override
  void initState() {
    super.initState();
    _showAddress = false;
    _horizontalMargin = widget.maxWidth * 0.05;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          _width = widget.maxWidth -
              (_horizontalMargin * 2); // left and right margin = 2
        });
      });
      Future.delayed(const Duration(milliseconds: 3500), () {
        setState(() {
          _showAddress = true;
          _addressOpacity = 1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      return AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 4500),
        padding: const EdgeInsets.all(2),
        height: 47,
        margin: EdgeInsets.symmetric(horizontal: _horizontalMargin),
        width: _width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 199, 177, 144).withOpacity(0.95),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Expanded(
                child: Center(
              child: Visibility(
                visible: _showAddress,
                replacement: const SizedBox(),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 3500),
                  opacity: _addressOpacity,
                  child: Text(widget.address,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            )),
            const _ViewPropertyPageButton(size: _buttonSize)
          ],
        ),
      );
    });
  }
}

class _ViewPropertyPageButton extends StatelessWidget {
  final double size;
  const _ViewPropertyPageButton({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFAF4EC)),
      child: Icon(
        CupertinoIcons.forward,
        size: 14,
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}
