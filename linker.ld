ENTRY(reset_handler)


_Min_Heap_Size = 0x200; /* required amount of heap */
_Min_Stack_Size = 0x400; /* required amount of stack */

/* Memory section */
MEMORY
{
    CCMRAM    (xrw)    : ORIGIN = 0x10000000,   LENGTH = 64K
    RAM       (xrw)    : ORIGIN = 0x20000000,   LENGTH = 128K
    FLASH     (rx)     : ORIGIN = 0x8000000,    LENGTH = 1024K
}
 
/* Variable Sections */ 

SECTIONS
{
 
    .text :
    {
       . = ALIGN(4);          
       *(.isr_vector)        
       *(.text)
       *(.rodata)
       _etext = .;
    } >FLASH  
 

    .data :
    {
         . = ALIGN(4);
        _sdata = .;
        *(.data)
        _edata = .; 
    } >RAM AT> FLASH  
    
    .bss :
    {   
        . = ALIGN(4);
        *(COMMON)
         _sbss = .;
        *(.bss) 
    }>RAM 

}