typedef __UINT32_TYPE__ uint32_t;

#define SRAM 0x20000000
#define SIZE (128U * 1024U)
#define STACK_START  SRAM + SIZE
 
int extern_ = 10; 

void reset_handler(void)
{

}

void default_handler(void)
{

}

void nmi_handler(void) __attribute__((alias("default_handler")));

int vector[] __attribute__((section("isr_vector"))) = 
{
   STACK_START,
   (uint32_t)&reset_handler,
   (uint32_t)&nmi_handler,
   (uint32_t)&default_handler
};
 
 

 