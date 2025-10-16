import 'package:flutter/material.dart';

class DesignVariables extends ThemeExtension<DesignVariables> {
  const DesignVariables._({
    required this.background,
    required this.bannerBgIntDanger,
    required this.bannerBgIntInfo,
    required this.bannerTextIntInfo,
    required this.bgBotBar,
    required this.bgContextMenu,
    required this.bgCounterUnread,
    required this.bgMenuButtonActive,
    required this.bgMenuButtonSelected,
    required this.bgMessageRegular,
    required this.bgTopBar,
    required this.borderBar,
    required this.borderMenuButtonSelected,
    required this.btnBgAttHighIntInfoActive,
    required this.btnBgAttHighIntInfoNormal,
    required this.btnBgAttMediumIntInfoActive,
    required this.btnBgAttMediumIntInfoNormal,
    required this.btnLabelAttHigh,
    required this.btnLabelAttLowIntDanger,
    required this.btnLabelAttLowIntInfo,
    required this.btnLabelAttMediumIntDanger,
    required this.btnLabelAttMediumIntInfo,
    required this.btnShadowAttMed,
    required this.composeBoxBg,
    required this.contextMenuCancelText,
    required this.contextMenuItemBg,
    required this.contextMenuItemIcon,
    required this.contextMenuItemLabel,
    required this.contextMenuItemMeta,
    required this.contextMenuItemText,
    required this.editorButtonPressedBg,
    required this.foreground,
    required this.fabBg,
    required this.fabBgPressed,
    required this.fabLabel,
    required this.fabLabelPressed,
    required this.fabShadow,
    required this.icon,
    required this.iconSelected,
    required this.labelCounterUnread,
    required this.labelEdited,
    required this.labelMenuButton,
    required this.labelSearchPrompt,
    required this.labelTime,
    required this.link,
    required this.listMenuItemBg,
    required this.listMenuItemIcon,
    required this.listMenuItemText,
    required this.mainBackground,
    required this.neutralButtonBg,
    required this.neutralButtonLabel,
    required this.radioBorder,
    required this.radioFillSelected,
    required this.statusAway,
    required this.statusIdle,
    required this.statusOnline,
    required this.textInput,
    required this.title,
    required this.bgSearchInput,
    required this.textMessage,
    required this.textMessageMuted,
    required this.channelColorSwatches,
    required this.avatarPlaceholderBg,
    required this.avatarPlaceholderIcon,
    required this.contextMenuCancelBg,
    required this.contextMenuCancelPressedBg,
    required this.dmHeaderBg,
    required this.inboxItemIconMarker,
    required this.loginOrDivider,
    required this.loginOrDividerText,
    required this.modalBarrierColor,
    required this.mutedUnreadBadge,
    required this.navigationButtonBg,
    required this.sectionCollapseIcon,
    required this.star,
    required this.subscriptionListHeaderLine,
    required this.subscriptionListHeaderText,
    required this.unreadCountBadgeTextForChannel,
    required this.userStatusText,
  });

  final Color background;
  final Color bannerBgIntDanger;
  final Color bannerBgIntInfo;
  final Color bannerTextIntInfo;
  final Color bgBotBar;
  final Color bgContextMenu;
  final Color bgCounterUnread;
  final Color bgMenuButtonActive;
  final Color bgMenuButtonSelected;
  final Color bgMessageRegular;
  final Color bgTopBar;
  final Color borderBar;
  final Color borderMenuButtonSelected;
  final Color btnBgAttHighIntInfoActive;
  final Color btnBgAttHighIntInfoNormal;
  final Color btnBgAttMediumIntInfoActive;
  final Color btnBgAttMediumIntInfoNormal;
  final Color btnLabelAttHigh;
  final Color btnLabelAttLowIntDanger;
  final Color btnLabelAttLowIntInfo;
  final Color btnLabelAttMediumIntDanger;
  final Color btnLabelAttMediumIntInfo;
  final Color btnShadowAttMed;
  final Color composeBoxBg;
  final Color contextMenuCancelText;
  final Color contextMenuItemBg;
  final Color contextMenuItemIcon;
  final Color contextMenuItemLabel;
  final Color contextMenuItemMeta;
  final Color contextMenuItemText;
  final Color editorButtonPressedBg;
  final Color foreground;
  final Color fabBg;
  final Color fabBgPressed;
  final Color fabLabel;
  final Color fabLabelPressed;
  final Color fabShadow;
  final Color icon;
  final Color iconSelected;
  final Color labelCounterUnread;
  final Color labelEdited;
  final Color labelMenuButton;
  final Color labelSearchPrompt;
  final Color labelTime;
  final Color link;
  final Color listMenuItemBg;
  final Color listMenuItemIcon;
  final Color listMenuItemText;
  final Color mainBackground;
  final Color neutralButtonBg;
  final Color neutralButtonLabel;
  final Color radioBorder;
  final Color radioFillSelected;
  final Color statusAway;
  final Color statusIdle;
  final Color statusOnline;
  final Color textInput;
  final Color title;
  final Color bgSearchInput;
  final Color textMessage;
  final Color textMessageMuted;
  final List<Color> channelColorSwatches;
  final Color avatarPlaceholderBg;
  final Color avatarPlaceholderIcon;
  final Color contextMenuCancelBg;
  final Color contextMenuCancelPressedBg;
  final Color dmHeaderBg;
  final Color inboxItemIconMarker;
  final Color loginOrDivider;
  final Color loginOrDividerText;
  final Color modalBarrierColor;
  final Color mutedUnreadBadge;
  final Color navigationButtonBg;
  final Color sectionCollapseIcon;
  final Color star;
  final Color subscriptionListHeaderLine;
  final Color subscriptionListHeaderText;
  final Color unreadCountBadgeTextForChannel;
  final Color userStatusText;

