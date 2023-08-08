import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class TransactionToggle extends StatelessWidget {
  const TransactionToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: UnconstrainedBox(
        child: Container(
          width: 260,
          height: 60,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: XploreColors.deepBlue,
          ),
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: XploreColors.xploreOrange,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.done_all_rounded,
                            size: 24,
                            color: XploreColors.deepBlue,
                          ),
                          Text(
                            "Fulfilled",
                            style: TextStyle(
                                fontWeight:
                                Theme.of(context).textTheme.bodyMedium?.fontWeight,
                                fontSize:
                                Theme.of(context).textTheme.bodyMedium?.fontSize,
                                color: XploreColors.white),
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: XploreColors.deepBlue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.pending_actions_rounded,
                            size: 24,
                            color: XploreColors.xploreOrange,
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(
                                fontWeight:
                                Theme.of(context).textTheme.bodyMedium?.fontWeight,
                                fontSize:
                                Theme.of(context).textTheme.bodyMedium?.fontSize,
                                color: XploreColors.white),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      )
    );
  }
}
