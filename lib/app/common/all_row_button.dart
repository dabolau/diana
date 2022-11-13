import 'package:flutter/material.dart';

/// 整行按钮
class AllRowButton extends StatelessWidget {
  final Widget? leftChild;
  final Widget? centerChild;
  final Widget? rightChild;
  final Function()? onPressed;
  const AllRowButton({
    Key? key,
    this.leftChild,
    this.centerChild,
    this.rightChild,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: () {
          onPressed == null ? () {} : onPressed!();
        },
        child: Row(
          // 主轴间隔显示
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // 辅轴居中显示
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 左边内容
            leftChild == null ? Container() : leftChild!,
            // 中级内容
            centerChild == null ? Container() : centerChild!,
            // 右边内容
            rightChild == null ? Container() : rightChild!,
          ],
        ),
      ),
    );
  }
}
