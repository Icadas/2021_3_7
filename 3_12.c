#include <stdio.h>
int main()
{
	char password[20] = {0};
	char res;
	int ch = 0;
	printf("����������");
	scanf("%s",password);
	while(ch== getchar() ==  "\n")
	{
		;
	};
	printf("��ȷ������Y/N");
	res = getchar();
	if(res == 'Y')
	{
		printf("ȷ�ϳɹ�");
	}else{
		printf("ȷ��ʧ��");
	}
	return 0;
 } 
