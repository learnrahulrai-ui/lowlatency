#include <iostream>
#include <string_view>

namespace {

void print_usage(std::string_view program_name) {
    std::cout << "Gateway in a Box (C++17 Scaffold)\n"
              << "Usage:\n"
              << "  " << program_name << " decode <file>\n"
              << "  " << program_name << " risk <file>\n"
              << "  " << program_name << " grid <file>\n";
}

} // namespace

int main(int argc, char* argv[]) {
    if (argc < 2) {
        print_usage(argc > 0 && argv[0] != nullptr ? argv[0] : "gateway");
        return 0;
    }

    const std::string_view command = argv[1];

    if (command == "decode") {
        if (argc < 3) {
            std::cerr << "Error: decode requires <file>\n";
            return 1;
        }
        std::cout << "Hello, World! Gateway decode scaffold ready for file: " << argv[2] << "\n";
        return 0;
    }

    if (command == "risk") {
        if (argc < 3) {
            std::cerr << "Error: risk requires <file>\n";
            return 1;
        }
        std::cout << "Hello, World! Gateway risk scaffold ready for file: " << argv[2] << "\n";
        return 0;
    }

    if (command == "grid") {
        if (argc < 3) {
            std::cerr << "Error: grid requires <file>\n";
            return 1;
        }
        std::cout << "Hello, World! Gateway grid scaffold ready for file: " << argv[2] << "\n";
        return 0;
    }

    std::cerr << "Unknown command: " << command << "\n";
    print_usage(argv[0]);
    return 1;
}
