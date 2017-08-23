#include <stdio.h>

int main(){
	int nCol;
	int nRow;
	int i,j;
	int opCode;
	scanf("%d %d %d",&nRow,&nCol,&opCode);
	int A[nRow*nCol];
	for(j=1;j<=nRow*nCol;j++){
			int value;
			scanf("%d",&value);
			A[nRow*nCol-j]=value;
	}
		
	
	for(i=nRow-1;i>=0;i--){
		for(j=nCol-1;j>=0;j--){
			printf("%d ",A[i*nCol+j]);
		}
		printf("\n");
	}
	printf("\n");
	for(i=nRow-1;i>=0;i--){
		for(j=nCol-1;j>=0;j--){
			printf("%d ",255-A[i*nCol+j]);
		}
		printf("\n");
	}
	printf("\n");
	for(i=0;i<nRow;i++){
		for(j=0;j<nCol;j++){
			printf("%d ",A[i*nCol+j]);
		}
		printf("\n");
	}
	printf("\n");
	for(i=nRow-1;i>=0;i--){
		for(j=0;j<nCol;j++){
			printf("%d ",A[i*nCol+j]);
		}
		printf("\n");
	}
}