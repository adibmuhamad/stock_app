import 'package:flutter/material.dart';
import 'package:pelaicons/pelaicons.dart';
import 'package:stock_app/core/constants/palletes.dart';

class AppIcons {
  static Icon marketIcon = const Icon(Pelaicons.cart_3_light_outline);
  static Icon watchlistIcon = const Icon(Pelaicons.heart_light_outline);
  static Icon askIcon = const Icon(Pelaicons.comment_light_outline);
  static Icon newsIcon = const Icon(Pelaicons.megaphone_light_outline);
  static Icon globeIcon = const Icon(Pelaicons.website_light_outline);
  static Icon darkIcon = const Icon(Pelaicons.moon_1_light_outline);
  static Icon lightIcon = const Icon(Pelaicons.sun_light_outline);
  static Icon searchIcon = const Icon(Pelaicons.search_light_outline);
  static Icon bearishIcon = const Icon(Pelaicons.down_arrow_2_light_outline,
      color: Palletes.bearishColor);
  static Icon bullishIcon = const Icon(Pelaicons.up_arrow_2_light_outline,
      color: Palletes.bullishColor);
  static Icon addIcon = const Icon(Pelaicons.add_light_outline);
  static Icon deleteIcon = const Icon(Pelaicons.delete_light_outline);
  static Icon shareIcon = const Icon(Pelaicons.navigation_light_outline);
  static Icon backIcon = const Icon(Icons.chevron_left);
  static Icon closeIcon = const Icon(Icons.close);
}
