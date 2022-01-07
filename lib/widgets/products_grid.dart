import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    // provider의 정보 받음
    // 부모 위젯으로 계속 올라가면서 ChangeNotifierProvider 찾음
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i], // 이미 있는 값을 가져오거나 수정할 땐 value가 효율적
        // create: (c) => products[i], // child에 제공하는 값
        child: ProductItem(),
      ),
      //gridDelegate는 그리드 구조 만듬
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
