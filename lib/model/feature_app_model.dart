import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeatureAppItem {
  KeyFeature? key;
  String? title;
  String? description;
  String? icon;
  SectionKey? sectionKey;

  FeatureAppItem(
      {this.key, this.title, this.description, this.icon, this.sectionKey});
}

class FeatureAppSection {
  SectionKey? key;
  String? title;
  List<FeatureAppItem>? feature;

  FeatureAppSection({this.key, this.title, this.feature});
}

class FeatureAppModel {
  SectionKey section;
  List<KeyFeature> features;

  FeatureAppModel({required this.section, required this.features});
}

enum SectionKey {
  crm,
  member,
  hotline;

  String get titleValue {
    switch (this) {
      case SectionKey.crm:
        return 'Quản lý khách hàng';
      case SectionKey.member:
        return 'Quản lý thành viên';
      case SectionKey.hotline:
        return 'Quản lý hotline';
    }
  }
}

enum KeyFeature {
  quanlykhachhang,
  phanQuyenThanhVien,
  danhSachThanhVien,
  nhomThanhVien,
  danhSachHotline;

  String get titleValue {
    switch (this) {
      case KeyFeature.phanQuyenThanhVien:
        return 'Phân quyền thành viên';
      case KeyFeature.danhSachThanhVien:
        return 'Danh sách thành viên';
      case KeyFeature.nhomThanhVien:
        return 'Nhóm thành viên';
      case KeyFeature.danhSachHotline:
        return 'Danh sách thành viên';
      case KeyFeature.quanlykhachhang:
        return 'Quản lý khách hàng';
    }
  }

  String get desValue {
    switch (this) {
      case KeyFeature.phanQuyenThanhVien:
        return 'Giới thiệu phân quyền thành viên';
      case KeyFeature.danhSachThanhVien:
        return 'Giới thiệu danh sách thành viên';
      case KeyFeature.nhomThanhVien:
        return 'Giới thiệu nhóm thành viên';
      case KeyFeature.danhSachHotline:
        return 'Giới thiệu danh sách thành viên';
      case KeyFeature.quanlykhachhang:
        return 'Giới thiệu quản lý khách hàng';
    }
  }

  IconData get iconValue {
    switch (this) {
      case KeyFeature.phanQuyenThanhVien:
        return Icons.schema_outlined;
      case KeyFeature.danhSachThanhVien:
        return CupertinoIcons.square_list;
      case KeyFeature.nhomThanhVien:
        return CupertinoIcons.person_3_fill;
      case KeyFeature.danhSachHotline:
        return CupertinoIcons.square_list;
      case KeyFeature.quanlykhachhang:
        return Icons.badge;
    }
  }
}
