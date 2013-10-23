
GCC = gcc -I${HADOOP_HOME}/src/c++/libhdfs -L${HADOOP_HOME}/libhdfs -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux -L${HADOOP_HOME}/build/c++/Linux-amd64-64/lib/ -Wl,-rpath-link=${JAVA_HOME}/jre/lib/amd64/server -L${JAVA_HOME}/jre/lib/amd64/server

.PHONY: all
all: put  get
#If I put -lhdfs on $(GCC), it wouldn't work. So I put it here.
put: put.o 
	$(GCC) put.o -o put -lhdfs
put.o: put.c /home/zhang/hadoop-1.2.1/src/c++/libhdfs/hdfs.h
	$(GCC) -c put.c
get: get.o
	$(GCC) get.o -o get -lhdfs
get.o: get.c /home/zhang/hadoop-1.2.1/src/c++/libhdfs/hdfs.h
	$(GCC) -c get.c

.PHONY: clean
clean:
	rm -rf *.o
