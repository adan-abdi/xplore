import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive/hive.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
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
      required List<File>? productPics,
      required Function(ResponseState response) response,
      required Function onUploadComplete,
      Function(double bytesTransferred)? onTransfer,
      required Function onSuccess}) async {
    response(ResponseState.loading);

    final productId = "${product.productName!}-${product.productCreatedAt!}";

    try {
      product.productId = productId;

      await firestore
          .collection(Constants.USER_COLLECTION)
          .doc(auth.currentUser!.uid)
          .collection(Constants.PRODUCTS_COLLECTION)
          .doc(productId)
          .set({
        "sellerId": product.sellerId,
        "sellerName": product.sellerName,
        "productId": product.productId,
        "productName": product.productName,
        "productUnit": product.productUnit,
        "productStockCount": product.productStockCount,
        "productBuyingPrice": product.productBuyingPrice,
        "productSellingPrice": product.productSellingPrice,
        "productCategoryId": product.productCategoryId,
        "productImageUrls": product.productImageUrls,
        "productDescription": product.productDescription,
        "productCreatedAt": product.productCreatedAt,
        "productVariations": product.productVariations
            ?.map((variation) => variation.toJson())
            .toList(),
      }).then((value) async {
        response(ResponseState.success);
        onSuccess();

        if (productPics != null && productPics.isNotEmpty) {
          for (File pic in productPics) {
            await storeFileToFirebaseStorage(
                    ref:
                        'productPics/${auth.currentUser!.uid}/${productId}/${DateTime.now()}',
                    file: pic,
                    onTransfer: onTransfer!)
                .then((downloadUrl) {
              //  update the document with images
              firestore
                  .collection(Constants.USER_COLLECTION)
                  .doc(auth.currentUser!.uid)
                  .collection(Constants.PRODUCTS_COLLECTION)
                  .doc(productId)
                  .update({
                'productImageUrls': FieldValue.arrayUnion([downloadUrl])
              });
            });
          }

          onUploadComplete();
        }
      });
    } on FirebaseException catch (error) {
      response(ResponseState.failure);
      throw Exception(error);
    }
  }

  Future<String> storeFileToFirebaseStorage(
      {required String ref,
      required File file,
      required Function(double bytesTransferred) onTransfer}) async {
    final UploadTask uploadTask = storage.ref().child(ref).putFile(file);
    final TaskSnapshot taskSnapshot = await uploadTask;

    uploadTask.snapshotEvents.listen((event) {
      //  pass the bytes transferred
      onTransfer(
          (event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
              100);

      print(
          "Bytes Transferred : ${(event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) * 100}");
    });

    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> deleteFileFromFirebaseStorage(
      {required String ref,
      Function(ResponseState response, String? error)? response}) async {
    response!(ResponseState.loading, null);
    try {
      await FirebaseStorage.instance.ref().child(ref).delete().then((value) {
        print("Deleted Successfully");
        response(ResponseState.success, null);
      });
    } on FirebaseException catch (error) {
      response(ResponseState.failure, error.message);
    }
  }

  /// Update Product
  @override
  Future<void> updateProduct(
      {required ProductModel oldProduct,
      required ProductModel newProduct,
      List<File>? productPics,
      Function? onUploadComplete,
      Function(double bytesTransferred)? onTransfer,
      required Function(ResponseState response) response}) async {
    response(ResponseState.loading);

    try {
      await firestore
          .collection(Constants.USER_COLLECTION)
          .doc(auth.currentUser!.uid)
          .collection(Constants.PRODUCTS_COLLECTION)
          .doc(oldProduct.productId!)
          .update({
        "productName": newProduct.productName ?? oldProduct.productName,
        "productUnit": newProduct.productUnit ?? oldProduct.productUnit,
        "productStockCount":
            newProduct.productStockCount ?? oldProduct.productStockCount,
        "productBuyingPrice":
            newProduct.productBuyingPrice ?? oldProduct.productBuyingPrice,
        "productSellingPrice":
            newProduct.productSellingPrice ?? oldProduct.productSellingPrice,
        "productCategoryId":
            newProduct.productCategoryId ?? oldProduct.productCategoryId,
        "productVariations": newProduct.productVariations
                ?.map((variation) => variation.toJson())
                .toList() ??
            oldProduct.productVariations
                ?.map((variation) => variation.toJson())
                .toList()
      }).then((value) async {
        response(ResponseState.success);

        //  update images in firestore
        if (productPics != null) {
          for (File pic in productPics) {
            await storeFileToFirebaseStorage(
                    ref:
                        'productPics/${auth.currentUser!.uid}/${oldProduct.productId!}/${DateTime.now()}',
                    file: pic,
                    onTransfer: onTransfer!)
                .then((downloadUrl) async {
              //  update the document with images
              await firestore
                  .collection(Constants.USER_COLLECTION)
                  .doc(auth.currentUser!.uid)
                  .collection(Constants.PRODUCTS_COLLECTION)
                  .doc(oldProduct.productId)
                  .update({
                'productImageUrls': FieldValue.arrayUnion([downloadUrl])
              });
            });
          }

          onUploadComplete!();
        }
      });
    } on FirebaseException catch (error) {
      response(ResponseState.failure);
    }
  }

  /// Delete Product
  @override
  Future<void> deleteProduct({required String productId}) async {
    await firestore
        .collection(Constants.USER_COLLECTION)
        .doc(auth.currentUser!.uid)
        .collection(Constants.PRODUCTS_COLLECTION)
        .doc(productId)
        .delete();
  }

  /// Delete product pic
  @override
  Future<void> deleteProductPic(
      {required ProductModel product,
      required String imageUrl,
      required Function(ResponseState response) response}) async {
    response(ResponseState.loading);
    try {
      //  get all image urls
      var allProductPics = product.productImageUrls!;
      //  delete from the array
      allProductPics.removeWhere((url) => url == imageUrl);

      await firestore
          .collection(Constants.USER_COLLECTION)
          .doc(auth.currentUser!.uid)
          .collection(Constants.PRODUCTS_COLLECTION)
          .doc(product.productId!)
          .update({'productImageUrls': allProductPics}).then(
              (value) => response(ResponseState.success));

      final imagePath = imageUrl.getImagePath;

      await deleteFileFromFirebaseStorage(
              ref:
                  'productPics/${auth.currentUser!.uid}/${product.productId!}/$imagePath',
              response: (state, error) {})
          .then((value) async {});

      //  update the new array data in firestore
    } on FirebaseException catch (error) {
      response(ResponseState.failure);
      throw Exception(error);
    }
  }

  /// Get Merchant Products
  @override
  Stream<QuerySnapshot> getMerchantProducts() => firestore
      .collection(Constants.USER_COLLECTION)
      .doc(auth.currentUser!.uid)
      .collection(Constants.PRODUCTS_COLLECTION)
      .snapshots();
}
