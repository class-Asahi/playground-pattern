struct {
    template <class token>
    auto &operator,(token &x) { return std::cin >> x, *this; }
} input;

struct {
    template <class token>
    auto &operator,(token &x) { return std::cout << x, *this; }
    template <class token>
    auto &operator,(token &&x) { return std::cout << x, *this; }
} output;
