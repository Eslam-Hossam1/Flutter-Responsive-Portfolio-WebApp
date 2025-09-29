import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../res/constants.dart';

class CopyInfoText extends StatelessWidget {
  const CopyInfoText(
      {super.key,
      required this.title,
      required this.text,
      required this.svgImage,
      this.imageHeight,
      this.imageWidth,
      this.widthSpace,
      required this.textToBeCopy});
  final String title;
  final String text;
  final String svgImage;
  final double? imageHeight;
  final double? imageWidth;
  final String textToBeCopy;
  final double? widthSpace;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: GestureDetector(
        onLongPress: () {
          // Copy the displayed value
          Clipboard.setData(ClipboardData(text: textToBeCopy));
          // Use overlay-based FToast to support web without plugins
          showCopiedToast(context, textToBeCopy);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              svgImage,
              height: imageHeight ?? 15.w.clamp(15, 20),
              width: imageWidth ?? 15.w.clamp(15, 20),
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: widthSpace ?? 4.w.clamp(4, 16),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white)
                  .copyWith(fontSize: 10.sp.fontClamper(14)),
            ),
            const Spacer(),
            Text(
              text,
              style: TextStyle(
                  fontSize: 10.sp.fontClamper(14),
                  color: const Color(0xff8B8B8D)),
            ),
            if (MediaQuery.sizeOf(context).width >= 360)
              SizedBox(
                width: widthSpace ?? 4.w.clamp(4, 16),
              ),
            if (MediaQuery.sizeOf(context).width >= 360)
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: textToBeCopy));
                  showCopiedToast(context, textToBeCopy);
                },
                child: SvgPicture.asset(
                  'assets/icons/copy-svgrepo-com (1).svg',
                  height: imageHeight ?? 15.w.clamp(15, 20),
                  width: imageWidth ?? 15.w.clamp(15, 20),
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void showCopiedToast(BuildContext context, String textToBeCopied) {
    final fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E).withOpacity(0.95),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 18),
            const SizedBox(width: 4),
            Text(
              'Copied: $textToBeCopy',
              style: const TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class ClickableInfo extends StatelessWidget {
  const ClickableInfo(
      {super.key,
      required this.linkText,
      required this.svgImage,
      this.imageHeight,
      this.imageWidth,
      this.widthSpace,
      required this.infoTitle,
      required this.linkUrl});
  final String linkText;
  final String svgImage;
  final double? imageHeight;
  final double? imageWidth;
  final double? widthSpace;
  final String infoTitle;
  final String linkUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          InfoType(
              svgImage: svgImage,
              imageHeight: imageHeight,
              imageWidth: imageWidth,
              widthSpace: widthSpace,
              infoTitle: infoTitle,
              linkUrl: linkUrl),
          const Spacer(),
          Link(linkUrl: linkUrl, linkText: linkText),
        ],
      ),
    );
  }
}

class Link extends StatefulWidget {
  const Link({
    super.key,
    required this.linkUrl,
    required this.linkText,
  });
  final String linkUrl;
  final String linkText;

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(widget.linkUrl));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          widget.linkText,
          style: TextStyle(
            fontSize: 10.sp.fontClamper(14),
            color: const Color(0xff8B8B8D),
          ),
        ),
      ),
    );
  }
}

class InfoType extends StatefulWidget {
  const InfoType({
    super.key,
    required this.svgImage,
    required this.imageHeight,
    required this.imageWidth,
    required this.widthSpace,
    required this.infoTitle,
    required this.linkUrl,
  });

  final String svgImage;
  final double? imageHeight;
  final double? imageWidth;
  final double? widthSpace;
  final String infoTitle;
  final String linkUrl;
  @override
  State<InfoType> createState() => _InfoTypeState();
}

class _InfoTypeState extends State<InfoType> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(widget.linkUrl));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            SvgPicture.asset(
              widget.svgImage,
              height: widget.imageHeight ?? 15.w.clamp(15, 20),
              width: widget.imageWidth ?? 15.w.clamp(15, 20),
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: widget.widthSpace ?? 4.w.clamp(4, 16),
            ),
            Text(
              widget.infoTitle,
              style: const TextStyle(color: Colors.white)
                  .copyWith(fontSize: 10.sp.fontClamper(14)),
            ),
          ],
        ),
      ),
    );
  }
}
