//#include <stdio.h>
//#include <string.h>
//int add(int a,int b)
//{
//	int num = a+b;
//	return num;
//};
//int main()
//{
//	int result = add(15,16);
//	printf("%d",result);
//	return 0;
// } 
//#include <stdio.h>
//#include <string.h>
//int main()
//{
////	int a = 5%2;
////	int b = a<<2;
////	printf("%d\n",a);
////	printf("%d",b);
//
////	int a = 3;
////	int b = -5;
////	int c = a&b; //��λ�� 
////	printf("%d\n",c);
//	int a = 10;
//	int b = 5;
//	a=a+b;  //�õ��ܺ�
//	b=a-b;
//	a=a-b;
//	printf("%d\n%d",a,b);
//	//int c = 0;
//	//������ʹ�õ���������
//	 
////	printf("֮ǰ������:%d %d\n",a,b); 
////   	c=b;
////	b=a;
////	a=c;
////	printf("�������������:%d %d\n",a,b); 
//	return 0; 
//}

//	//�������������������� 
//#include <stdio.h>
//int main()
//{
//	int a = 18;
//	int b = 3;
//	a = a^b; 
//	b = a^b;
//	a = a^b;
//	printf("%d\n",a);
//	printf("%d\n",b);
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	//���Ǹ�Ψһ������ 
//	int c = 0;
//	int c1 = 0;
//	int a[] = {1,2,3,4,5,1,2,3,4};
//	int sz = sizeof(a)/ sizeof(a[0]);
//	for(;c<sz;c++)
//	{
//		printf("���������� = %d\n",a[c]);
//		int count = 0;
//		for(;c1<sz;c1++)
//		{
//			if(a[c] == a[c1])
//			{
//				count++;
//			}
//		}
//		if(count == 1)
//		{
//			printf("%d\n",a[c]);
//		}
//		c1=0;
//		//leetcode
//	}
//	return 0;
// } 

//#include <stdio.h>
//int main()
//{
//	int a = 10;
//	int b = 5;
//	printf("%d\n%d\n",a,b);
//	a = a+b;
//	b = a-b;
//	a = a-b;
//	printf("%d\n%d\n",a,b);
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	int i = 0;
//	int j = 0;
//	int arr[] = {1,2,3,4,5,1,2,3,4};
//	int result = sizeof(arr)/sizeof(arr[0]);  //���ڴ��С/�����ڴ��С=�ܸ��� 
//	
//	for(;i<result;i++)
//	{
//		int count = 0;
//		printf("������=%d\n",arr[i]); 
//		for(;j<result;j++)
//		{
//			printf("\t��ʼ\n");
//			printf("�ȶԵ�������=%d\n",arr[j]);
//			if(arr[i] == arr[j])
//			{
//				count++;
//				printf("����\t%d\n",count);
//				//printf("������%d\n",count);
//			}
//			printf("\t����\n"); 
//		}
//		if(count == 1)
//		{
//			printf("��%d\n",arr[i]);
//		}
//		j=0;
//		printf("\n-------------\n");
//	}
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//    printf("%15d",0xABCDEF);
//    return 0;
//}

//#include <stdio.h>
//int main()
//{
//	int a = 0;
//	int b = 0;
//	printf("���������\n");
//	scanf("%d %d",&a,&b);
//	if(a>b)
//	{
//		printf("�����ֵ%d��\n",a);
//	}else if(a == b)
//	{
//		printf("�������");
//	}
//	else{
//		printf("�����ֵ%d��",b); 
//	}
//	return 0;
//}

//#include <stdio.h>
//int result(int a,int b)
//{
//	if(a>b)
//	{
//		return 1;	
//	}else if(a == b)
//	{
//		return 2;
//	}else {
//		return 0;
//	}
//}
//int main()
//{
//	int b = 0;
//	int c = 0;
//	int num = 0;
//	
//	scanf("%d %d",&b,&c);
//	num = result(b,c);
//	printf("%d",num);
//	return 0;
//}
//  

