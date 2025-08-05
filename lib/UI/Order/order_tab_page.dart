import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple/Bloc/Order/order_list_bloc.dart';
import 'package:simple/Bloc/demo/demo_bloc.dart';
import 'package:simple/Reusable/color.dart';
import 'package:simple/UI/Order/order_list.dart';

class OrdersTabbedScreen extends StatelessWidget {
  final VoidCallback? onRefresh;
  final GlobalKey<OrderViewViewState>? orderAllKey;
  const OrdersTabbedScreen({
    super.key,
    this.onRefresh,
    this.orderAllKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderTodayBloc(),
      child: OrderTabViewView(
        onRefresh: onRefresh,
        orderAllKey: orderAllKey,
      ),
    );
  }
}

class OrderTabViewView extends StatefulWidget {
  final VoidCallback? onRefresh;
  final GlobalKey<OrderViewViewState>? orderAllKey;
  const OrderTabViewView({
    super.key,
    this.onRefresh,
    this.orderAllKey,
  });

  @override
  OrderTabViewViewState createState() => OrderTabViewViewState();
}

class OrderTabViewViewState extends State<OrderTabViewView>
    with SingleTickerProviderStateMixin {
  bool hasRefreshedOrder = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0 && !hasRefreshedOrder) {
        hasRefreshedOrder = true;
        widget.orderAllKey?.currentState?.refreshOrders();
        setState(() {});
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_tabController.index == 0 && widget.orderAllKey != null) {
        widget.orderAllKey?.currentState?.refreshOrders();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContainer() {
      return DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Today's Orders",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: appPrimaryColor,
                ),
              ),
            ),
            const TabBar(
              labelColor: appPrimaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: appPrimaryColor,
              tabs: [
                Tab(text: "All"),
                Tab(text: "Takeaway"),
                Tab(text: "Dine-in"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  !hasRefreshedOrder && widget.orderAllKey != null
                      ? OrderViewView(key: widget.orderAllKey, type: 'All')
                      : OrderView(type: 'All'),
                  OrderView(type: 'Takeaway'),
                  OrderView(type: 'Dine-in'),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<DemoBloc, dynamic>(
      buildWhen: ((previous, current) {
        return false;
      }),
      builder: (context, dynamic) {
        return mainContainer();
      },
    );
  }
}
