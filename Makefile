
CC=arm-none-eabi-gcc
MACH=cortex-m4
LDFLAGS		= -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=nano.specs -T linker.ld -Wl,-Map=main.map
LDFLAGS_SH	= -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=rdimon.specs -T linker.ld -Wl,-Map=main.map

 
clear: 
	rm -rf *.o *.elf *.map *.bin

compile:
	arm-none-eabi-gcc  -c -mcpu=cortex-m4 -mthumb-interwork -mthumb -std=gnu11 -O0  *.c
	echo "Compiled\n"
	$(CC) $(LDFLAGS) -o main.elf  *.o
	echo "Linked\n"
	arm-none-eabi-objdump -h main.elf > main_log 
	arm-none-eabi-objcopy -O binary main.elf main.bin 	
	arm-none-eabi-size -tA main.elf

compile1:
	
	#arm-none-eabi-gcc  -o main.elf *.c --specs=nano.specs -std=gnu11   -O0   -mlittle-endian -mthumb -mthumb-interwork -mcpu=cortex-m4 -fsingle-precision-constant -Wdouble-promotion 
 
upload:
	st-flash write main.bin 0x8000000
