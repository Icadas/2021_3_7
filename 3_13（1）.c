#include <stdio.h>
int main()
{
	char password[20] = {0};
	char res;
	int c =  0;
	printf("����������");
	scanf("%s",password);
	while((res=getchar())  =='\n')
	{
		;
	}
	printf("��ȷ������Y/N");
	c=getchar();
	if(c=='Y')
	{
		printf("����ɹ�");
	}else{
		printf("���ʧ��");
	}
	return 0;
}
