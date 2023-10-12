import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stock_app/core/constants/images.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';
import 'package:stock_app/presentation/cubit/ask_cubit.dart';
import 'package:stock_app/presentation/widgets/custom_text_field_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AskPage extends StatefulWidget {
  const AskPage({super.key});

  @override
  State<AskPage> createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  late AskCubit _askCubit;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _askCubit = context.read<AskCubit>();
    _askCubit.initHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: WillPopScope(
          onWillPop: () async {
            FocusScope.of(context).unfocus();
            return false;
          },
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ResetWidget(askCubit: _askCubit, size: size),
                  HistoryChatWidget(askCubit: _askCubit, size: size),
                  LoadingWidget(askCubit: _askCubit),
                  const SizedBox(height: 16),
                  ListPromptWidget(
                      askCubit: _askCubit,
                      textEditingController: _textEditingController),
                  const SizedBox(height: 16),
                  InputWidget(
                      askCubit: _askCubit,
                      textEditingController: _textEditingController),
                ],
              ),
            ),
          )),
    );
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required AskCubit askCubit,
    required TextEditingController textEditingController,
  })  : _askCubit = askCubit,
        _textEditingController = textEditingController;

  final AskCubit _askCubit;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskCubit, AskState>(
        bloc: _askCubit,
        listener: (context, state) {
          if (state is AnswerError) {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Something went wrong. Please check again later!",
              ),
            );
          }
        },
        buildWhen: (previous, current) {
          return current is AnswerLoading ||
              current is AnswerSuccess ||
              current is AnswerError;
        },
        builder: (context, state) {
          return CustomTextFieldWidget(
            isLoading: state is AnswerLoading,
            textEditingController: _textEditingController,
            onTap: () =>
                _askCubit.getAnswer(_textEditingController.text.trim()),
          );
        });
  }
}

class ListPromptWidget extends StatelessWidget {
  const ListPromptWidget({
    super.key,
    required AskCubit askCubit,
    required TextEditingController textEditingController,
  })  : _askCubit = askCubit,
        _textEditingController = textEditingController;

  final AskCubit _askCubit;
  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(_askCubit.prompts.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () =>
                  _textEditingController.text = _askCubit.prompts[index].prompt,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border: Border.all(color: Palletes.greyColor),
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: Text(
                  _askCubit.prompts[index].ask,
                  style: Styles.regulerStyle,
                )),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required AskCubit askCubit,
  }) : _askCubit = askCubit;

  final AskCubit _askCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskCubit, AskState>(
        bloc: _askCubit,
        listener: (context, state) {},
        buildWhen: (previous, current) {
          return current is AnswerLoading ||
              current is AnswerSuccess ||
              current is AnswerError;
        },
        builder: (context, state) {
          if (state is AnswerLoading) {
            return Center(
              child: LoadingAnimationWidget.waveDots(
                size: 60,
                color: Palletes.greyColor,
              ),
            );
          }
          return const SizedBox();
        });
  }
}

class HistoryChatWidget extends StatelessWidget {
  const HistoryChatWidget({
    super.key,
    required AskCubit askCubit,
    required this.size,
  }) : _askCubit = askCubit;

  final AskCubit _askCubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskCubit, AskState>(
        bloc: _askCubit,
        listener: (context, state) {},
        buildWhen: (previous, current) {
          return current is AnswerLoading ||
              current is AnswerSuccess ||
              current is AnswerError;
        },
        builder: (context, state) {
          return Flexible(
            child: (_askCubit.responses.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.emptyImg,
                        width: 60,
                        height: 60,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Palletes.whiteColor
                            : Palletes.blackColor,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No history chat found',
                        style: Styles.titleStyle,
                      )
                    ],
                  )
                : ListView(
                    physics: const ClampingScrollPhysics(),
                    children:
                        List.generate(_askCubit.responses.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          children: [
                            Container(
                                width: size.width,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  _askCubit.responses[index].ask,
                                  style: Styles.titleStyle,
                                )),
                            const SizedBox(height: 16),
                            Container(
                                width: size.width,
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Palletes.greyColor),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  _askCubit.responses[index].answer,
                                  style: Styles.regulerStyle,
                                )),
                          ],
                        ),
                      );
                    }),
                  ),
          );
        });
  }
}

class ResetWidget extends StatelessWidget {
  const ResetWidget({
    super.key,
    required AskCubit askCubit,
    required this.size,
  }) : _askCubit = askCubit;

  final AskCubit _askCubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskCubit, AskState>(
        bloc: _askCubit,
        listener: (context, state) {},
        buildWhen: (previous, current) {
          return current is AnswerLoading ||
              current is AnswerSuccess ||
              current is AnswerError;
        },
        builder: (context, state) {
          if (_askCubit.responses.isEmpty) {
            return const SizedBox();
          }
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _askCubit.reset(),
            child: SizedBox(
              width: size.width,
              child: Text(
                'Reset',
                style:
                    Styles.regulerStyle.copyWith(color: Palletes.bearishColor),
                textAlign: TextAlign.end,
              ),
            ),
          );
        });
  }
}
