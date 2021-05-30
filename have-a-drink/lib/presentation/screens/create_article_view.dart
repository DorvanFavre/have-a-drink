import 'package:flutter/material.dart';
import 'package:have_a_drink/application/providers/create_article_view_model_provider.dart';
import 'package:have_a_drink/constants/view.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/presentation/components/button_text.dart';
import 'package:have_a_drink/presentation/components/my_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateArticleView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(createArticleViewModelProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kGeneralPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MyTextField(
                controller: viewModel.titleController,
                hintText: 'Title...',
                validator: (String? str) {
                  return (str?.trim().length ?? 0) > 0 ? null : 'Enter a title';
                },
              ),
              MyTextField(
                controller: viewModel.descriptionController,
                hintText: 'Description...',
                validator: (String? str) {
                  return (str?.trim().length ?? 0) > 0
                      ? null
                      : 'Enter a description';
                },
              ),
              MyTextField(
                controller: viewModel.priceController,
                hintText: 'Price...',
                validator: (String? str) {
                  return (str?.trim().length ?? 0) > 0 &&
                          int.tryParse(str!) != null
                      ? null
                      : 'Enter a valid price';
                },
              ),
              ButtonText(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      viewModel.add().then((result) {
                        if (result is Success) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Article saved'),
                          ));
                          viewModel.clear();
                          Navigator.of(context).pop();
                        } else if (result is Failure) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result.message),
                          ));
                        }
                      });
                    }
                  },
                  text: 'Save')
            ],
          ),
        ),
      ),
    );
  }
}