  static const light = DesignVariables._(
    background: Color.fromARGB(255, 255, 255, 255),
    bannerBgIntDanger: Color(0xfff2e4e4),
    bannerBgIntInfo: Color(0xfff8f9fa),
    bannerTextIntInfo: Color(0xff1a5c5c),
    bgBotBar: Color(0xffffffff),
    bgContextMenu: Color(0xffffffff),
    bgCounterUnread: Color(0xffe74c3c),
    bgMenuButtonActive: Color(0xffe3f2fd),
    bgMenuButtonSelected: Color(0xffbbdefb),
    bgMessageRegular: Color(0xffffffff),
    bgTopBar: Color(0xffffffff),
    borderBar: Color(0xffe0e0e0),
    borderMenuButtonSelected: Color(0xff2196f3),
    btnBgAttHighIntInfoActive: Color(0xff1976d2),
    btnBgAttHighIntInfoNormal: Color(0xff2196f3),
    btnBgAttMediumIntInfoActive: Color(0xff42a5f5),
    btnBgAttMediumIntInfoNormal: Color(0xff64b5f6),
    btnLabelAttHigh: Color(0xffffffff),
    btnLabelAttLowIntDanger: Color(0xffd32f2f),
    btnLabelAttLowIntInfo: Color(0xff1976d2),
    btnLabelAttMediumIntDanger: Color(0xffe53935),
    btnLabelAttMediumIntInfo: Color(0xff2196f3),
    btnShadowAttMed: Color(0x1a000000),
    composeBoxBg: Color(0xfff5f5f5),
    contextMenuCancelText: Color(0xff666666),
    contextMenuItemBg: Color(0xffffffff),
    contextMenuItemIcon: Color(0xff666666),
    contextMenuItemLabel: Color(0xff333333),
    contextMenuItemMeta: Color(0xff999999),
    contextMenuItemText: Color(0xff333333),
    editorButtonPressedBg: Color(0xffe0e0e0),
    foreground: Color(0xff000000),
    fabBg: Color(0xff2196f3),
    fabBgPressed: Color(0xff1976d2),
    fabLabel: Color(0xffffffff),
    fabLabelPressed: Color(0xffffffff),
    fabShadow: Color(0x33000000),
    icon: Color(0xff666666),
    iconSelected: Color(0xff2196f3),
    labelCounterUnread: Color(0xffffffff),
    labelEdited: Color(0xff999999),
    labelMenuButton: Color(0xff333333),
    labelSearchPrompt: Color(0xff999999),
    labelTime: Color(0xff999999),
    link: Color(0xff2196f3),
    listMenuItemBg: Color(0xffffffff),
    listMenuItemIcon: Color(0xff666666),
    listMenuItemText: Color(0xff333333),
    mainBackground: Color(0xfff5f5f5),
    neutralButtonBg: Color(0xfff0f0f0),
    neutralButtonLabel: Color(0xff333333),
    radioBorder: Color(0xffcccccc),
    radioFillSelected: Color(0xff2196f3),
    statusAway: Color(0xffff9800),
    statusIdle: Color(0xff9e9e9e),
    statusOnline: Color(0xff4caf50),
    textInput: Color(0xff333333),
    title: Color(0xff333333),
    bgSearchInput: Color(0xfff5f5f5),
    textMessage: Color(0xff333333),
    textMessageMuted: Color(0xff999999),
    channelColorSwatches: [
      Color(0xffe74c3c),
      Color(0xffe67e22),
      Color(0xfff39c12),
      Color(0xfff1c40f),
      Color(0xff2ecc71),
      Color(0xff1abc9c),
      Color(0xff3498db),
      Color(0xff9b59b6),
      Color(0xffe91e63),
      Color(0xff34495e),
    ],
    avatarPlaceholderBg: Color(0xffe0e0e0),
    avatarPlaceholderIcon: Color(0xff999999),
    contextMenuCancelBg: Color(0xfff5f5f5),
    contextMenuCancelPressedBg: Color(0xffe0e0e0),
    dmHeaderBg: Color(0xffffffff),
    inboxItemIconMarker: Color(0xff2196f3),
    loginOrDivider: Color(0xffe0e0e0),
    loginOrDividerText: Color(0xff999999),
    modalBarrierColor: Color(0x80000000),
    mutedUnreadBadge: Color(0xff999999),
    navigationButtonBg: Color(0xffffffff),
    sectionCollapseIcon: Color(0xff666666),
    star: Color(0xffffc107),
    subscriptionListHeaderLine: Color(0xffe0e0e0),
    subscriptionListHeaderText: Color(0xff666666),
    unreadCountBadgeTextForChannel: Color(0xffffffff),
    userStatusText: Color(0xff666666),
  );

