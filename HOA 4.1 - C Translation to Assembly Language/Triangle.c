//Triangle.c
#include <stdio.h>
#include <conio.h>

int main()
{
    int z = 1;
    int x = 0;
    int y = 4;

    while (y > 0)
    {
        while (x < z)
        {
            printf("*");
            x++;
        }
        
        printf("\n");
        x = 0;
        y--;
        z++;
    }
    
    getch();
    return 0;
}
