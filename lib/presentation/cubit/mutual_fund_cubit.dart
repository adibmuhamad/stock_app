import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/data/models/mutual_fund_model.dart';
import 'package:stock_app/domain/entities/chart.dart';
import 'package:stock_app/domain/repositories/mutual_fund_repository.dart';

part '../state/mutual_fund_state.dart';

class MutualFundCubit extends Cubit<MutualFundState> {
  final MutualFundRepository _mutualFundRepository;

  Data mutualFundData = const Data();
  List<Chart> charts = [];
  String id = '';
  String name = '';
  String type = '';

  MutualFundCubit(this._mutualFundRepository) : super(MutualFundInitial());

  Future<void> fetchMutualFund() async {
    try {
      emit(MutualFundLoading());
      var result = await _mutualFundRepository.fetchMutualFund(id);
      result.fold(
        (error) => emit(MutualFundError(error)),
        (data) {
          mutualFundData = data;
          mutualFundData.net_asset_values?.forEach((element) {
            charts.add(Chart(
                x: element.date ?? DateTime.now(), y: element.value ?? 0));
          });
          emit(MutualFundLoaded(data));
        },
      );
    } catch (e) {
      if (isClosed) return;
      emit(MutualFundError(e.toString()));
    }
  }
}