  static const dark = DesignVariables._(
    background: Color.fromARGB(255, 18, 18, 18),
    bannerBgIntDanger: Color(0xff4a2c2c),
    bannerBgIntInfo: Color(0xff2a2a2a),
    bannerTextIntInfo: Color(0xff4dd4d4),
    bgBotBar: Color(0xff1e1e1e),
    bgContextMenu: Color(0xff2a2a2a),
    bgCounterUnread: Color(0xffe74c3c),
    bgMenuButtonActive: Color(0xff1e3a5f),
    bgMenuButtonSelected: Color(0xff0d47a1),
    bgMessageRegular: Color(0xff2a2a2a),
    bgTopBar: Color(0xff1e1e1e),
    borderBar: Color(0xff404040),
    borderMenuButtonSelected: Color(0xff64b5f6),
    btnBgAttHighIntInfoActive: Color(0xff1565c0),
    btnBgAttHighIntInfoNormal: Color(0xff1976d2),
    btnBgAttMediumIntInfoActive: Color(0xff1e88e5),
    btnBgAttMediumIntInfoNormal: Color(0xff42a5f5),
    btnLabelAttHigh: Color(0xffffffff),
    btnLabelAttLowIntDanger: Color(0xffef5350),
    btnLabelAttLowIntInfo: Color(0xff64b5f6),
    btnLabelAttMediumIntDanger: Color(0xfff44336),
    btnLabelAttMediumIntInfo: Color(0xff42a5f5),
    btnShadowAttMed: Color(0x33000000),
    composeBoxBg: Color(0xff2a2a2a),
    contextMenuCancelText: Color(0xffcccccc),
    contextMenuItemBg: Color(0xff2a2a2a),
    contextMenuItemIcon: Color(0xffcccccc),
    contextMenuItemLabel: Color(0xffffffff),
    contextMenuItemMeta: Color(0xff999999),
    contextMenuItemText: Color(0xffffffff),
    editorButtonPressedBg: Color(0xff404040),
    foreground: Color(0xffffffff),
    fabBg: Color(0xff1976d2),
    fabBgPressed: Color(0xff1565c0),
    fabLabel: Color(0xffffffff),
    fabLabelPressed: Color(0xffffffff),
    fabShadow: Color(0x33000000),
    icon: Color(0xffcccccc),
    iconSelected: Color(0xff64b5f6),
    labelCounterUnread: Color(0xffffffff),
    labelEdited: Color(0xff999999),
    labelMenuButton: Color(0xffffffff),
    labelSearchPrompt: Color(0xff999999),
    labelTime: Color(0xff999999),
    link: Color(0xff64b5f6),
    listMenuItemBg: Color(0xff2a2a2a),
    listMenuItemIcon: Color(0xffcccccc),
    listMenuItemText: Color(0xffffffff),
    mainBackground: Color(0xff1e1e1e),
    neutralButtonBg: Color(0xff404040),
    neutralButtonLabel: Color(0xffffffff),
    radioBorder: Color(0xff666666),
    radioFillSelected: Color(0xff64b5f6),
    statusAway: Color(0xffffb74d),
    statusIdle: Color(0xff757575),
    statusOnline: Color(0xff66bb6a),
    textInput: Color(0xffffffff),
    title: Color(0xffffffff),
    bgSearchInput: Color(0xff2a2a2a),
    textMessage: Color(0xffffffff),
    textMessageMuted: Color(0xff999999),
    channelColorSwatches: [
      Color(0xffe74c3c),
      Color(0xffe67e22),
      Color(0xfff39c12),
      Color(0xfff1c40f),
      Color(0xff2ecc71),
      Color(0xff1abc9c),
      Color(0xff3498db),
      Color(0xff9b59b6),
      Color(0xffe91e63),
      Color(0xff34495e),
    ],
    avatarPlaceholderBg: Color(0xff404040),
    avatarPlaceholderIcon: Color(0xff999999),
    contextMenuCancelBg: Color(0xff2a2a2a),
    contextMenuCancelPressedBg: Color(0xff404040),
    dmHeaderBg: Color(0xff1e1e1e),
    inboxItemIconMarker: Color(0xff64b5f6),
    loginOrDivider: Color(0xff404040),
    loginOrDividerText: Color(0xff999999),
    modalBarrierColor: Color(0x80000000),
    mutedUnreadBadge: Color(0xff999999),
    navigationButtonBg: Color(0xff1e1e1e),
    sectionCollapseIcon: Color(0xffcccccc),
    star: Color(0xffffc107),
    subscriptionListHeaderLine: Color(0xff404040),
    subscriptionListHeaderText: Color(0xffcccccc),
    unreadCountBadgeTextForChannel: Color(0xffffffff),
    userStatusText: Color(0xffcccccc),
  );

