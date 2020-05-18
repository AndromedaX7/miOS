include ../Makefile.head
LDFLAGS 	+= -Ttext 0 -e _start

all:bootsect

bootsect:bootsect.s
	$(AS) $(ASFLAGS) -o bootsect.o bootsect.s
	$(LD) $(LDFLAGS) -o bootsect bootsect.o
	cp -f bootsect bootsect.sym
	nm bootsect.sym | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aU] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)'| sort > bootsect.map
	$(OBJCOPY) -R.pdr -R.comment -R.note -S -O binary bootsect

clean:
	-rm bootsect bootsect.o bootsect.sym bootsect.img

run:bootsect
	echo $(OS)
	dd bs=32 if=bootsect of=bootsect.img
	$(QEMU) -hda bootsect.img
