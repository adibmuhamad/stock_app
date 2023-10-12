import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/utils/chat_bot_util.dart';
import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/domain/entities/question.dart';
import 'package:stock_app/domain/repositories/ask_repository.dart';
import 'package:stock_app/env/env.dart';

part '../state/ask_state.dart';

class AskCubit extends Cubit<AskState> {
  final AskRepository _askRepository;

  AskCubit(this._askRepository) : super(AskInitial());

  List<ResponseData> responses = [];

  final List<Question> prompts = [
    Question(
        ask: 'Top stocks today',
        prompt:
            'Pick 10 stock in IDX with analyze with good performance to buy today. Add tradingview analyze'),
    Question(
        ask: 'Top US stocks today',
        prompt:
            'Pick 10 stock in US with analyze with good performance to buy today. Add tradingview analyze'),
    Question(
        ask: 'Analyze stock',
        prompt: 'Analyze the AAPL for trading and suggest. Provide information for buying price, selling price, and stop loss'),
    Question(
        ask: 'Best sector',
        prompt:
            'What stock market sector performs the best during this months in IDX?'),
    Question(
        ask: 'Rising interest rates',
        prompt:
            'Which stocks are most affected by rising interest rates in IDX?'),
    Question(
        ask: 'Growth potential',
        prompt:
            'What are some stocks in IDX with significant growth potential in the next 12 months and why'),
    Question(
        ask: 'Trade ideas',
        prompt:
            'Could you provide me with some trade ideas for the stock market in IDX? These ideas should use recent market data'),
    Question(
        ask: 'Financial forecast',
        prompt: 'Create a financial forecast for AAPL over the next 5 years'),
  ];

  Future<void> initHistory() async {
    try {
      emit(AnswerLoading());
      responses = await _askRepository.getAnswers();

      emit(AnswerSuccess());
    } catch (e) {
      if (isClosed) return;
      emit(AnswerError(e.toString()));
    }
  }

  Future<void> getAnswer(String question) async {
    try {
      emit(AnswerLoading());
      final chatbot = ChatBotUtil(sessionId: Env.bardKey);
      ResponseData response = await chatbot.ask(question);
      responses.add(response);

      await _askRepository.saveAnswers(responses);
      emit(AnswerSuccess());
    } catch (e) {
      if (isClosed) return;
      emit(AnswerError(e.toString()));
    }
  }

  Future<void> reset() async {
    try {
      responses = [];
      await _askRepository.deleteAnswers();
      emit(AnswerSuccess());
    } catch (e) {
      if (isClosed) return;
      emit(AnswerError(e.toString()));
    }
  }
}