  @override
  DesignVariables copyWith({
    Color? background,
    Color? bannerBgIntDanger,
    Color? bannerBgIntInfo,
    Color? bannerTextIntInfo,
    Color? bgBotBar,
    Color? bgContextMenu,
    Color? bgCounterUnread,
    Color? bgMenuButtonActive,
    Color? bgMenuButtonSelected,
    Color? bgMessageRegular,
    Color? bgTopBar,
    Color? borderBar,
    Color? borderMenuButtonSelected,
    Color? btnBgAttHighIntInfoActive,
    Color? btnBgAttHighIntInfoNormal,
    Color? btnBgAttMediumIntInfoActive,
    Color? btnBgAttMediumIntInfoNormal,
    Color? btnLabelAttHigh,
    Color? btnLabelAttLowIntDanger,
    Color? btnLabelAttLowIntInfo,
    Color? btnLabelAttMediumIntDanger,
    Color? btnLabelAttMediumIntInfo,
    Color? btnShadowAttMed,
    Color? composeBoxBg,
    Color? contextMenuCancelText,
    Color? contextMenuItemBg,
    Color? contextMenuItemIcon,
    Color? contextMenuItemLabel,
    Color? contextMenuItemMeta,
    Color? contextMenuItemText,
    Color? editorButtonPressedBg,
    Color? foreground,
    Color? fabBg,
    Color? fabBgPressed,
    Color? fabLabel,
    Color? fabLabelPressed,
    Color? fabShadow,
    Color? icon,
    Color? iconSelected,
    Color? labelCounterUnread,
    Color? labelEdited,
    Color? labelMenuButton,
    Color? labelSearchPrompt,
    Color? labelTime,
    Color? link,
    Color? listMenuItemBg,
    Color? listMenuItemIcon,
    Color? listMenuItemText,
    Color? mainBackground,
    Color? neutralButtonBg,
    Color? neutralButtonLabel,
    Color? radioBorder,
    Color? radioFillSelected,
    Color? statusAway,
    Color? statusIdle,
    Color? statusOnline,
    Color? textInput,
    Color? title,
    Color? bgSearchInput,
    Color? textMessage,
    Color? textMessageMuted,
    List<Color>? channelColorSwatches,
    Color? avatarPlaceholderBg,
    Color? avatarPlaceholderIcon,
    Color? contextMenuCancelBg,
    Color? contextMenuCancelPressedBg,
    Color? dmHeaderBg,
    Color? inboxItemIconMarker,
    Color? loginOrDivider,
    Color? loginOrDividerText,
    Color? modalBarrierColor,
    Color? mutedUnreadBadge,
    Color? navigationButtonBg,
    Color? sectionCollapseIcon,
    Color? star,
    Color? subscriptionListHeaderLine,
    Color? subscriptionListHeaderText,
    Color? unreadCountBadgeTextForChannel,
    Color? userStatusText,
  }) {
    return DesignVariables._(
      background: background ?? this.background,
      bannerBgIntDanger: bannerBgIntDanger ?? this.bannerBgIntDanger,
      bannerBgIntInfo: bannerBgIntInfo ?? this.bannerBgIntInfo,
      bannerTextIntInfo: bannerTextIntInfo ?? this.bannerTextIntInfo,
      bgBotBar: bgBotBar ?? this.bgBotBar,
      bgContextMenu: bgContextMenu ?? this.bgContextMenu,
      bgCounterUnread: bgCounterUnread ?? this.bgCounterUnread,
      bgMenuButtonActive: bgMenuButtonActive ?? this.bgMenuButtonActive,
      bgMenuButtonSelected: bgMenuButtonSelected ?? this.bgMenuButtonSelected,
      bgMessageRegular: bgMessageRegular ?? this.bgMessageRegular,
      bgTopBar: bgTopBar ?? this.bgTopBar,
      borderBar: borderBar ?? this.borderBar,
      borderMenuButtonSelected:
          borderMenuButtonSelected ?? this.borderMenuButtonSelected,
      btnBgAttHighIntInfoActive:
          btnBgAttHighIntInfoActive ?? this.btnBgAttHighIntInfoActive,
      btnBgAttHighIntInfoNormal:
          btnBgAttHighIntInfoNormal ?? this.btnBgAttHighIntInfoNormal,
      btnBgAttMediumIntInfoActive:
          btnBgAttMediumIntInfoActive ?? this.btnBgAttMediumIntInfoActive,
      btnBgAttMediumIntInfoNormal:
          btnBgAttMediumIntInfoNormal ?? this.btnBgAttMediumIntInfoNormal,
      btnLabelAttHigh: btnLabelAttHigh ?? this.btnLabelAttHigh,
      btnLabelAttLowIntDanger:
          btnLabelAttLowIntDanger ?? this.btnLabelAttLowIntDanger,
      btnLabelAttLowIntInfo:
          btnLabelAttLowIntInfo ?? this.btnLabelAttLowIntInfo,
      btnLabelAttMediumIntDanger:
          btnLabelAttMediumIntDanger ?? this.btnLabelAttMediumIntDanger,
      btnLabelAttMediumIntInfo:
          btnLabelAttMediumIntInfo ?? this.btnLabelAttMediumIntInfo,
      btnShadowAttMed: btnShadowAttMed ?? this.btnShadowAttMed,
      composeBoxBg: composeBoxBg ?? this.composeBoxBg,
      contextMenuCancelText:
          contextMenuCancelText ?? this.contextMenuCancelText,
      contextMenuItemBg: contextMenuItemBg ?? this.contextMenuItemBg,
      contextMenuItemIcon: contextMenuItemIcon ?? this.contextMenuItemIcon,
      contextMenuItemLabel: contextMenuItemLabel ?? this.contextMenuItemLabel,
      contextMenuItemMeta: contextMenuItemMeta ?? this.contextMenuItemMeta,
      contextMenuItemText: contextMenuItemText ?? this.contextMenuItemText,
      editorButtonPressedBg:
          editorButtonPressedBg ?? this.editorButtonPressedBg,
      foreground: foreground ?? this.foreground,
      fabBg: fabBg ?? this.fabBg,
      fabBgPressed: fabBgPressed ?? this.fabBgPressed,
      fabLabel: fabLabel ?? this.fabLabel,
      fabLabelPressed: fabLabelPressed ?? this.fabLabelPressed,
      fabShadow: fabShadow ?? this.fabShadow,
      icon: icon ?? this.icon,
      iconSelected: iconSelected ?? this.iconSelected,
      labelCounterUnread: labelCounterUnread ?? this.labelCounterUnread,
      labelEdited: labelEdited ?? this.labelEdited,
      labelMenuButton: labelMenuButton ?? this.labelMenuButton,
      labelSearchPrompt: labelSearchPrompt ?? this.labelSearchPrompt,
      labelTime: labelTime ?? this.labelTime,
      link: link ?? this.link,
      listMenuItemBg: listMenuItemBg ?? this.listMenuItemBg,
      listMenuItemIcon: listMenuItemIcon ?? this.listMenuItemIcon,
      listMenuItemText: listMenuItemText ?? this.listMenuItemText,
      mainBackground: mainBackground ?? this.mainBackground,
      neutralButtonBg: neutralButtonBg ?? this.neutralButtonBg,
      neutralButtonLabel: neutralButtonLabel ?? this.neutralButtonLabel,
      radioBorder: radioBorder ?? this.radioBorder,
      radioFillSelected: radioFillSelected ?? this.radioFillSelected,
      statusAway: statusAway ?? this.statusAway,
      statusIdle: statusIdle ?? this.statusIdle,
      statusOnline: statusOnline ?? this.statusOnline,
      textInput: textInput ?? this.textInput,
      title: title ?? this.title,
      bgSearchInput: bgSearchInput ?? this.bgSearchInput,
      textMessage: textMessage ?? this.textMessage,
      textMessageMuted: textMessageMuted ?? this.textMessageMuted,
      channelColorSwatches: channelColorSwatches ?? this.channelColorSwatches,
      avatarPlaceholderBg: avatarPlaceholderBg ?? this.avatarPlaceholderBg,
      avatarPlaceholderIcon:
          avatarPlaceholderIcon ?? this.avatarPlaceholderIcon,
      contextMenuCancelBg: contextMenuCancelBg ?? this.contextMenuCancelBg,
      contextMenuCancelPressedBg:
          contextMenuCancelPressedBg ?? this.contextMenuCancelPressedBg,
      dmHeaderBg: dmHeaderBg ?? this.dmHeaderBg,
      inboxItemIconMarker: inboxItemIconMarker ?? this.inboxItemIconMarker,
      loginOrDivider: loginOrDivider ?? this.loginOrDivider,
      loginOrDividerText: loginOrDividerText ?? this.loginOrDividerText,
      modalBarrierColor: modalBarrierColor ?? this.modalBarrierColor,
      mutedUnreadBadge: mutedUnreadBadge ?? this.mutedUnreadBadge,
      navigationButtonBg: navigationButtonBg ?? this.navigationButtonBg,
      sectionCollapseIcon: sectionCollapseIcon ?? this.sectionCollapseIcon,
      star: star ?? this.star,
      subscriptionListHeaderLine:
          subscriptionListHeaderLine ?? this.subscriptionListHeaderLine,
      subscriptionListHeaderText:
          subscriptionListHeaderText ?? this.subscriptionListHeaderText,
      unreadCountBadgeTextForChannel:
          unreadCountBadgeTextForChannel ?? this.unreadCountBadgeTextForChannel,
      userStatusText: userStatusText ?? this.userStatusText,
    );
  }

