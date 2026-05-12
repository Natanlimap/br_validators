part of br_validator;

/// Class for validating Brazilian Inscrição Estadual (state tax registration).
class _IEValidator {
  /// Validates an IE for the given [uf] (e.g. 'SP', 'RJ').
  ///
  /// Formatting characters are stripped before validation.
  /// Returns `true` if the IE is valid for that state, otherwise `false`.
  static bool validate(String ie, String uf) {
    ie = ie.replaceAll(RegExp(r'[.\-/\s]'), '').toUpperCase();
    switch (uf.toUpperCase()) {
      case 'AC': return _ac(ie);
      case 'AL': return _al(ie);
      case 'AM': return _am(ie);
      case 'AP': return _ap(ie);
      case 'BA': return _ba(ie);
      case 'CE': return _ce(ie);
      case 'DF': return _df(ie);
      case 'ES': return _es(ie);
      case 'GO': return _go(ie);
      case 'MA': return _ma(ie);
      case 'MG': return _mg(ie);
      case 'MS': return _ms(ie);
      case 'MT': return _mt(ie);
      case 'PA': return _pa(ie);
      case 'PB': return _pb(ie);
      case 'PE': return _pe(ie);
      case 'PI': return _pi(ie);
      case 'PR': return _pr(ie);
      case 'RJ': return _rj(ie);
      case 'RN': return _rn(ie);
      case 'RO': return _ro(ie);
      case 'RR': return _rr(ie);
      case 'RS': return _rs(ie);
      case 'SC': return _sc(ie);
      case 'SE': return _se(ie);
      case 'SP': return _sp(ie);
      case 'TO': return _to(ie);
      default:   return false;
    }
  }

