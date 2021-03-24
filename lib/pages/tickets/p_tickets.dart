import 'package:flutter/material.dart';
import 'package:fluttour/pages/tickets/tickets_provider.dart';
import 'package:fluttour/utils/app_extension.dart';
import 'package:fluttour/utils/app_route.dart';
import 'package:fluttour/utils/app_enum.dart';
import 'package:fluttour/widgets/p_material.dart';
import 'package:fluttour/widgets/w_header.dart';
import 'package:provider/provider.dart';

class PTickets extends StatefulWidget {
  @override
  _PTicketsState createState() => _PTicketsState();
}

class _PTicketsState extends State<PTickets> with HeaderDelegate {

  TicketsProvider _provider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _provider = Provider.of<TicketsProvider>(context, listen: false);
      _provider.getTickets();
    });
  }

  @override
  void onBack() {
    _provider.ticketModelList = null;
    context.navigator().pop();
  }

  @override
  Widget build(BuildContext context) {
    return PMaterial(
      child: Consumer<TicketsProvider>(
        builder: (BuildContext context, TicketsProvider provider, _) {
          final ticketList = provider?.ticketModelList;
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                WHeader(title: Tutorial.fetchData.getName(), isShowBackButton: true, delegate: this),
                if (ticketList == null)
                  Container(padding: EdgeInsets.only(top: 150.H), child: Text('Loading...'))
                else if (ticketList.length == 0)
                  Text('Data is empty')
                else
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider?.ticketModelList?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(60.SP),
                          child: Text(provider.ticketModelList[index].status + '  /  ' + provider.ticketModelList[index].date),
                        );
                      }),
                  )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