  @override
  DesignVariables lerp(ThemeExtension<DesignVariables>? other, double t) {
    if (other is! DesignVariables) {
      return this;
    }
    return DesignVariables._(
      background: Color.lerp(background, other.background, t)!,
      bannerBgIntDanger: Color.lerp(
        bannerBgIntDanger,
        other.bannerBgIntDanger,
        t,
      )!,
      bannerBgIntInfo: Color.lerp(bannerBgIntInfo, other.bannerBgIntInfo, t)!,
      bannerTextIntInfo: Color.lerp(
        bannerTextIntInfo,
        other.bannerTextIntInfo,
        t,
      )!,
      bgBotBar: Color.lerp(bgBotBar, other.bgBotBar, t)!,
      bgContextMenu: Color.lerp(bgContextMenu, other.bgContextMenu, t)!,
      bgCounterUnread: Color.lerp(bgCounterUnread, other.bgCounterUnread, t)!,
      bgMenuButtonActive: Color.lerp(
        bgMenuButtonActive,
        other.bgMenuButtonActive,
        t,
      )!,
      bgMenuButtonSelected: Color.lerp(
        bgMenuButtonSelected,
        other.bgMenuButtonSelected,
        t,
      )!,
      bgMessageRegular: Color.lerp(
        bgMessageRegular,
        other.bgMessageRegular,
        t,
      )!,
      bgTopBar: Color.lerp(bgTopBar, other.bgTopBar, t)!,
      borderBar: Color.lerp(borderBar, other.borderBar, t)!,
      borderMenuButtonSelected: Color.lerp(
        borderMenuButtonSelected,
        other.borderMenuButtonSelected,
        t,
      )!,
      btnBgAttHighIntInfoActive: Color.lerp(
        btnBgAttHighIntInfoActive,
        other.btnBgAttHighIntInfoActive,
        t,
      )!,
      btnBgAttHighIntInfoNormal: Color.lerp(
        btnBgAttHighIntInfoNormal,
        other.btnBgAttHighIntInfoNormal,
        t,
      )!,
      btnBgAttMediumIntInfoActive: Color.lerp(
        btnBgAttMediumIntInfoActive,
        other.btnBgAttMediumIntInfoActive,
        t,
      )!,
      btnBgAttMediumIntInfoNormal: Color.lerp(
        btnBgAttMediumIntInfoNormal,
        other.btnBgAttMediumIntInfoNormal,
        t,
      )!,
      btnLabelAttHigh: Color.lerp(btnLabelAttHigh, other.btnLabelAttHigh, t)!,
      btnLabelAttLowIntDanger: Color.lerp(
        btnLabelAttLowIntDanger,
        other.btnLabelAttLowIntDanger,
        t,
      )!,
      btnLabelAttLowIntInfo: Color.lerp(
        btnLabelAttLowIntInfo,
        other.btnLabelAttLowIntInfo,
        t,
      )!,
      btnLabelAttMediumIntDanger: Color.lerp(
        btnLabelAttMediumIntDanger,
        other.btnLabelAttMediumIntDanger,
        t,
      )!,
      btnLabelAttMediumIntInfo: Color.lerp(
        btnLabelAttMediumIntInfo,
        other.btnLabelAttMediumIntInfo,
        t,
      )!,
      btnShadowAttMed: Color.lerp(btnShadowAttMed, other.btnShadowAttMed, t)!,
      composeBoxBg: Color.lerp(composeBoxBg, other.composeBoxBg, t)!,
      contextMenuCancelText: Color.lerp(
        contextMenuCancelText,
        other.contextMenuCancelText,
        t,
      )!,
      contextMenuItemBg: Color.lerp(
        contextMenuItemBg,
        other.contextMenuItemBg,
        t,
      )!,
      contextMenuItemIcon: Color.lerp(
        contextMenuItemIcon,
        other.contextMenuItemIcon,
        t,
      )!,
      contextMenuItemLabel: Color.lerp(
        contextMenuItemLabel,
        other.contextMenuItemLabel,
        t,
      )!,
      contextMenuItemMeta: Color.lerp(
        contextMenuItemMeta,
        other.contextMenuItemMeta,
        t,
      )!,
      contextMenuItemText: Color.lerp(
        contextMenuItemText,
        other.contextMenuItemText,
        t,
      )!,
      editorButtonPressedBg: Color.lerp(
        editorButtonPressedBg,
        other.editorButtonPressedBg,
        t,
      )!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      fabBg: Color.lerp(fabBg, other.fabBg, t)!,
      fabBgPressed: Color.lerp(fabBgPressed, other.fabBgPressed, t)!,
      fabLabel: Color.lerp(fabLabel, other.fabLabel, t)!,
      fabLabelPressed: Color.lerp(fabLabelPressed, other.fabLabelPressed, t)!,
      fabShadow: Color.lerp(fabShadow, other.fabShadow, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      iconSelected: Color.lerp(iconSelected, other.iconSelected, t)!,
      labelCounterUnread: Color.lerp(
        labelCounterUnread,
        other.labelCounterUnread,
        t,
      )!,
      labelEdited: Color.lerp(labelEdited, other.labelEdited, t)!,
      labelMenuButton: Color.lerp(labelMenuButton, other.labelMenuButton, t)!,
      labelSearchPrompt: Color.lerp(
        labelSearchPrompt,
        other.labelSearchPrompt,
        t,
      )!,
      labelTime: Color.lerp(labelTime, other.labelTime, t)!,
      link: Color.lerp(link, other.link, t)!,
      listMenuItemBg: Color.lerp(listMenuItemBg, other.listMenuItemBg, t)!,
      listMenuItemIcon: Color.lerp(
        listMenuItemIcon,
        other.listMenuItemIcon,
        t,
      )!,
      listMenuItemText: Color.lerp(
        listMenuItemText,
        other.listMenuItemText,
        t,
      )!,
      mainBackground: Color.lerp(mainBackground, other.mainBackground, t)!,
      neutralButtonBg: Color.lerp(neutralButtonBg, other.neutralButtonBg, t)!,
      neutralButtonLabel: Color.lerp(
        neutralButtonLabel,
        other.neutralButtonLabel,
        t,
      )!,
      radioBorder: Color.lerp(radioBorder, other.radioBorder, t)!,
      radioFillSelected: Color.lerp(
        radioFillSelected,
        other.radioFillSelected,
        t,
      )!,
      statusAway: Color.lerp(statusAway, other.statusAway, t)!,
      statusIdle: Color.lerp(statusIdle, other.statusIdle, t)!,
      statusOnline: Color.lerp(statusOnline, other.statusOnline, t)!,
      textInput: Color.lerp(textInput, other.textInput, t)!,
      title: Color.lerp(title, other.title, t)!,
      bgSearchInput: Color.lerp(bgSearchInput, other.bgSearchInput, t)!,
      textMessage: Color.lerp(textMessage, other.textMessage, t)!,
      textMessageMuted: Color.lerp(
        textMessageMuted,
        other.textMessageMuted,
        t,
      )!,
      channelColorSwatches: List.generate(
        channelColorSwatches.length,
        (index) => Color.lerp(
          channelColorSwatches[index],
          other.channelColorSwatches[index],
          t,
        )!,
      ),
      avatarPlaceholderBg: Color.lerp(
        avatarPlaceholderBg,
        other.avatarPlaceholderBg,
        t,
      )!,
      avatarPlaceholderIcon: Color.lerp(
        avatarPlaceholderIcon,
        other.avatarPlaceholderIcon,
        t,
      )!,
      contextMenuCancelBg: Color.lerp(
        contextMenuCancelBg,
        other.contextMenuCancelBg,
        t,
      )!,
      contextMenuCancelPressedBg: Color.lerp(
        contextMenuCancelPressedBg,
        other.contextMenuCancelPressedBg,
        t,
      )!,
      dmHeaderBg: Color.lerp(dmHeaderBg, other.dmHeaderBg, t)!,
      inboxItemIconMarker: Color.lerp(
        inboxItemIconMarker,
        other.inboxItemIconMarker,
        t,
      )!,
      loginOrDivider: Color.lerp(loginOrDivider, other.loginOrDivider, t)!,
      loginOrDividerText: Color.lerp(
        loginOrDividerText,
        other.loginOrDividerText,
        t,
      )!,
      modalBarrierColor: Color.lerp(
        modalBarrierColor,
        other.modalBarrierColor,
        t,
      )!,
      mutedUnreadBadge: Color.lerp(
        mutedUnreadBadge,
        other.mutedUnreadBadge,
        t,
      )!,
      navigationButtonBg: Color.lerp(
        navigationButtonBg,
        other.navigationButtonBg,
        t,
      )!,
      sectionCollapseIcon: Color.lerp(
        sectionCollapseIcon,
        other.sectionCollapseIcon,
        t,
      )!,
      star: Color.lerp(star, other.star, t)!,
      subscriptionListHeaderLine: Color.lerp(
        subscriptionListHeaderLine,
        other.subscriptionListHeaderLine,
        t,
      )!,
      subscriptionListHeaderText: Color.lerp(
        subscriptionListHeaderText,
        other.subscriptionListHeaderText,
        t,
      )!,
      unreadCountBadgeTextForChannel: Color.lerp(
        unreadCountBadgeTextForChannel,
        other.unreadCountBadgeTextForChannel,
        t,
      )!,
      userStatusText: Color.lerp(userStatusText, other.userStatusText, t)!,
    );
  }
}

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color errorColor = Color(0xFFB00020);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: DesignVariables.light.background,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: DesignVariables.light.background,
        foregroundColor: Colors.black87,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        color: DesignVariables.light.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: DesignVariables.light.bgBotBar,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[600],
      ),
      extensions: const [DesignVariables.light],
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: DesignVariables.dark.background,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: DesignVariables.dark.background,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        color: DesignVariables.dark.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: DesignVariables.dark.bgBotBar,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[400],
      ),
      extensions: const [DesignVariables.dark],
    );
  }
}

// Extension để dễ dàng truy cập DesignVariables
extension DesignVariablesExtension on ThemeData {
  DesignVariables get designVariables => extension<DesignVariables>()!;
}

extension DesignVariablesContextExtension on BuildContext {
  DesignVariables get designVariables => Theme.of(this).designVariables;
}
