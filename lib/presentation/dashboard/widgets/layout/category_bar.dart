// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:shamiri/infrastructure/remote_repository/firestore_category.dart';
import 'package:shamiri/presentation/dashboard/widgets/molecular/category_chip.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryRepository categoryRepositoryInstance = CategoryRepository();

    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: categoryRepositoryInstance.getStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(child: Text('Something went wrong')));
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (ctx, index) {
                  String categoryName = snapshot.data!.docs[index]["name"];
                  return CategoryChip(
                    name: categoryName,
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            );
          }),
    );
  }
}
