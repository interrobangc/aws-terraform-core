EX_SIMPLE_PWD = examples/simple

TF_VER = v0.13.2

include ./makefiles/*.make

install: keygen init get

keygen:
	if [ ! -d ".ssh" ]; then mkdir .ssh; fi
	if [ ! -f ".ssh/terraform" ]; then ssh-keygen -f .ssh/terraform; fi