  static int _mod11(List<int> digits, List<int> weights) {
    int sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += digits[i] * weights[i];
    }
    final rem = sum % 11;
    return rem < 2 ? 0 : 11 - rem;
  }

  // ── AC ──────────────────────────────────────────────────────────────────────
  static bool _ac(String ie) {
    if (ie.length != 13 || !RegExp(r'^\d{13}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    final c1 = _mod11(d, [4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]);
    if (c1 != d[11]) return false;
    final c2 = _mod11(d, [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]);
    return c2 == d[12];
  }

  // ── AL ──────────────────────────────────────────────────────────────────────
  static bool _al(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── AM ──────────────────────────────────────────────────────────────────────
  static bool _am(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── AP ──────────────────────────────────────────────────────────────────────
  static bool _ap(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── BA ──────────────────────────────────────────────────────────────────────
  static bool _ba(String ie) {
    if (!RegExp(r'^\d{8,9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    if (ie.length == 8) {
      final c1 = _mod11(d, [7, 6, 5, 4, 3, 2]);
      if (c1 != d[6]) return false;
      final c2 = _mod11(d, [8, 7, 6, 5, 4, 3, 2]);
      return c2 == d[7];
    } else {
      final c1 = _mod11(d, [8, 7, 6, 5, 4, 3, 2]);
      if (c1 != d[7]) return false;
      final c2 = _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]);
      return c2 == d[8];
    }
  }

  // ── CE ──────────────────────────────────────────────────────────────────────
  static bool _ce(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── DF ──────────────────────────────────────────────────────────────────────
  static bool _df(String ie) {
    if (ie.length != 13 || !RegExp(r'^\d{13}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    final c1 = _mod11(d, [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4]);
    if (c1 != d[11]) return false;
    final c2 = _mod11(d, [3, 2, 9, 8, 7, 6, 5, 4, 3, 2, 9, 8]);
    return c2 == d[12];
  }

  // ── ES ──────────────────────────────────────────────────────────────────────
  static bool _es(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── GO ──────────────────────────────────────────────────────────────────────
  static bool _go(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── MA ──────────────────────────────────────────────────────────────────────
  static bool _ma(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── MG ──────────────────────────────────────────────────────────────────────
  // Format: 13 digits  CCCCCCCCCDDVV  (C=core, D=branch, VV=check digits)
  static bool _mg(String ie) {
    if (ie.length != 13 || !RegExp(r'^\d{13}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    // First check digit: expand first 11 digits inserting 0 after position 3,
    // then apply alternating weights [1,2] and sum the individual product digits.
    final expanded = [
      d[0], d[1], d[2], 0,
      d[3], d[4], d[5], d[6], d[7], d[8],
      d[9], d[10]
    ];
    const w1 = [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2];
    int sum1 = 0;
    for (int i = 0; i < 12; i++) {
      int v = expanded[i] * w1[i];
      sum1 += v ~/ 10 + v % 10;
    }
    int c1 = (10 - (sum1 % 10)) % 10;
    if (c1 != d[11]) return false;
    // Second check digit: mod11 on first 12 digits with weights [9,8,7,6,5,4,3,2,9,8,7,6].
    final c2 = _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6]);
    return c2 == d[12];
  }

  // ── MS ──────────────────────────────────────────────────────────────────────
  static bool _ms(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── MT ──────────────────────────────────────────────────────────────────────
  static bool _mt(String ie) {
    if (ie.length != 11 || !RegExp(r'^\d{11}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]) == d[10];
  }

  // ── PA ──────────────────────────────────────────────────────────────────────
  static bool _pa(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── PB ──────────────────────────────────────────────────────────────────────
  static bool _pb(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── PE ──────────────────────────────────────────────────────────────────────
  static bool _pe(String ie) {
    if (!RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    final c1 = _mod11(d, [8, 7, 6, 5, 4, 3, 2]);
    if (c1 != d[7]) return false;
    final c2 = _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]);
    return c2 == d[8];
  }

  // ── PI ──────────────────────────────────────────────────────────────────────
  static bool _pi(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── PR ──────────────────────────────────────────────────────────────────────
  static bool _pr(String ie) {
    if (ie.length != 10 || !RegExp(r'^\d{10}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    final c1 = _mod11(d, [3, 2, 9, 8, 7, 6, 5, 4, 3]);
    if (c1 != d[8]) return false;
    final c2 = _mod11(d, [4, 3, 2, 9, 8, 7, 6, 5, 4, 3]);
    return c2 == d[9];
  }

  // ── RJ ──────────────────────────────────────────────────────────────────────
  static bool _rj(String ie) {
    if (ie.length != 8 || !RegExp(r'^\d{8}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [2, 7, 6, 5, 4, 3, 2]) == d[7];
  }

  // ── RN ──────────────────────────────────────────────────────────────────────
  static bool _rn(String ie) {
    if (!RegExp(r'^\d{9,10}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    if (ie.length == 9) {
      return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
    }
    return _mod11(d, [10, 9, 8, 7, 6, 5, 4, 3, 2]) == d[9];
  }

  // ── RO ──────────────────────────────────────────────────────────────────────
  static bool _ro(String ie) {
    if (ie.length != 14 || !RegExp(r'^\d{14}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]) == d[13];
  }

  // ── RR ──────────────────────────────────────────────────────────────────────
  static bool _rr(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── RS ──────────────────────────────────────────────────────────────────────
  static bool _rs(String ie) {
    if (ie.length != 10 || !RegExp(r'^\d{10}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [2, 9, 8, 7, 6, 5, 4, 3, 2]) == d[9];
  }

  // ── SC ──────────────────────────────────────────────────────────────────────
  static bool _sc(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── SE ──────────────────────────────────────────────────────────────────────
  static bool _se(String ie) {
    if (ie.length != 9 || !RegExp(r'^\d{9}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    return _mod11(d, [9, 8, 7, 6, 5, 4, 3, 2]) == d[8];
  }

  // ── SP ──────────────────────────────────────────────────────────────────────
  static bool _sp(String ie) {
    if (!RegExp(r'^\d{12}$').hasMatch(ie)) return false;
    final d = ie.split('').map(int.parse).toList();
    final c1 = _mod11(d, [1, 3, 4, 5, 6, 7, 8, 10]);
    if (c1 != d[8]) return false;
    final c2 = _mod11(d, [3, 2, 10, 9, 8, 7, 6, 5, 4, 3, 2]);
    return c2 == d[11];
  }

  // ── TO ──────────────────────────────────────────────────────────────────────
  static bool _to(String ie) {
    if (ie.length != 11 || !RegExp(r'^\d{11}$').hasMatch(ie)) return false;
    // TO uses digits 1-2 (state prefix) and 3-10 as base; digit 11 = check.
    final base = ie.substring(0, 10).split('').map(int.parse).toList();
    return _mod11(base, [9, 8, 7, 6, 5, 4, 3, 2, 9, 8]) == int.parse(ie[10]);
  }
}
