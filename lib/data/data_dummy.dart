import 'package:flutter_fic23pos_responsive/data/models/response/product_sales_report.dart';
import 'package:flutter_fic23pos_responsive/presentation/home/models/category_model.dart';
import 'package:flutter_fic23pos_responsive/presentation/order/models/order_model.dart';

import '../presentation/home/models/order_item.dart';
import 'models/response/product_response_model.dart';

// =======================================================
// KATALOG PRODUK UTAMA (TETAP ADA SEBAGAI REFERENSI)
// =======================================================
List<Product> dummyProducts = [
  // ... (Data dummyProducts Anda bisa tetap di sini sebagai katalog utama)
  Product(
    id: 1,
    productId: 101,
    name: "Nasi Goreng Spesial",
    price: 25000, /* ... */ categoryId: 1, // Tambahkan categoryId untuk draft
    createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
    updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    category: 'Makanan Ringan',
    image: "https://example.com/pisang_goreng_keju.jpg",
    stock: 100, // Tambahkan stock untuk draft
  ),
  Product(
    id: 2,
    productId: 102,
    name: "Sate Ayam Madura",
    price: 30000, /* ... */ categoryId: 1, // Tambahkan categoryId untuk draft
    createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
    updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    category: 'Makanan Berat',
    image: "https://example.com/sate_ayam_madura.jpg",
    stock: 100, // Tambahkan stock untuk draft
  ),
  Product(
    id: 3,
    productId: 103,
    name: "Bakso Urat Jumbo",
    price: 20000, /* ... */ categoryId: 1, // Tambahkan categoryId untuk draft
    createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
    updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    category: 'Makanan Ringan',
    image: "https://example.com/pisang_goreng_keju.jpg",
    stock: 100, // Tambahkan stock untuk draft
  ),
  Product(
    id: 4,
    productId: 201,
    name: "Pisang Goreng Keju",
    price: 15000, /* ... */ stock: 100, // Tambahkan stock untuk draft
    categoryId: 1, // Tambahkan categoryId untuk draft
    createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
    updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    category: 'Makanan Ringan',
    image: "https://example.com/pisang_goreng_keju.jpg",
  ),
  Product(
    id: 7,
    productId: 302,
    name: "Jus Alpukat",
    price: 18000, /* ... */ categoryId: 1, // Tambahkan categoryId untuk draft
    createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
    updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    category: 'Makanan Ringan',
    image: "https://example.com/pisang_goreng_keju.jpg",
    stock: 100, // Tambahkan stock untuk draft
  ),
  Product(
    id: 8,
    productId: 303,
    name: "Kopi Susu Gula Aren",
    price: 22000, /* ... */ stock: 100, // Tambahkan stock untuk draft
    categoryId: 1, // Tambahkan categoryId untuk draft
    createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
    updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    category: 'Minuman Kopi',
    image: "https://example.com/kopi_susu_gula_aren.jpg",
  ),
  Product(
    id: 9,
    productId: 304,
    name: "Es Jeruk Peras",
    price: 12000, /* ... */ categoryId: 1, // Tambahkan categoryId untuk draft
    createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
    updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    category: 'Makanan Ringan',
    image: "https://example.com/pisang_goreng_keju.jpg",
    stock: 100, // Tambahkan stock untuk draft
  ),
];

List<CategoryModel> categories = [
  CategoryModel(name: 'Drink', value: 'drink'),
  CategoryModel(name: 'Food', value: 'food'),
  CategoryModel(name: 'Snack', value: 'snack'),
];

