import 'package:decimal/decimal.dart';

enum EtherUnit {
  /// Wei, the smallest and atomic amount of Ether
  wei,

  /// Kwei, 1000 wei
  kwei,

  /// Mwei, one million wei
  mwei,

  /// Gwei, one billion wei. Typically a reasonable unit to measure gas prices.
  gwei,

  /// Szabo, 10^12 wei or 1 μEther
  szabo,

  /// Finney, 10^15 wei or 1 mEther
  finney,

  /// 1 Ether
  ether,

  /// Decimals values
  decimals1,
  decimals2,
  decimals3,
  decimals4,
  decimals5,
  decimals6,
  decimals7,
  decimals8,
  decimals9,
  decimals10,
  decimals11,
  decimals12,
  decimals13,
  decimals14,
  decimals15,
  decimals16,
  decimals17,
  decimals18,
  decimals19,
  decimals20,
  decimals21,
  decimals22,
  decimals23,
  decimals24,
  decimals25,
  decimals26,
  decimals27,
  decimals28,
  decimals29,
}

/// Utility class to easily convert amounts of Ether into different units of
/// quantities.
class EtherAmount {
  const EtherAmount.inWei(this._wei);

  EtherAmount.zero() : this.inWei(BigInt.zero);

  /// Constructs an amount of Ether by a unit and its amount.
  factory EtherAmount.fromInt(EtherUnit unit, int amount) {
    final Decimal wei = Decimal.fromInt(amount) * _factors[unit]!.toDecimal();
    return EtherAmount.inWei(wei.toBigInt());
  }

  /// Constructs an amount of Ether by a unit and its amount.
  factory EtherAmount.fromBigInt(EtherUnit unit, BigInt amount) {
    final Decimal wei = amount.toDecimal() * _factors[unit]!.toDecimal();
    return EtherAmount.inWei(wei.toBigInt());
  }

  /// Constructs an amount of Ether by a unit and its amount.
  factory EtherAmount.fromDecimal(EtherUnit unit, Decimal amount) {
    final Decimal wei = amount * _factors[unit]!.toDecimal();
    return EtherAmount.inWei(wei.toBigInt());
  }

  /// Constructs an amount of Ether by a unit and its amount.
  factory EtherAmount.fromBase10String(EtherUnit unit, String amount) {
    final Decimal wei = Decimal.parse(amount) * _factors[unit]!.toDecimal();
    return EtherAmount.inWei(wei.toBigInt());
  }

  final BigInt _wei;

  BigInt get getInWei => _wei;

  Decimal get getInEther => getValueInUnit(EtherUnit.ether);

  /// Gets the value of this amount in the specified unit as a whole number.
  /// **WARNING**: For all units except for [EtherUnit.wei], this method will
  /// discard the remainder occurring in the division, making it unsuitable for
  /// calculations or storage. You should store and process amounts of ether by
  /// using a BigInt storing the amount in wei.
  Decimal getValueInUnit(EtherUnit unit) {
    return (_wei.toDecimal() / _factors[unit]!.toDecimal()).toDecimal();
  }

  /// Gets the value of this amount in the specified decimals int as a whole number.
  Decimal getValueInDecimals(int decimals) {
    return getValueInUnit(getUintDecimals(decimals));
  }

  /// Gets Uint of decimals by decimals int
  static EtherUnit getUintDecimals(int decimals) {
    for (EtherUnit uint in EtherUnit.values) {
      if (uint.name == 'decimals$decimals') return uint;
    }

    throw Exception('invalid $decimals value of decimals must be 1 to 29');
  }

  static final Map<EtherUnit, BigInt> _factors = {
    EtherUnit.wei: BigInt.one,
    EtherUnit.kwei: BigInt.from(10).pow(3),
    EtherUnit.mwei: BigInt.from(10).pow(6),
    EtherUnit.gwei: BigInt.from(10).pow(9),
    EtherUnit.szabo: BigInt.from(10).pow(12),
    EtherUnit.finney: BigInt.from(10).pow(15),
    EtherUnit.ether: BigInt.from(10).pow(18),
    EtherUnit.decimals1: BigInt.from(10).pow(1),
    EtherUnit.decimals2: BigInt.from(10).pow(2),
    EtherUnit.decimals3: BigInt.from(10).pow(3),
    EtherUnit.decimals4: BigInt.from(10).pow(4),
    EtherUnit.decimals5: BigInt.from(10).pow(5),
    EtherUnit.decimals6: BigInt.from(10).pow(6),
    EtherUnit.decimals7: BigInt.from(10).pow(7),
    EtherUnit.decimals8: BigInt.from(10).pow(8),
    EtherUnit.decimals9: BigInt.from(10).pow(9),
    EtherUnit.decimals10: BigInt.from(10).pow(10),
    EtherUnit.decimals11: BigInt.from(10).pow(11),
    EtherUnit.decimals12: BigInt.from(10).pow(12),
    EtherUnit.decimals13: BigInt.from(10).pow(13),
    EtherUnit.decimals14: BigInt.from(10).pow(14),
    EtherUnit.decimals15: BigInt.from(10).pow(15),
    EtherUnit.decimals16: BigInt.from(10).pow(16),
    EtherUnit.decimals17: BigInt.from(10).pow(17),
    EtherUnit.decimals18: BigInt.from(10).pow(18),
    EtherUnit.decimals19: BigInt.from(10).pow(19),
    EtherUnit.decimals20: BigInt.from(10).pow(20),
    EtherUnit.decimals21: BigInt.from(10).pow(21),
    EtherUnit.decimals22: BigInt.from(10).pow(22),
    EtherUnit.decimals23: BigInt.from(10).pow(23),
    EtherUnit.decimals24: BigInt.from(10).pow(24),
    EtherUnit.decimals25: BigInt.from(10).pow(25),
    EtherUnit.decimals26: BigInt.from(10).pow(26),
    EtherUnit.decimals27: BigInt.from(10).pow(27),
    EtherUnit.decimals28: BigInt.from(10).pow(28),
    EtherUnit.decimals29: BigInt.from(10).pow(29),
  };

  @override
  String toString() {
    return 'EtherAmount: $getInWei wei';
  }

  @override
  int get hashCode => getInWei.hashCode;

  @override
  bool operator ==(dynamic other) =>
      other is EtherAmount && other.getInWei == getInWei;
}
