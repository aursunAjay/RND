convert:
	arm-none-eabi-objcopy -O binary main.elf main.bin

clean:
	 
	rm -f main.o startup.o main.elf syscall.o main.map main_log main.bin

compile:
	arm-none-eabi-gcc  -c -mcpu=cortex-m4  -mthumb -std=gnu11 -O0   *.c
	arm-none-eabi-gcc -nostdlib -T linker.ld  -Wl,-Map=main.map -o main.elf  *.o
	arm-none-eabi-objdump -h main.elf > main_log 
	arm-none-eabi-size -tA main.elf


compile1:
	arm-none-eabi-gcc  -o main.elf *.c    --specs=nosys.specs -std=gnu11 -g -O0   -mlittle-endian -mthumb -mthumb-interwork -mcpu=cortex-m4 -fsingle-precision-constant -Wdouble-promotion 
 
upload:
	st-flash write main.bin 0x8000000