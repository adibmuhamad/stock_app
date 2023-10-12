part of '../cubit/ask_cubit.dart';

abstract class AskState {}

class AskInitial extends AskState {}

class AnswerLoading extends AskState {}

class AnswerSuccess extends AskState {}

class AnswerError extends AskState {
  final String error;

  AnswerError(this.error);
}