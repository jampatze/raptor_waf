export MALLOC_MMAP_THRESHOLD_=1
export MALLOC_CHECK_=1
export MALLOC_PERTURB_=1
CC=musl-gcc
CFLAGS=-g -static -v -W -Wall -O1 -fstack-protector-all -I /home/ng/musl/include
DFLAGS= lib/BSD/strsec.c
DIR=src/
DIROUT=bin/
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	LDFLAGS=-Wl -lpthread -lpcre --static -L/usr/local/lib
else
	LDFLAGS=-Wl,-z,relro,-z,now -lpthread -std=c99 -lpcre --static -L/usr/local/lib
endif

Raptor: $(DIR)Raptor.c 
	@echo "           boing         boing         boing           "   
	@echo " e-e           . - .         . - .         . - .        "  
	@echo "(\_/)\       '       \`.   ,'       \`.   ,'       .      "  
	@echo " \`-'\ \`--.___,         . .           . .          .     "  
	@echo "    '\( ,_.-'                                           "  
	@echo "       \\               \"             \"          Compile !"    
	@echo "       ^\' "
	$(CC) $(CFLAGS) $(DFLAGS) -c $(DIR)*.c
	$(CC) -o $(DIROUT)Raptor *.o $(LDFLAGS)
	$(shell make clean)
	@echo "  "
	@echo " Execute \"bin/Raptor\" to start...  "   
clean:
	rm -f *.o Raptor
	