// =======================================================
// DUMMY ORDERS (VERSI BARU - TANPA DEPENDENSI)
// =======================================================
List<OrderModel> dummyOrders = [
  // Pesanan 1
  OrderModel(
    id: 1,
    paymentMethod: 'Tunai',
    nominalBayar: 82000,
    orders: [
      OrderItem(
        // SEKARANG: Produk didefinisikan langsung di sini
        product: Product(
          id: 1,
          productId: 101,
          name: "Nasi Goreng Spesial",
          price: 25000,
          category: "Makanan Berat",
          image: "...", stock: 100, // Tambahkan stock untuk draft
          categoryId: 1, // Tambahkan categoryId untuk draft
          createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
          updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
        ),
        quantity: 2,
      ),
      OrderItem(
        product: Product(
          id: 8,
          productId: 303,
          name: "Kopi Susu Gula Aren",
          price: 22000,
          category: "Minuman Kopi",
          image: "...", stock: 100, // Tambahkan stock untuk draft
          categoryId: 1, // Tambahkan categoryId untuk draft
          createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
          updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
        ),
        quantity: 1,
      ),
    ],
    totalQuantity: 3,
    totalPrice: (2 * 25000) + 22000, // 72000
    idKasir: 1,
    namaKasir: "Andi Saputra",
    isSync: false,
    transactionTime:
        DateTime.now().subtract(const Duration(minutes: 30)).toIso8601String(),
  ),

  // Pesanan 2
  OrderModel(
    id: 2,
    paymentMethod: 'QRIS',
    nominalBayar: 78000,
    orders: [
      OrderItem(
          product: Product(
            id: 2,
            productId: 102,
            name: "Sate Ayam Madura",
            price: 30000,
            category: "Makanan Berat",
            image: "...", stock: 100, // Tambahkan stock untuk draft
            categoryId: 1, // Tambahkan categoryId untuk draft
            createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
            updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
          ),
          quantity: 2),
      OrderItem(
          product: Product(
            id: 7,
            productId: 302,
            name: "Jus Alpukat",
            price: 18000,
            category: "Minuman Dingin",
            image: "...", stock: 100, // Tambahkan stock untuk draft
            categoryId: 1, // Tambahkan categoryId untuk draft
            createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
            updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
          ),
          quantity: 1),
    ],
    totalQuantity: 3,
    totalPrice: (2 * 30000) + 18000, // 78000
    idKasir: 2,
    namaKasir: "Bunga Citra",
    isSync: true,
    transactionTime:
        DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
  ),
];

// =======================================================
// DUMMY ORDER ITEMS (VERSI BARU - TANPA DEPENDENSI)
// =======================================================
List<OrderItem> dummyOrderItems = [
  OrderItem(
    product: Product(
      id: 1,
      productId: 101,
      name: "Nasi Goreng Spesial",
      price: 25000,
      category: "Makanan Berat",
      image: "...", stock: 100, // Tambahkan stock untuk draft
      categoryId: 1, // Tambahkan categoryId untuk draft
      createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
      updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    ),
    quantity: 2,
  ),
  OrderItem(
    product: Product(
      id: 2,
      productId: 102,
      name: "Sate Ayam Madura",
      price: 30000,
      category: "Makanan Berat",
      image: "...", stock: 100, // Tambahkan stock untuk draft
      categoryId: 1, // Tambahkan categoryId untuk draft
      createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
      updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
    ),
    quantity: 1,
  ),
];

// =======================================================
// DUMMY DRAFT ORDERS (VERSI BARU - TANPA DEPENDENSI)
// =======================================================
// List<DraftOrderModel> dummyDraftOrders = [
//   // Draft 1: Untuk Meja 5
//   DraftOrderModel(
//     id: 1,
//     orders: [
//       DraftOrderItem(
//           product: Product(
//             id: 1,
//             productId: 101,
//             name: "Nasi Goreng Spesial",
//             price: 25000,
//             category: "Makanan Berat",
//             image: "...", stock: 100, // Tambahkan stock untuk draft
//             categoryId: 1, // Tambahkan categoryId untuk draft
//             createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
//             updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
//           ),
//           quantity: 1),
//       DraftOrderItem(
//           product: Product(
//             id: 9,
//             productId: 304,
//             name: "Es Jeruk Peras",
//             price: 12000,
//             category: "Minuman Dingin",
//             image: "...",
//             stock: 100, // Tambahkan stock untuk draft
//             categoryId: 1, // Tambahkan categoryId untuk draft
//             createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
//             updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
//           ),
//           quantity: 2),
//     ],
//     totalQuantity: 3,
//     totalPrice: 25000 + (2 * 12000), // 49000
//     tableNumber: 5,
//     draftName: "Meja 5",
//     transactionTime:
//         DateTime.now().subtract(const Duration(minutes: 10)).toIso8601String(),
//   ),

