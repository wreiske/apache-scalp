SRCS=hash.cpp stree/stree.cpp loken.cpp converter.cpp rule.cpp output.cpp main.cpp
OBJS=$(patsubst %.cpp, %.o, $(SRCS))
EXEC=scalp
CC=g++
CFLAGS=-Wall -pedantic -O3 -fstrict-aliasing -finline-functions -funroll-loops -std=c++98 -fPIC  -D_REENTRANT
OFLAGS=-lxml2 -lpcrecpp -lboost_thread-mt
LFLAGS= -L /usr/lib/x86_64-linux-gnu/ -L /usr/lib64
INC=-I/usr/include/libxml2 -I/usr/local/include -I/usr/lib64/

%.o : %.cpp
	$(CC) -c $(CFLAGS) $(INC) $< -o $@

$(EXEC) : $(OBJS)
	$(CC) -o $(EXEC) $(OBJS) $(LFLAGS) $(OFLAGS)

.PHONY: clean
clean:
	@rm -f $(OBJS) $(EXEC)

