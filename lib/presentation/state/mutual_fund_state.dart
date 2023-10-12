part of '../cubit/mutual_fund_cubit.dart';

abstract class MutualFundState {}

class MutualFundInitial extends MutualFundState {}

class MutualFundLoading extends MutualFundState {}

class MutualFundLoaded extends MutualFundState {
  final Data data;

  MutualFundLoaded(this.data);
}

class MutualFundError extends MutualFundState {
  final String error;

  MutualFundError(this.error);
}
