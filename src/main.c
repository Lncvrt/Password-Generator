#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>

#define SYMBOLS "!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
#define DIGITS "0123456789"
#define LOWERCASE "abcdefghijklmnopqrstuvwxyz"
#define UPPERCASE "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

int main()
{
    long length;
    char use_letters, use_digits, use_symbols;
    char characters[256];
    int num_chars = 0;

    printf("Enter the desired password length: ");
    if (scanf("%ld", &length) != 1)
    {
        printf("Invalid input\n");
        return 1;
    }

    if (length <= 0)
    {
        printf("Invalid length\n");
        return 1;
    }

    printf("Use letters (y/N)? ");
    if (scanf(" %c", &use_letters) != 1)
    {
        printf("Invalid input\n");
        return 1;
    }

    printf("Use digits (y/N)? ");
    if (scanf(" %c", &use_digits) != 1)
    {
        printf("Invalid input\n");
        return 1;
    }

    printf("Use symbols (y/N)? ");
    if (scanf(" %c", &use_symbols) != 1)
    {
        printf("Invalid input\n");
        return 1;
    }

    use_letters = tolower(use_letters);
    use_digits = tolower(use_digits);
    use_symbols = tolower(use_symbols);

    if (use_letters == 'y')
    {
        snprintf(characters + num_chars, sizeof(characters) - num_chars, "%s%s", LOWERCASE, UPPERCASE);
        num_chars += 52;
    }

    if (use_digits == 'y')
    {
        snprintf(characters + num_chars, sizeof(characters) - num_chars, "%s", DIGITS);
        num_chars += 10;
    }

    if (use_symbols == 'y')
    {
        snprintf(characters + num_chars, sizeof(characters) - num_chars, "%s", SYMBOLS);
        num_chars += sizeof(SYMBOLS) - 1;
    }

    if (num_chars == 0)
    {
        printf("No valid character types selected.\n");
        return 1;
    }

    srand(time(NULL));

    printf("Generated password: ");
    for (int i = 0; i < length; i++)
    {
        char random_char = characters[rand() % num_chars];
        printf("%c", random_char);
    }
    printf("\n");

    return 0;
}
