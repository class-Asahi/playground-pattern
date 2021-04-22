struct {
    template <class token>
    auto &operator,(token &x) { return std::cin >> x, *this; }
} input;

struct {
    auto &operator,(std::ostream &(*x)(std::ostream &)) { return std::cout << x, *this; }
    template <class token>
    auto &operator,(token &x) { return std::cout << x, *this; }
    template <class token>
    auto &operator,(token &&x) { return std::cout << x, *this; }
} output;
