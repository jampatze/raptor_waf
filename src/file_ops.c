#include "file_ops.h"
#include "mem_ops.h"


// write line in file
int WriteFile(char *file,char *str)
{
	FILE *arq;
 
	arq=fopen(file,"a"); 

	if ( arq == NULL ) 
	{
//		fclose(arq);
		DEBUG("error in WriteFile() %s",file); 
		return 0;
	}

	fprintf(arq,"%s\n",str); 

	if( fclose(arq) == EOF )
	{
		DEBUG("error in Write() file %s",file);
		return 0;
	}
	arq=NULL;
 

	return 1;
}