//#include <stdio.h>
//int main()
//{
//	int a = (int)10.6;
//	//int b = a--;   //�ȸ�ֵ����� 
//	int b = --a;   //�ȼ�������ֵ 
//	printf("%d %d\n",a,b);
//	printf("%d %d\n",a,b);
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//  register int a = 16;   //�����a��ɼĴ������� 
//	int b = 15;
//	a>b?printf("1"):printf("0");
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	typedef int c;
//	c  a =  10;
//	printf("%d\n",a); 
//	return 0;
//} 

//#include <stdio.h>
//extern void add();
//int main()
//{
//	int i = 0;
//	while(i<5)
//	{
//		add();
//		i++;
//	}
//	return 0;
//}

//#include <stdio.h>
//#define MAX(x,y) (x>y?x:y)
//int main()
//{
//	int result = 0;
//	result = MAX(15,16);
//	printf("%d",result);
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	int a = 0;
//	int* p = &a;  //ָ����������ָ��ĵ�ַ 
//	printf("%p\n",&a);
//	*p = 10;  //�����ò����� 
//	printf("%p\n",p);
//	printf("%d\n",a);
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	char p = 'a';
//	char* c = &p;
//	*c = 'f';
//	printf("%d\n",sizeof(c));
//	return 0;
// } 

//#include <stdio.h>
//int main()
//{
//	int a = 10;
//	int* c = &a;
//	*c = 20;
//	printf("%p",c);
//	printf("%d",a);
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	double b = 3.14;
//	double* pd = &b;
//	//*pd= 5.5;
//	printf("%lf\n",b);
//	printf("%d\n",sizeof(pd));	
//	printf("%d\n",sizeof(char*));	
//	printf("%d\n",sizeof(short*));
//	return 0;
//}

//#include <stdio.h>
//#include <string.h>
////�ṹ������ 
//struct Book
//{
//	char name[20];
//	short price;
//};
//int main()
//{
//	//���ýṹ�����ͣ�����һ�������͵Ľṹ����� 
//	struct Book b1 = {
//		"C���Գ������",55
//	};
//	struct Book* pd = &b1;   //�ṹ��ָ����� 
//	(*pd).price = 5; 
//	strcpy(pd->name,"C++");
//	printf("����%d\n",(*pd).price);
//	printf("����%s\n",pd->name); //ָ������ָ�� 
//	
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	int age = 10;
//	if(age<18)
//	{
//		printf("%d\n",age);
//	}
//	return 0;
// } 

//#include <stdio.h>
//int main()
//{
//	int num = 0;
//	printf("������һ����");
//	int* p = &num;
//	scanf("%d",&num);     //Ϊʲôscanf���ܴ��ָ����� 
//	printf("%d",num);
//	if(num%2!=0)
//	{
//		printf("����һ������");
//	 } 
//	return 0;
// } 

//#include <stdio.h>
//int main()
//{
//	int num=0;
//	for(;num<=100;num++)
//	{
//		printf("%d\n",num);
//		
//		if(num%2!=0)
//		{
//			printf("%d\n",num);	
//			switch(num)
//			{
//				case 1:
//				case 55:
//				case 9:
//					printf("˧��");
//					break;
//				default:
//					printf("������");
//					break;
//			}
//		} 
//	}
//	
//	return 0;
// } 
//#include  <stdio.h>
//int main()
//{
//	int a = 1;
//	switch(a)
//	{
//		case 1:
//			printf("+++");
//		case 2:
//			printf("-----");
//			break;
//	}
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	int n = 1;
//	int m = 2;
//	switch(n)
//	{
//		case 1:m++;
//		case 2:n++;
//		case 3:
//			switch (n)
//			{
//				case 1:n++;
//				case 2:m++;
//					break;
//			}
//		case 4:m++;
//				break;
//		default:
//				break;
//	}
//	printf("m = %d,n = %d\n",m,n);
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	int i = 1;
//	while(i<10)
//	{
//		i++;
//		if(i==5)
//		{
//			continue;
//		}
//		printf("%d",i);
//		
//	}
//	return 0;
//}

#include <stdio.h>
int main()
{
	char c = 0;
	while ((c =getchar()) != EOF )
	{
		putchar(c);
	}
	return 0;
}


