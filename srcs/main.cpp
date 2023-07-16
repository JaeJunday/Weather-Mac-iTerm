#include <cstdlib>
#include <iostream>
#include <string>

#define LOCATION 2
#define LANGUAGE 3

int main(int ac, char **av)
{
    std::string location = "Seoul"; // Default location
    std::string language = "ko";   // Default language

    if (ac >= LOCATION)
        location = av[1];

    if (ac >= LANGUAGE)
        language = av[2];

    std::string curl_command = "curl -sSL 'wttr.in/" + location + "?m2&lang=" + language + "' | sed '$d'";
    system(curl_command.c_str());

    return 0;
}
