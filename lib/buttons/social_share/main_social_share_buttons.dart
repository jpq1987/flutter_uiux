import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final backgroundColors = [
  Color(0xFFf2f3e2),
  Color(0xFFb2e5f8),
  Color(0xFFf4b3ef),
];

class MainSocialShareButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: backgroundColors,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SocialShareButton(
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.apple),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.google),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.amazon),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.instagram),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialShareButton extends StatefulWidget {
  final double height;
  @required final List<Widget> children;
  final TextStyle buttonStyle;
  final String buttonLabel;
  final Color buttonColor;
  final Color childrenColor;

  const SocialShareButton({
    Key key,
    this.height = 100,
    this.children,
    this.buttonStyle,
    this.buttonLabel = 'SHARE',
    this.buttonColor = Colors.black,
    this.childrenColor = Colors.white,
  }) : super(key: key);

  @override
  _SocialShareButtonState createState() => _SocialShareButtonState();
}

class _SocialShareButtonState extends State<SocialShareButton> {
  final _buttonsKey = GlobalKey();
  double _buttonsWidth = 0.0;
  bool _expanded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _buttonsWidth = _buttonsKey.currentContext.size.width + 14;
      });
    });
    super.initState();
  }

  Widget _buildTopWidget() {
    return Container(
      height: widget.height / 2,
      decoration: BoxDecoration(
        color: widget.childrenColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Row(
        key: _buttonsKey,
        mainAxisSize: MainAxisSize.min,
        children: widget.children,
      ),
    );
  }

  Widget _buildBottomWidget() {
    return Material(
      elevation: 5,
      color: widget.buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: _buttonsWidth,
          height: widget.height / 2,
          child: Text(
            widget.buttonLabel,
            textAlign: TextAlign.center,
            style: widget.buttonStyle ??
                TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movement = widget.height / 4;
    return TweenAnimationBuilder<double>(
      tween: !_expanded ? Tween(begin: 0.0, end: 1.0) : Tween(begin: 1.0, end: 0.0),
      duration: _buttonsWidth == 0 ? const Duration(milliseconds: 1) : const Duration(milliseconds: 400),
      builder: (context, value, _) {
        return Container(
          height: widget.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Transform.translate(
                offset: Offset(0.0, movement * value),
                child: _buildTopWidget(),
              ),
              Transform.translate(
                offset: Offset(0.0, -movement * value),
                child: _buildBottomWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}
