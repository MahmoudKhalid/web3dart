import 'package:web3dart/src/core/amount.dart';

void main() {
  var unit = EtherUnit.decimals18;
  var x =
      EtherAmount.fromBase10String(unit, '1000000000000000000.00005000000051');

  print(x.getInWei);
  print(x.getInEther);
  print(x.getValueInUnit(unit));

  // final d = Decimal.parse('148789451500000.15121401');
  // final result = Decimal.parse('148789451500000.15121401') *
  //     Decimal.fromBigInt(BigInt.from(10).pow(18));
  // final originalValue = result / Decimal.fromInt(10).pow(18).toDecimal();
  // print(result.toBigInt());
  // print(originalValue.toDecimal().toString());

  // print(Decimal.fromInt(10).pow(29));

  // Input amount in ETH
  // double amountInETH = 100000.0;

  // Result amount in Wei as expected
  // BigInt amountInWei = BigInt.parse('100000');
  // print(90000000000.00000001 * 1000000000);
  // print(900000000000.00000011 * 100000000);

  // var x = (BigInt.from((10000000000.00000001 * pow(10, 10))) *
  //         BigInt.from(10).pow(18)) ~/
  //     BigInt.from(pow(10, 10));
  // print(x);

  // double amount = 1000000000.00000001;
  // int precision = 18;

  // int shiftedAmount = (amount * pow(10, precision)).toInt();
  // BigInt bigAmount = BigInt.from(shiftedAmount);

  // String amountStr = '1000000000000000.10000000';
  // List<String> parts = amountStr.split('.');
  // String integerPart = parts[0];
  // String fractionalPart = parts.length > 1 ? parts[1] : '';
  // int precision = fractionalPart.length;

  // BigInt bigIntegerPart = BigInt.parse(integerPart);
  // BigInt bigFractionalPart = BigInt.parse(fractionalPart);
  // BigInt bigAmount =
  //     bigIntegerPart * BigInt.from(10).pow(precision) + bigFractionalPart;

  // print(bigAmount * BigInt.from(10).pow(1) ~/ BigInt.from(10).pow(precision));

  // BigInt result = bigAmount * BigInt.from(10).pow(18 - precision);

  // print(100000.0005 * BigInt.from(10).pow(18));

  // for (var i = 1; i < 30; i++) {
  //   print('10**$i = ${BigInt.from(10).pow(i)}');
  // }

  // The current algorithm to convert to Wei
  // BigInt result = BigInt.from(amountInETH * BigInt.from(10).pow(18).toDouble());
  // print('Result: $result, Is Precision: ${result == amountInWei}');
  // Result: 99999999999999991611392, Is Precision: false

  // The new algorithm that should be used to convert to Wei
  // result = BigInt.from(amountInETH) * BigInt.from(10).pow(18);
  // print('Result: $result, Is Precision: ${result == amountInWei}');
  // Result: 100000000000000000000000, Is Precision: true
}
