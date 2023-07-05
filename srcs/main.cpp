#include <cstdlib>

int main()
{
    system("curl -sSL 'wttr.in/Seoul?m2&lang=ko' | sed '$d; $d' > .weather && cat .weather");
    system("rm .weather");
    return 0;
}
