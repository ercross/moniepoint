part of '../screen.dart';

class _OffersCount extends StatelessWidget {
  final Duration animationDuration;
  const _OffersCount({required this.animationDuration});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding:
          const EdgeInsets.symmetric(horizontal: HomeScreen._topScreenPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: _BuyOfferView(animationDuration),
          ),
          const SizedBox(width: 5),
          Flexible(
            flex: 1,
            child: _RentOfferView(animationDuration),
          )
        ],
      ),
    );
  }
}

class _BuyOfferView extends StatefulWidget {
  final Duration animationDuration;
  const _BuyOfferView(this.animationDuration);

  @override
  State<_BuyOfferView> createState() => _BuyOfferViewState();
}

class _BuyOfferViewState extends State<_BuyOfferView> {
  int _counter = 0;
  final int _counterTarget = 1034;
  late Timer _timer;
  double _height = 0;
  double _width = 0;
  @override
  void initState() {
    super.initState();
  }

  void _startCounting() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_counter < _counterTarget) {
        setState(() {
          _counter++;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            _height = constraints.maxHeight;
            _width = constraints.maxWidth;
          } );
          _startCounting();
        });
        return AnimatedContainer(
          duration: widget.animationDuration,
          height: _height,
          width: _width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("BUY",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onPrimary)),
              const SizedBox(height: 25),
              Text("$_counter",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onPrimary)),
              Text(
                "offers",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary),
              )
            ],
          ),
        );
      },
    );
  }
}

class _RentOfferView extends StatefulWidget {
  final Duration animationDuration;
  const _RentOfferView(this.animationDuration);

  @override
  State<_RentOfferView> createState() => _RentOfferViewState();
}

class _RentOfferViewState extends State<_RentOfferView> {
  int _counter = 0;
  final int _counterTarget = 2212;
  late Timer _timer;
  late double _height;
  
  @override
  void initState() {
    super.initState();
    _height = 0;
    
  }

  void _startCounting() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_counter < _counterTarget) {
        setState(() {
          _counter++;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            _height = constraints.maxHeight;
            
          } );
          _startCounting();
        });
        return AnimatedContainer(
          height: _height,
          width: _height,
          duration: widget.animationDuration,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.surfaceContainerLow,
                    Theme.of(context).colorScheme.surfaceContainerHigh
                  ])),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("RENT",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface)),
              const SizedBox(height: 25),
              Text("$_counter",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface)),
              Text("offers",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface)),
            ],
          ),
        );
      },
    );
  }
}
