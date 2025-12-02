import 'package:flutter/material.dart';

class XboxTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Color? color;
  final Color? imageColor;
  final IconData? icon;
  final bool isHero;
  final String? imageUrl;

  const XboxTile({
    super.key,
    required this.title,
    this.subtitle,
    this.color,
    this.imageColor,
    this.icon,
    this.isHero = false,
    this.imageUrl,
  });

  @override
  State<XboxTile> createState() => _XboxTileState();
}

class _XboxTileState extends State<XboxTile> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isFocused = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleFocusChange(bool hasFocus) {
    setState(() {
      _isFocused = hasFocus;
    });
    if (hasFocus) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    if (isHovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Xbox tiles usually have a solid color or image, and a gradient overlay for text
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: Focus(
        onFocusChange: _handleFocusChange,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: widget.isHero ? double.infinity : 120, // Default width if not expanded
            decoration: BoxDecoration(
              color: widget.color ?? const Color(0xFF2D2D2D),
              borderRadius: BorderRadius.circular(8), // Xbox corners are slightly rounded but not too much
              border: (_isFocused || _isHovered)
                  ? Border.all(color: const Color(0xFF107C10), width: 3) // Green border on focus
                  : null,
              boxShadow: (_isFocused || _isHovered)
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [],
              image: widget.imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(widget.imageUrl!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.darken,
                      ),
                    )
                  : null,
            ),
            child: Stack(
              children: [
                // Icon if no image
                if (widget.imageUrl == null && widget.icon != null)
                  Center(
                    child: Icon(
                      widget.icon,
                      size: widget.isHero ? 64 : 40,
                      color: Colors.white24,
                    ),
                  ),

                // Gradient Overlay for Text Readability
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: widget.isHero ? 24 : 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (widget.subtitle != null && widget.isHero)
                          Text(
                            widget.subtitle!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ),
                
                // Focus Indicator (Optional inner border or overlay)
                if (_isFocused || _isHovered)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
