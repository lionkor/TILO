#include <iostream>
#include <cassert>

/*
 * since and, or, not, etc are keywords in C++, the functions all have
 * an underscore "_" prefix. Feel free to get rid of it if you are working
 * with a noncompliant (ugh) compiler (MSVC).
 */

static bool _and(bool x, bool y) {
    if (x)
        return y;
    else
        return false;
}

static bool _implication(bool x, bool y) {
    if (x)
        return y;
    else
        return false;
}

static bool _not(bool x) {
    if (x)
        return false;
    return true;
}

static bool _xor(bool x, bool y) {
    if (x)
        return _not(y);
    return y;
}

static bool _or(bool x, bool y) {
    return x || y;
}

static bool _equivalence(bool x, bool y) {
    return (x && y) || (!x && !y);
}

#define test(pred, op)                              \
    assert(pred(true, true) == (true op true));     \
    assert(pred(true, false) == (true op false));   \
    assert(pred(false, false) == (false op false)); \
    assert(pred(false, true) == (false op true));

int main() {

    assert(_implication(true, true) == true);
    assert(_implication(true, false) == false);
    assert(_implication(false, false) == false);
    assert(_implication(false, true) == false);

    assert(_not(true) == false);
    assert(_not(false) == true);

    test(_and, &&);
    test(_equivalence, ==);
    test(_or, ||);
    test(_xor, ^);

    return 0;
}
