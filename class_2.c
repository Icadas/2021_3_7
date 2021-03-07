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
//			printf("分别是 = %d\n = %d\n",sizeof(arr1),sizeof(arr2));
//		}
//	}
//	return 0;
// } 


//#include <stdio.h>
//int main()
//{
//	char arr1[50] = {'a','b','c'};
//	printf("%d\n",strlen(arr1));	//只会计算到/0结束的位置 
//	printf("%d\n",sizeof(arr1));   //计算的是内存中的数据 
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
//	//sizeof和strlen的区别是看是否加不加后边的/0 
//	//
//	return 0;
//}

//#include <stdio.h>
//int main()
//{
//	char a[] = {"abc"};
//	char b[] = {'a','b','c'};
//	printf("%d\n%d",strlen(a),strlen(b));//这个是直接判断以0结束的，故所有都是3 
//	return 0;	
//} 

//输出两个双引号 
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
//	printf("好好学习吗(1>0)");
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
//		printf("加入我们吗？");
//		scanf("%d",&num);
//		//比1大，比5小的
//		switch(num)
//		{
//			case 2:
//				printf("老实学习\n");
//			break; 
//			case 3:
//				printf("依旧是菜鸟\n");
//			break;
//			case 4:
//				printf("您中了500w\n"); 
//				num = 1;
//			break;			 
//		} 
//		{
//			line++;
//		}
//	}while(num != 1);
//	printf("您一共写了%d行代码\n",line);
//	printf("恭喜你迎娶白富美");
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
//		printf("写代码  %d\n",line);
//		for(num==b;num++;)  
//		{
//			printf("好offer  %d\n",num); 
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
