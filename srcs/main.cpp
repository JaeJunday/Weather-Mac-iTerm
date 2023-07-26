#include <iostream>
#include <string>
#include <cstdlib>
#include <sstream>
#include <fstream>

#define OPTION 2
#define ON "on"
#define OFF "off"

using namespace std;

void makeStatus(string tmp)
{
    string mode;
    if (tmp == ON)
        mode = "craeteStatus.sh";
    else if (tmp == OFF)
        mode = "removeStatus.sh";

    stringstream path;
    path << "bash ";
    path << "$HOME/";
    path << ".config/";
    path << mode;

    // cout << path.str() << endl;
    system(path.str().c_str());
    exit(0);
}

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
        else if (tmp == "on" || tmp == "off")
            makeStatus(tmp);
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
