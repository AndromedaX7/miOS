include ../Makefile.head

all:bootsect

bootsect:bootsect.s
	@echo  $(LDFLAGS)
	$(AS) $(ASFLAGS) -o bootsect.o bootsect.s
	$(LD) $(LDFLAGS) -o bootsect bootsect.o
	cp -f bootsect bootsect.sym
	nm bootsect.sym | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aU] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)'| sort > bootsect.map
	$(OBJCOPY) -R.pdr -R.comment -R.note -S -O binary bootsect


setup:setup.s
	$(AS) $(ASFLAGS) -o setup.o setup.s
	$(LD) $(LDFLAGS) -o setup setup.o
	cp -f setup setup.sym
	nm setup.sym | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aU] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)'| sort > setup.map
	$(OBJCOPY) -R.pdr -R.comment -R.note -S -O binary setup

clean:
	-rm bootsect bootsect.o bootsect.sym bootsect.img bootsect.map
	-rm setup setup.o setup.sym  setup.map

run:bootsect setup
	dd bs=512 if=bootsect of=bootsect.img count=1
	dd bs=512 if=setup of=bootsect.img seek=1 count=4
	$(QEMU)  -m 20M -boot a -fda bootsect.img
