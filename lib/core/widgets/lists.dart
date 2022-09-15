import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'loadings.dart';
import 'placeholders.dart';

class VList extends StatelessWidget {
  final bool loading;
  final String errorMsg;
  final int length;
  final Widget? emptyPlaceHolder;
  final Future<void> Function() onRefresh;
  final Widget Function(BuildContext c, int i) itemBuilder;
  final double? height;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final ScrollController? controller;
  final Axis scrollDirection;
  final Widget? separator;

  const VList({
    required this.loading,
    required this.length,
    required this.itemBuilder,
    required this.onRefresh,

    /// Error message should not be hardcoded except empty string
    required this.errorMsg,
    this.emptyPlaceHolder,
    this.height = 16.0,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.separator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) return const VLoading();
    if (errorMsg.isNotEmpty) return VError(errorMsg);
    if (length == 0) return Center(child: emptyPlaceHolder ?? const NoData());
    if (controller != null) {
      SchedulerBinding.instance
          ?.addPostFrameCallback((_) => scrollToEnd(controller!));
    }
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        scrollDirection: scrollDirection,
        controller: controller,
        shrinkWrap: shrinkWrap,
        physics: physics,
        padding: padding ?? const EdgeInsets.all(16.0),
        itemCount: length,
        separatorBuilder: (c, i) => separator ?? SizedBox(height: height),
        itemBuilder: itemBuilder,
      ),
    );
  }
}

class VPaginatedList extends StatelessWidget {
  final bool loading;
  final int page;
  final String errorMsg;
  final int length;
  final Widget? emptyPlaceHolder;
  final Future<void> Function() onRefresh;
  final Widget Function(BuildContext c, int i) itemBuilder;
  final double? height;
  final EdgeInsets? padding;
  final Function onNext;
  final Color? dividerColor;
  final Axis scrollDirection;
  final Widget? separator;
  final Widget? loadingPlaceholder;
  final ScrollController? scrollController;

  const VPaginatedList({
    Key? key,
    required this.loading,
    required this.page,
    required this.length,
    required this.itemBuilder,
    required this.onNext,
    required this.onRefresh,
    this.height,
    this.padding,
    required this.errorMsg,
    this.emptyPlaceHolder,
    this.dividerColor,
    this.scrollDirection = Axis.vertical,
    this.separator,
    this.loadingPlaceholder,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading && page == 1) {
      return loadingPlaceholder ?? const VLoading();
    }
    if (errorMsg.isNotEmpty && page == 1) {
      return VError(errorMsg);
    }
    if (length == 0) return Center(child: emptyPlaceHolder ?? const NoData());
    return Stack(
      children: [
        NotificationListener(
          child: RefreshIndicator(
            onRefresh: onRefresh, // must return async
            child: ListView.separated(
              controller: scrollController,
              scrollDirection: scrollDirection,
              padding: padding ?? const EdgeInsets.all(16.0),
              itemCount: length,
              separatorBuilder: (c, i) =>
                  separator ??
                  Divider(
                    height: height,
                    color: dividerColor,
                  ),
              itemBuilder: itemBuilder,
            ),
          ),
          onNotification: (ScrollUpdateNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              onNext();
            }
            return true;
          },
        ),
        if (loading && page > 1) const NextPageLoading(),
      ],
    );
  }
}

class VPaginatedGrid extends StatelessWidget {
  final bool loading;
  final int page;
  final String errorMsg;
  final int length;
  final Widget? emptyPlaceHolder;
  final Future<void> Function() onRefresh;
  final Widget Function(BuildContext c, int i) itemBuilder;
  final EdgeInsets? padding;
  final Function onNext;
  final double aspectRatio;
  final Widget? loadingPlaceholder;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int axisCount;
  final double spacing;

  const VPaginatedGrid({
    Key? key,
    required this.loading,
    required this.page,
    required this.length,
    required this.itemBuilder,
    required this.onNext,
    required this.onRefresh,
    this.padding,
    required this.errorMsg,
    this.emptyPlaceHolder,
    this.aspectRatio = 150 / 169,
    this.loadingPlaceholder,
    this.shrinkWrap = false,
    this.physics,
    this.axisCount = 2,
    this.spacing = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading && page == 1) {
      return loadingPlaceholder ?? const VLoading();
    }
    if (errorMsg.isNotEmpty && page == 1) {
      return VError(errorMsg);
    }
    if (length == 0) return Center(child: emptyPlaceHolder ?? const NoData());
    return Stack(
      children: [
        NotificationListener(
          child: RefreshIndicator(
            onRefresh: onRefresh, // must return async
            child: GridView.builder(
              physics: physics,
              shrinkWrap: shrinkWrap,
              padding: padding ?? const EdgeInsets.all(16.0),
              itemCount: length,
              itemBuilder: itemBuilder,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: axisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: aspectRatio,
              ),
            ),
          ),
          onNotification: (ScrollUpdateNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              onNext();
            }
            return true;
          },
        ),
        if (loading && page > 1) const NextPageLoading(),
      ],
    );
  }
}

scrollToEnd(ScrollController controller) {
  Timer(const Duration(milliseconds: 50), () async {
    if (controller.hasClients) {
      controller.animateTo(
        controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  });
}
