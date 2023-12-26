import 'package:app_vbot/app/widgets/base/base.dart';
import 'package:app_vbot/app/widgets/feature/feature_item.dart';
import 'package:app_vbot/bootstrap/helpers.dart';
import 'package:app_vbot/constant.dart';
import 'package:app_vbot/model/feature_app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturePage extends StatefulWidget {
  const FeaturePage({super.key});

  @override
  State<FeaturePage> createState() => _FeaturePageState();
}

class _FeaturePageState extends State<FeaturePage> {
  List<FeatureAppModel>? keyFeatureSearch;
  List<FeatureAppModel>? keyFeature;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  initState() {
    super.initState();
    getFeatureData();
  }

  getFeatureData() async {
    keyFeature = [];
    keyFeatureSearch = [];

    keyFeature = [
      FeatureAppModel(
          section: SectionKey.crm, features: [KeyFeature.quanlykhachhang]),
      FeatureAppModel(section: SectionKey.member, features: [
        KeyFeature.phanQuyenThanhVien,
        KeyFeature.danhSachThanhVien,
        KeyFeature.nhomThanhVien
      ]),
    ];
    keyFeatureSearch = keyFeature;
  }

  searchFeature(String keySearch) {
    // _isLoading.value = true;
    keyFeatureSearch = [];
    if (keySearch != '') {
      if (keyFeature != null) {
        for (var item in keyFeature!) {
          List<KeyFeature> listFeatures = item.features
              .where((e) => (e.titleValue
                  .toLowerCase()
                  .contains(keySearch.toLowerCase())))
              .toList();

          print(listFeatures);

          if (listFeatures.isNotEmpty) {
            setState(() {
              keyFeatureSearch?.add(
                FeatureAppModel(section: item.section, features: listFeatures),
              );
            });
          }
          listFeatures = [];
        }

        print(keyFeatureSearch);
      }
    } else {
      keyFeatureSearch = keyFeature;
    }
  }

  Widget _buildListFeature() {
    List<Widget> result = [];
    if (keyFeatureSearch != null) {
      final List uniqueList = Set.from(keyFeatureSearch!).toList();
      result = uniqueList.map((feature) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(feature.section.titleValue),
              const VBaseSpace(),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  for (var item in feature.features) ...[
                    FeatureItem(
                        item: item,
                        onPressed: () {
                          switch (item) {
                            case KeyFeature.phanQuyenThanhVien:
                              context.go('/feature/permission');
                              break;
                            case KeyFeature.danhSachThanhVien:
                              context.go('/feature/members');
                              break;
                            case KeyFeature.nhomThanhVien:
                              context.go('/feature/groupmembers');
                              break;
                            case KeyFeature.quanlykhachhang:
                              context.go('/feature/crm');
                              break;
                            default:
                          }
                        })
                  ]
                ],
              ),
            ],
          ),
        );
      }).toList();
      return (keyFeatureSearch != null)
          ? Wrap(
              spacing: 12,
              runSpacing: 12,
              children: result,
            )
          : const SizedBox();
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chức năng',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SearchBar(
              elevation: const MaterialStatePropertyAll<double>(0),
              shadowColor: const MaterialStatePropertyAll(Colors.transparent),
              side: MaterialStatePropertyAll(
                BorderSide(width: .3, color: borderColor),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              leading: const Icon(
                CupertinoIcons.search,
                size: 20,
              ),
              hintText: 'Tìm kiếm',
              onSubmitted: (value) {
                _debouncer.run(() {
                  setState(() {
                    searchFeature(value);
                  });
                });
              },
              onChanged: (value) {
                _debouncer.run(() {
                  setState(() {
                    searchFeature(value);
                  });
                });
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Wrap(
                runSpacing: 16,
                spacing: 16,
                children: [_buildListFeature()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
