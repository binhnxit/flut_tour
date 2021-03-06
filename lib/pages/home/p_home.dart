
import 'package:flutter/material.dart';
import 'package:fluttour/generated/l10n.dart';
import 'package:fluttour/pages/home/home_provider.dart';
import 'package:fluttour/pages/home/w_tutorial_item.dart';
import 'package:fluttour/services/app/dynamic_size.dart';
import 'package:fluttour/utils/app_color.dart';
import 'package:fluttour/utils/app_enum.dart';
import 'package:fluttour/widgets/p_material.dart';
import 'package:fluttour/widgets/w_header.dart';
import 'package:provider/provider.dart';
import 'package:fluttour/utils/app_extension.dart';
import 'package:fluttour/utils/app_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with DynamicSize, HeaderDelegate {

  HomeProvider _homeProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _homeProvider = Provider.of<HomeProvider>(context, listen: false);
      _homeProvider.setupData();
    });
  }

  @override
  Widget build(BuildContext context) {
    initDynamicSize(context);
    return PMaterial(
      child: Container(
        color: Colors.white,
        child: Column (
          children: <Widget>[
            WHeader(title: S.of(context).home, bgColor: AppColors.grey, isShowBackButton: false, delegate: this),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 17.W, right: 17.W),
                child: Selector<HomeProvider, List<Tutorial>>(
                  selector: (_, HomeProvider provider) => provider.listTutorial,
                  builder: (_, List<Tutorial> data, __) {
                    return ListView.builder(
                      itemCount:  data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return WTutorialItem(tutorial: data[index], onPressItem: () {
                          switch (Tutorial.values[index]) {
                            case Tutorial.layoutState:
                              return context.navigator().pushNamed(AppRoute.routeLayoutState);
                            case Tutorial.gridView:
                              return context.navigator().pushNamed(AppRoute.routeCollectionGrid);
                            case Tutorial.fetchData:
                              return context.navigator().pushNamed(AppRoute.routeFetchData);
                            default:
                              return null;
                          }
                        },);
                      }
                    );
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onBack() {
    // TODO: implement onBack
  }
}
