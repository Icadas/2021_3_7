
#include <stdio.h>
int main()
{
	char password[20] = {0};
	char ret="";
	int i;
	printf("����������");
	scanf("%s",password);
	for(i=0;i<sizeof(password);i++)
	{
		putchar(password[i]);
	}
	printf("\n");
	printf("����ȷ��һ�¹�Y/N\n");
	scanf("%c",ret);
	if(ret == 'Y')
	{
		putchar("����ɹ�");
	}
	return 0;
}