//   // Draft 2: Untuk Rombongan di Meja 12
//   DraftOrderModel(
//     id: 2,
//     orders: [
//       DraftOrderItem(
//           product: Product(
//             id: 2,
//             productId: 102,
//             name: "Sate Ayam Madura",
//             price: 30000,
//             category: "Makanan Berat",
//             image: "...", stock: 100, // Tambahkan stock untuk draft
//             categoryId: 1, // Tambahkan categoryId untuk draft
//             createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
//             updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
//           ),
//           quantity: 2),
//       DraftOrderItem(
//           product: Product(
//             id: 7,
//             productId: 302,
//             name: "Jus Alpukat",
//             price: 18000,
//             category: "Minuman Dingin",
//             image: "...", stock: 100, // Tambahkan stock untuk draft
//             categoryId: 1, // Tambahkan categoryId untuk draft
//             createdAt: DateTime.now(), // Tambahkan createdAt untuk draft
//             updatedAt: DateTime.now(), // Tambahkan updatedAt untuk draft
//           ),
//           quantity: 3),
//     ],
//     totalQuantity: 5,
//     totalPrice: (2 * 30000) + (3 * 18000), // 114000
//     tableNumber: 12,
//     draftName: "Rombongan Pak Budi",
//     transactionTime:
//         DateTime.now().subtract(const Duration(hours: 1)).toIso8601String(),
//   ),
// ];

final List<ProductSales> dummyProductSalesData = [
  // Laporan untuk Nasi Goreng Spesial
  ProductSales(
    productId: 101,
    productName: "Nasi Goreng Spesial",
    productPrice: 25000,
    totalQuantity: "35", // Total terjual 35 porsi
    totalPrice: (25000 * 35).toString(), // "875000"
  ),
  // Laporan untuk Kopi Susu Gula Aren
  ProductSales(
    productId: 303,
    productName: "Kopi Susu Gula Aren",
    productPrice: 22000,
    totalQuantity: "52", // Total terjual 52 gelas
    totalPrice: (22000 * 52).toString(), // "1144000"
  ),
  // Laporan untuk Sate Ayam Madura
  ProductSales(
    productId: 102,
    productName: "Sate Ayam Madura",
    productPrice: 30000,
    totalQuantity: "28", // Total terjual 28 porsi
    totalPrice: (30000 * 28).toString(), // "840000"
  ),
  // Laporan untuk Pisang Goreng Keju
  ProductSales(
    productId: 201,
    productName: "Pisang Goreng Keju",
    productPrice: 15000,
    totalQuantity: "45", // Total terjual 45 porsi
    totalPrice: (15000 * 45).toString(), // "675000"
  ),
];

// --- DATA DUMMY UNTUK ProductSalesResponseModel ---
// Ini adalah objek response lengkap yang akan Anda terima dari API.
final ProductSalesResponseModel dummyProductSalesResponse =
    ProductSalesResponseModel(
  status: "success",
  data: dummyProductSalesData,
);

// CloseCashierShiftResponseModel dummyCloseShiftPerfect =
//     CloseCashierShiftResponseModel(
//   message: "Shift closed successfully. Cash matches.",
//   // Perhitungan: closeAmount - (openAmount + cashSales) = 0
//   difference: 0,
//   shift: Shift(
//     id: 101,
//     cashierId: 1,
//     openAmount: 500000,
//     cashSales: 1250000,
//     closeAmount: 1750000, // 500rb + 1.25jt = 1.75jt
//     status: "closed",
//     openedAt: DateTime.now().subtract(const Duration(hours: 8)),
//     closedAt: DateTime.now(),
//     createdAt: DateTime.now().subtract(const Duration(hours: 8)),
//     updatedAt: DateTime.now(),
//   ),
// );
