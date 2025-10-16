import 'package:flutter/material.dart';
import '../../../core/config/app_theme.dart';

class AppListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;
  final Color? tileColor;
  final Color? selectedTileColor;

  const AppListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.enabled = true,
    this.contentPadding,
    this.tileColor,
    this.selectedTileColor,
  });

  @override
  Widget build(BuildContext context) {
    final designVars = context.designVariables;

    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: designVars.listMenuItemText, fontSize: 16),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: designVars.textMessageMuted,
                fontSize: 14,
              ),
            )
          : null,
      leading: leading,
      trailing: trailing,
      onTap: enabled ? onTap : null,
      enabled: enabled,
      contentPadding: contentPadding,
      tileColor: tileColor ?? designVars.listMenuItemBg,
      selectedTileColor: selectedTileColor ?? designVars.bgMenuButtonSelected,
    );
  }
}

class AppSectionList extends StatelessWidget {
  final List<AppSection> sections;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const AppSectionList({
    super.key,
    required this.sections,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    final designVars = context.designVariables;

    return ListView.builder(
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: sections.length,
      itemBuilder: (context, sectionIndex) {
        final section = sections[sectionIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (section.title != null) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  section.title!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: designVars.btnLabelAttMediumIntInfo,
                  ),
                ),
              ),
            ],
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              color: designVars.background,
              child: Column(
                children: section.items.map((item) => item).toList(),
              ),
            ),
            if (sectionIndex < sections.length - 1) const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}

class AppSection {
  final String? title;
  final List<Widget> items;

  const AppSection({this.title, required this.items});
}

class AppExpandableListTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? leading;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry? contentPadding;

  const AppExpandableListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.child,
    this.leading,
    this.initiallyExpanded = false,
    this.contentPadding,
  });

  @override
  State<AppExpandableListTile> createState() => _AppExpandableListTileState();
}

class _AppExpandableListTileState extends State<AppExpandableListTile> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final designVars = context.designVariables;

    return Column(
      children: [
        ListTile(
          title: Text(
            widget.title,
            style: TextStyle(color: designVars.listMenuItemText, fontSize: 16),
          ),
          subtitle: widget.subtitle != null
              ? Text(
                  widget.subtitle!,
                  style: TextStyle(
                    color: designVars.textMessageMuted,
                    fontSize: 14,
                  ),
                )
              : null,
          leading: widget.leading,
          trailing: Icon(
            _isExpanded ? Icons.expand_less : Icons.expand_more,
            color: designVars.listMenuItemIcon,
          ),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          contentPadding: widget.contentPadding,
          tileColor: designVars.listMenuItemBg,
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: widget.child,
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}

class AppSearchableList<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) itemTitle;
  final String Function(T)? itemSubtitle;
  final Widget Function(T)? itemLeading;
  final Widget Function(T)? itemTrailing;
  final void Function(T)? onItemTap;
  final String? searchHint;
  final bool showSearchBar;

  const AppSearchableList({
    super.key,
    required this.items,
    required this.itemTitle,
    this.itemSubtitle,
    this.itemLeading,
    this.itemTrailing,
    this.onItemTap,
    this.searchHint,
    this.showSearchBar = true,
  });

  @override
  State<AppSearchableList<T>> createState() => _AppSearchableListState<T>();
}

class _AppSearchableListState<T> extends State<AppSearchableList<T>> {
  late List<T> _filteredItems;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(widget.items);
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      _filteredItems = widget.items.where((item) {
        final title = widget.itemTitle(item).toLowerCase();
        final subtitle = widget.itemSubtitle?.call(item).toLowerCase() ?? '';
        return title.contains(query) || subtitle.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.showSearchBar) ...[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: widget.searchHint ?? 'Tìm kiếm...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
        Expanded(
          child: _filteredItems.isEmpty
              ? Center(
                  child: Text(
                    'Không tìm thấy kết quả nào',
                    style: TextStyle(
                      color: context.designVariables.textMessageMuted,
                      fontSize: 14,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = _filteredItems[index];
                    return AppListTile(
                      title: widget.itemTitle(item),
                      subtitle: widget.itemSubtitle?.call(item),
                      leading: widget.itemLeading?.call(item),
                      trailing: widget.itemTrailing?.call(item),
                      onTap: widget.onItemTap != null
                          ? () => widget.onItemTap!(item)
                          : null,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
