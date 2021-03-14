#include <stdio.h>
int main()
{
	char password[20] = {0};
	char res;
	int c =  0;
	printf("请输入密码");
	scanf("%s",password);
	while((res=getchar())  =='\n')
	{
		;
	}
	printf("请确认密码Y/N");
	c=getchar();
	if(c=='Y')
	{
		printf("输出成功");
	}else{
		printf("输出失败");
	}
	return 0;
}
