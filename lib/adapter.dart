import 'dart:math';

class RoundHole {
  double _radius;

  RoundHole(this._radius);

  double getRadius() {
    // Return the radius of the hole.
    return _radius;
  }

  bool fits(RoundPeg peg) {
    return this.getRadius() >= peg.getRadius();
  }
}

class RoundPeg {
  double _radius;

  RoundPeg(this._radius);

  double getRadius() {
    // Return the radius of the round peg.
    return _radius;
  }
}

// Outdated, incompatible class: SquarePeg.
class SquarePeg {
  double _width;

  SquarePeg(this._width);

  double getWidth() {
    // Return the width of the square peg.
    return _width;
  }
}

// Adapter allows using square pegs and round holes together.
class SquarePegAdapter extends RoundPeg {
  SquarePeg _peg;

  SquarePegAdapter(this._peg) : super(0);

  @override
  double getRadius() {
    // Calculate the half diagonal of the square peg using Pythagorean theorem.
    return _peg.getWidth() * sqrt(2) / 2;
  }
}

void main() {
  var hole = RoundHole(5);
  var rpeg = RoundPeg(5);
  print(hole.fits(rpeg)); // TRUE

  var smallSqPeg = SquarePeg(5);
  var largeSqPeg = SquarePeg(10);
  // hole.fits(smallSqPeg); // Compilation error, incompatible types

  var smallSqPegAdapter = SquarePegAdapter(smallSqPeg);
  var largeSqPegAdapter = SquarePegAdapter(largeSqPeg);
  print(hole.fits(smallSqPegAdapter)); // TRUE
  print(hole.fits(largeSqPegAdapter)); // FALSE
}
