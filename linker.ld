ENTRY(Reset_Handler)

MEMORY
{
  CCMRAM    (xrw)    : ORIGIN = 0x10000000,   LENGTH = 64K
  SRAM      (xrw)    : ORIGIN = 0x20000000,   LENGTH = 128K
  FLASH     (rx)    : ORIGIN = 0x8000000,   LENGTH = 1024K
}


SECTIONS
{
  .text :
  {
    *(.isr_vector)
    *(.text)
	*(.text.*)
	*(.init)
	*(.fini)
	*(.rodata)
	*(.rodata.*)
	. = ALIGN(4);
	_etext = .;
  }> FLASH
  
  _la_data = LOADADDR(.data);
  
  .data :
  {
    _sdata = .;
	*(.data)
	*(.data.*)
	. = ALIGN(4);
	_edata = .;
  }> SRAM AT> FLASH
  
  .bss :
  {
    _sbss = .;
	__bss_start__ = _sbss;
	*(.bss)
	*(.bss.*) 
	*(COMMON)
	. = ALIGN(4);
	_ebss = .; 
	__bss_end__ = _ebss;
	   . = ALIGN(4); 
	end = .;
	__end__ = .;
  }> SRAM
  

  
}