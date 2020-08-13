#include <stdio.h>

int main(int argc, char* argv[]) {
 /* 
 printf("argc = %d\n", argc);
    for (int i = 0; i < argc; i++)
    {
         printf("argv[%d] = %s\n", i, argv[i]);
    }
  */
  char *s = argv[1];
  if (s[0] == '2'){
    printf("is prime %s\n",argv[1]);
    return 0;
  }
  printf("is not prime %s\n",argv[1]);
  return 0;
}