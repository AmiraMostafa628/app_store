import 'package:app_store/core/utils/app_router.dart';
import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchSection extends StatelessWidget {
      SearchSection({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     return  Form(
      key: formKey,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: Card(
                elevation: 10,
                child: CustomTextFormField(
                  controller: searchController,
                  text: 'Search',
                  validate:(String value){
                    if(value.isEmpty){
                      return 'Enter Text to Search For';
                    }
                  },
                  type: TextInputType.text,
                  suffixIcon: Icons.search,
                  suffixPressed: () {
                    if (formKey.currentState!.validate()) {
                      final searchValue = searchController.text;
                      searchController.text = '';

                      Future.microtask(() {
                        GoRouter.of(context).push(AppRouter.kSearch, extra: searchValue);
                      });
                    }
                  },
                  onSubmit: (value) {
                    if (formKey.currentState!.validate()) {
                      final searchValue = searchController.text;
                      searchController.text = '';

                      Future.microtask(() {
                        GoRouter.of(context).push(AppRouter.kSearch, extra: searchValue);
                      });
                    }
                  },

                ),
              ),
            ),
          ),
          const SizedBox(width: AppSize.s5,),
          Container(
            height: AppSize.s35,
            width: AppSize.s35,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff000000).withOpacity(.4),
                    blurRadius: 20,
                    //blurStyle: BlurStyle.solid,
                    spreadRadius: 1
                ),
              ],
              borderRadius: BorderRadius.circular(AppSize.s10),

            ),
            child: const Icon(FontAwesomeIcons.filter,
              size: AppSize.s14,
              color: kIconColor,
            ),
          )


        ],
      ),
    );
  }
}

