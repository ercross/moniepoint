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
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        axisDirection: AxisDirection.down,
        crossAxisSpacing: 6,
        children: const [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: _PropertyView(asset: AppImage.property1, radius: radius),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child: _PropertyView(asset: AppImage.property2, radius: radius),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: _PropertyView(asset: AppImage.property3, radius: radius),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: _PropertyView(asset: AppImage.property4, radius: radius),
          ),
        ],
      ),
    );
  }
}

class _PropertyView extends StatelessWidget {
  final String asset;
  final double radius;
  const _PropertyView({required this.asset, required this.radius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
        width: MediaQuery.sizeOf(context).width,
      ),
    );
  }
}
