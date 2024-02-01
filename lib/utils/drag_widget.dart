
import 'package:flutter/cupertino.dart';

class DragWidget extends StatefulWidget {
  DragWidget({super.key, required this.child});

  Widget child;

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  bool isHandlePostion = false;

  late Size _childSize;

  double? _top;
  double? _left;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  double? _screenWidthMid, _screenHeightMid;
  int _timeMiliDuration = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _childSize = context.size!;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_top != null && _left != null && isHandlePostion){
      // 2. khi widget ở trị trí drag rồi thì set nó tại vị trí bắt buộc
      // và tăng duration lên để có animation
      WidgetsBinding.instance
          .addPostFrameCallback((_) {
        _timeMiliDuration = 300;
        _left = handlePositionX(_left!);
        _top = handlePositionY(_top!);
        setState(() {});
      });
    }
    isHandlePostion = false;

    return Stack(
      children: [
        AnimatedPositioned(
            duration: Duration(milliseconds: _timeMiliDuration),
            top: _top,
            left: _left,
            child: Draggable(
              childWhenDragging: const SizedBox(width: 0.0,height: 0.0,),
              feedback: widget.child,
              onDragEnd: _handleDragEnded,
              child: widget.child,
            )
        )
      ],
    );
  }

  void _handleDragEnded(DraggableDetails draggableDetails) {
    _calculatePosition(draggableDetails.offset);
  }

  void _calculatePosition(Offset targetOffsetPosition) {
    if (_screenWidthMid == null || _screenHeightMid == null) {
      Size screenSize = MediaQuery.of(context).size;
      _screenWidth = screenSize.width;
      _screenHeight = screenSize.height;
      _screenWidthMid = _screenWidth / 2;
      _screenHeightMid = _screenHeight / 2;
    }

    // 1. khi drag widget thì set nó tại vị trí đó trước
    // và set duration 0 để k có animation
    isHandlePostion = true;
    _timeMiliDuration = 0;
    _left = targetOffsetPosition.dx;
    _top = targetOffsetPosition.dy;
    setState(() {});
  }

  double handlePositionX(double position){
    double value = 0;
    if(position < _screenWidthMid! - _childSize.width){
      value = 30;
    }else{
      value = _screenWidth - _childSize.width;
    }
    return value;
  }

  double handlePositionY(double position){
    double heightBottomNav = 80;
    double value = 0;

    // trên màn hình
    if(position < 0 + _childSize.width / 2){
      value = 0 + _childSize.width / 2;

      // dưới màn hình
    }else if(position > _screenHeight - heightBottomNav - (_childSize.width + 5)){
      value = _screenHeight - heightBottomNav - (_childSize.width + 5);
    }else{
      value = position;
    }
    return value;
  }
}
