#include <cstdlib>
#include <iostream>
#include <string>
#include <sstream>

#define OPTION 2

using namespace std;

int main(int ac, char **av)
{
    string location = "Seoul"; // Default location
    string language = "ko";   // Default language
    string option = "";
    if (ac >= OPTION)
    {
        string tmp = av[1];
        if (tmp == "all")
            option = "v2.";
        else
            location = tmp;
    }
    stringstream result;

// Result Command shift
    result << "curl "; 
// Curl Debug option
    result << "-sSL ";
// Api call
    result << "'";
    result << option;
    result << "wttr.in/";
    result << location;
    result << "' | sed '$d'";

// std::cout << result.str() << std::endl;
// System call
    system(result.str().c_str());
    return 0;
}
