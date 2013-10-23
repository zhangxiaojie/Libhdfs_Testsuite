#include "hdfs.h"

int main(int argc, char **argv){
    hdfsFS fs = hdfsConnect("default",0);
    const char *readPath = "/tmp/testfile.txt";
    hdfsFile readFile = hdfsOpenFile(fs,readPath,O_RDONLY,0,0,0);
    if(!readFile){
        fprintf(stderr,"Failed to open %s for reading!\n", readPath);
        exit(-1);
    }
    char *buffer = malloc(100);
    tSize num_readen_bytes = hdfsRead(fs, readFile,(void*)buffer,100);
    if(num_readen_bytes > 0){
        printf("%s",buffer);
    }
    else{
        printf("Failed read!\n");
    }
    free(buffer);
    hdfsCloseFile(fs,readFile);
}
