//#include <stdio.h>
//int main()
//{
//	char arr1[] = "aln";  //4
//	char arr2[] = {'a','l','n'};  //3
//	printf("%s\n",arr1);
//	printf("%s\n",arr2);
//	{
//		int a = 10;
//		if(arr1 == arr2)
//		{
//			printf("%d",a);
//		}else{
//			printf("�ֱ��� = %d\n = %d\n",sizeof(arr1),sizeof(arr2));
//		}
//	}
//	return 0;
// } 


//#include <stdio.h>
//int main()
//{
//	char arr1[50] = {'a','b','c'};
//	printf("%d\n",strlen(arr1));	//ֻ����㵽/0������λ�� 
//	printf("%d\n",sizeof(arr1));   //��������ڴ��е����� 
//	return 0;
//}

//#include <stdio.h> 
//#include <string.h>
//int main()
//{
//	char arr1[100] = {};
//	strcpy(arr1,"abcd");
//	
//	int str_len = strlen(arr1);
//	int str_size = sizeof(arr1);
//	
//	printf("%d\n%d",str_len,str_size);
//	return 0;
//}

//#include <stdio.h>
//#include <string.h>
//int main()
//{
//	char  a[]= {"hello"};
//	printf("%s\nsize = %d\nstrlen = %d\n",a,strlen(a),sizeof(a));
//	//sizeof��strlen�������ǿ��Ƿ�Ӳ��Ӻ�ߵ�/0 
//	//
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	char a[] = {"abc"};
//	char b[] = {'a','b','c'};
//	printf("%d\n%d",strlen(a),strlen(b));//�����ֱ���ж���0�����ģ������ж���3 
//	return 0;	
//} 

//�������˫���� 
//#include <stdio.h>
//int main()
//{
//	char a[] = {'"','"'};
//	printf("Niha\?\?\n\a");
//	printf("%d",strlen("c:\test\32\test.c"));
//	printf("%s",a);
//	return 0;
// } 

//#include <stdio.h>
//int main()
//{
//	int a = 0;
//	printf("�ú�ѧϰ��(1>0)");
//	scanf("%d",&a);
//	if(a == 1)
//	{
//		printf("Yes");
//	}else{
//		printf("No");
//	}
//	return 0;
// } 

//#include <stdio.h>
//#include <string.h>
//int main()
//{
//	int num = 0;
//	int line = 0;
//	do{
//		printf("����������");
//		scanf("%d",&num);
//		//��1�󣬱�5С��
//		switch(num)
//		{
//			case 2:
//				printf("��ʵѧϰ\n");
//			break; 
//			case 3:
//				printf("�����ǲ���\n");
//			break;
//			case 4:
//				printf("������500w\n"); 
//				num = 1;
//			break;			 
//		} 
//		{
//			line++;
//		}
//	}while(num != 1);
//	printf("��һ��д��%d�д���\n",line);
//	printf("��ϲ��ӭȢ�׸���");
//	
//	return 0;
//}


//#include <stdio.h>
//#define a 3
//#define b 6
//int main()
//{
//	int num = 0;
//	int line = 0;
//	while(line <a)
//	{
//		printf("д����  %d\n",line);
//		for(num==b;num++;)  
//		{
//			printf("��offer  %d\n",num); 
//			if(num >= b){
//				break;
//			}
//		}
//		if(line == a){
//			continue;
//		}
//		line++;
//	} 
//	return 0;
//}
int aaa = 2021;
void add()
{
	static int a = 1;
	a++;
	printf("%d\n",a); 
} 
