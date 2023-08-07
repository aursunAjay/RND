#include <stdio.h>
#include <stdint.h>
#define LED_GREEN  12
#define LED_ORANGE 13
#define LED_RED    14
#define LED_BLUE   15

#define DELAY_COUNT_1MS 		 1250U
#define DELAY_COUNT_1S  		(1000U * DELAY_COUNT_1MS)
#define DELAY_COUNT_500MS  		(500U  * DELAY_COUNT_1MS)
#define DELAY_COUNT_250MS 		(250U  * DELAY_COUNT_1MS)
#define DELAY_COUNT_125MS 		(125U  * DELAY_COUNT_1MS)


void led_on(uint8_t led_no)
{
  uint32_t *pGpiodDataReg = (uint32_t*)0x40020C14;
  *pGpiodDataReg |= ( 1 << led_no);

}

void led_off(uint8_t led_no)
{
	  uint32_t *pGpiodDataReg = (uint32_t*)0x40020C14;
	  *pGpiodDataReg &= ~( 1 << led_no);

}

 void delay(uint32_t count)
{
  for(uint32_t i = 0 ; i < count ; i++)
  {
    for(int a=0;a<100;a++);
  }
}

void led_init_all(void)
{

	uint32_t *pRccAhb1enr = (uint32_t*)0x40023830;
	uint32_t *pGpiodModeReg = (uint32_t*)0x40020C00;


	*pRccAhb1enr |= ( 1 << 3);
	//configure LED_GREEN
	*pGpiodModeReg |= ( 1 << (2 * LED_GREEN));
	*pGpiodModeReg |= ( 1 << (2 * LED_ORANGE));
	*pGpiodModeReg |= ( 1 << (2 * LED_RED));
	*pGpiodModeReg |= ( 1 << (2 * LED_BLUE));

#if 0
	//configure the outputtype
	*pGpioOpTypeReg |= ( 1 << (2 * LED_GREEN));
	*pGpioOpTypeReg |= ( 1 << (2 * LED_ORANGE));
	*pGpioOpTypeReg |= ( 1 << (2 * LED_RED));
	*pGpioOpTypeReg |= ( 1 << (2 * LED_BLUE));
#endif

    led_off(LED_GREEN);
    led_off(LED_ORANGE);
    led_off(LED_RED);
    led_off(LED_BLUE);



}


int main(void)
{    
    led_init_all();

 while(1)
  {

     led_on(LED_RED);
    led_on(LED_GREEN);
    led_on(LED_ORANGE);
    led_on(LED_RED);
    led_on(LED_BLUE);
    delay(500);
   
    led_off(LED_GREEN);
    led_off(LED_ORANGE);
    led_off(LED_RED);
    led_off(LED_BLUE);
     delay(500);
   
 }
      return 0;
}