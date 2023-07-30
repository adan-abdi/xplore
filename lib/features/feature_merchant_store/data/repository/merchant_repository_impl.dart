import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive/hive.dart';
import 'package:shamiri/features/feature_merchant_store/domain/repository/merchant_repository.dart';

import '../../../../core/domain/model/response_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../di/locator.dart';
import '../../domain/model/product_model.dart';

class MerchantRepositoryImpl implements MerchantRepository {
  final userPrefsBox = Hive.box(Constants.USER_PREFS_BOX);
  final auth = locator.get<FirebaseAuth>();
  final firestore = locator.get<FirebaseFirestore>();
  final storage = locator.get<FirebaseStorage>();

  /// Add Product to Firestore
  @override
  Future<void> addProductToFirestore(
      {required ProductModel product,
      required File? productPic,
      required Function(ResponseState response) response,
      required Function onSuccess}) async {
    response(ResponseState.loading);

    try {
      if (productPic != null) {
        await storeFileToFirebaseStorage(
                ref: 'productPics/${auth.currentUser!.uid}', file: productPic)
            .then((downloadUrl) => product.productImageUrl = downloadUrl);
      }

      final productId = "${product.productName!}-${product.productCreatedAt!}";

      await firestore
          .collection(Constants.USER_COLLECTION)
          .doc(auth.currentUser!.uid)
          .collection(Constants.PRODUCTS_COLLECTION)
          .doc(productId)
          .set(product.toMap())
          .then((value) {
        response(ResponseState.success);
        onSuccess();
      });
    } on FirebaseException catch (error) {
      response(ResponseState.failure);
      throw Exception(error);
    }
  }

  Future<String> storeFileToFirebaseStorage(
      {required String ref, required File file}) async {
    final UploadTask uploadTask = storage.ref().child(ref).putFile(file);
    final TaskSnapshot taskSnapshot = await uploadTask;

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
