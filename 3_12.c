#include <stdio.h>
int main()
{
	char password[20] = {0};
	char res;
	int ch = 0;
	printf("请输入密码");
	scanf("%s",password);
	while(ch== getchar() ==  "\n")
	{
		;
	};
	printf("请确认密码Y/N");
	res = getchar();
	if(res == 'Y')
	{
		printf("确认成功");
	}else{
		printf("确认失败");
	}
	return 0;
 } 
