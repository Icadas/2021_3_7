
#include <stdio.h>
int main()
{
	char password[20] = {0};
	char ret="";
	int i;
	printf("请输入密码");
	scanf("%s",password);
	for(i=0;i<sizeof(password);i++)
	{
		putchar(password[i]);
	}
	printf("\n");
	printf("请在确认一下哈Y/N\n");
	scanf("%c",ret);
	if(ret == 'Y')
	{
		putchar("输出成功");
	}
	return 0;
}
