#include <common.h>

void TitleFlag_SetFullyOnScreen();
void TitleFlag_SetCanDraw(int enable);

// replace call to FullyOffScreen in main(), with this
void MyFlagFunc()
{
	// draw flag when loading, so screen isn't just frozen
	TitleFlag_SetFullyOnScreen();

	// without this, Sep3 wont work
	TitleFlag_SetCanDraw(1);
}