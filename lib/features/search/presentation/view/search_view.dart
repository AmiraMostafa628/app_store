import 'package:app_store/core/utils/constants_manager.dart';
import 'package:app_store/core/utils/style_manager.dart';
import 'package:app_store/core/utils/values_manager.dart';
import 'package:app_store/core/widgets/gradient_container.dart';
import 'package:app_store/features/common/state_renderer.dart';
import 'package:app_store/features/search/presentation/view/build_search_list_view.dart';
import 'package:app_store/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:app_store/features/search/presentation/view_model/cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.searchText}) : super(key: key);

  final String searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: SafeArea(
          child: BlocBuilder<SearchCubit,SearchStates>(
            builder: (context,state){
              var searchData = SearchCubit.get(context).searchData;
              if(searchData.isNotEmpty){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                      GoRouter.of(context).pop();
                    },
                      icon: const Icon(FontAwesomeIcons.angleLeft),
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p14,
                          right: AppPadding.p14,
                          bottom: AppPadding.p14),
                      child: Text('SearchData',
                        style: Styles.testStyle20.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Expanded(child: BuildListSearchBody(searchProducts: searchData,)),

                  ],
                );
              }

              else if(state is SearchLoadingStates)
              {
                return StateRenderer(
                    stateRendererType: StateRendererType.fullScreenLoadingState,
                    retryActionFunction: (){});

              }

              else if (state is SearchErrorStates) {
                return StateRenderer(
                    stateRendererType: StateRendererType.fullScreenErrorState,
                    message: state.errMessage,
                    retryActionFunction: (){
                      SearchCubit.get(context).fetchSearchData(text: searchText);
                    });
              }

              else {
                return  Center(child: Text('No identical Products',
                  style: Styles.testStyle16.copyWith(
                      color: kPrimaryColor
                  ),
                )
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
