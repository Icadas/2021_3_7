#include <stdio.h>
int main()
{
	char pass;
	while((pass = getchar()) != EOF )
	{
		if(pass<'0' && pass > '9')
		{
			printf("�������");
			continue;
		}
		putchar(pass);
	}
	return 0;
 } 
