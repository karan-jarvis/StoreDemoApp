import 'package:flutter/material.dart';
import 'package:store_demo_app/navigation/routes_key.dart';
import 'package:store_demo_app/screens/home_screen/home_repo.dart';
import 'package:store_demo_app/screens/home_screen/product_model.dart';
import 'package:store_demo_app/screens/profile/user_data.dart';
import 'package:store_demo_app/utils/prefrences/prefrences.dart';
import 'package:store_demo_app/utils/prefrences/prefrences_key.dart';
import 'package:store_demo_app/widgets/loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeWidget();
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isLoading = true;
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    onInit();
  }

  onInit() async {
    setState(() {
      isLoading = true;
    });
    products = await HomeRepo().fetchProducts(context) ?? [];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //fetchProducts();
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                UserDetails userDetails = UserDetails(
                  username: AppPreference().getString(PreferencesKey.userName),
                  email: "test@gmail.com",
                  profileImageUrl:
                      "https://static.vecteezy.com/system/resources/previews/019/900/322/non_2x/happy-young-cute-illustration-face-profile-png.png",
                );

                Navigator.pushNamed(context, Routes.profileScreen,
                    arguments: userDetails);
              },
              icon: const Icon(Icons.account_circle_outlined),
            )
          ],
          title: const Text('Products'),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return SizedBox(
                          height: 100,
                          child: Center(
                            child: Card(
                              child: ListTile(
                                titleAlignment:
                                    ListTileTitleAlignment.threeLine,
                                leading: Image.network(
                                  product.image!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  product.title ?? "",
                                  maxLines: 2,
                                  style: const TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontFamily: "Tw Cen MT",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  '\$${product.price ?? 0.00}',
                                  style: const TextStyle(
                                    fontFamily: "Tw Cen MT",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.productDetailScreen,
                                      arguments: product);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         ProductDetailScreen(product: product),
                                  //   ),
                                  // );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Loader(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
