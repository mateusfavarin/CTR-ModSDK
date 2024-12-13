#include <common.h>
#include "global.h"

void RECTMENU_OnPressX(struct RectMenu* b)
{
	//do nothing
}

static struct MenuRow menuRows[9] =
{
	{0,0,1,0,0},
	{0,0,2,1,1},
	{0,1,3,2,2},
	{0,2,4,3,3},
	{0,3,5,4,4},
	{0,4,6,5,5},
	{0,5,7,6,6},
	{0,6,7,7,7},

	// NULL, end of menu
	{
		.stringIndex = 0xFFFF,
		.rowOnPressUp = 0,
		.rowOnPressDown = 0,
		.rowOnPressLeft = 0,
		.rowOnPressRight = 0,
	}
};

static struct RectMenu menu =
{
	// custom string made myself
	.stringIndexTitle = 0x4e,

	.posX_curr = 0, // X position
	.posY_curr = 0,  // Y position

	.unk1 = 0,

	// 0b11, 2 centers X, 1 centers Y, 0x80 for tiny text
	// 0x100000 disables TRIANGLE button to prevent crashing
	.state = 0x100083,

	.rows = menuRows,

	.funcPtr = RECTMENU_OnPressX,

	.drawStyle = 0x4,	// 0xF0 looks like load/save

	.posX_prev = 0,
	.posY_prev = 0,

	.rowSelected = 0,
	.unk1c = 0,
	.unk1e = 0,
	.width = 0,
	.height = 0,

	.ptrNextBox_InHierarchy = 0,
	.ptrPrevBox_InHierarchy = 0,
};

static uint8_t menuPageNumber = 0;
static uint8_t menuMaxPageCount = 0;
static void (*menuDrawPage)(uint8_t); //1st param of func pointer is pageNumber
static bool menuShow = false;
static bool menuIsDynamic = false;
static bool otd_menuDraw = true;

void MenuTick(uint8_t* state, uint8_t* row, uint8_t* pageNumber)
{
	*state = 0;

	int buttons = sdata->gGamepads->gamepad[0].buttonsTapped;

	if (buttons & (BTN_LEFT | BTN_RIGHT)) { DECOMP_OtherFX_Play(0, 1); } //carat move sound
	if (buttons & BTN_LEFT) { menuPageNumber = max(0, menuPageNumber - 1); }
	else if (buttons & BTN_RIGHT) { menuPageNumber = min(menuMaxPageCount - 1, menuPageNumber + 1); }
	else if (buttons & BTN_CROSS)
	{
		if (!(menuRows[menu.rowSelected].stringIndex & 0x8000))
		{
			*state |= MENUSTATE_PRESSED_CROSS;
			DECOMP_OtherFX_Play(1, 1);
		}
		//else (womp sound plays automatically via the menu's builtin code).
	}
	else if (buttons & BTN_TRIANGLE)
	{
		*state |= MENUSTATE_PRESSED_TRIANGLE;
		DECOMP_OtherFX_Play(2, 1);
	}

	*pageNumber = menuPageNumber;
	*row = menu.rowSelected;

	if (menuShow)
	{
		RECTMENU_Show(&menu);
		if (menuMaxPageCount > 1)
		{
			//very clever (only works if <= 9 pages).
			int string =
				(('1' + menuPageNumber) << 0) |
				('/' << 8) |
				(('1' + (menuMaxPageCount - 1)) << 16);

			DECOMP_MainFreeze_ConfigDrawArrows(menu.posX_curr, 0x48, &string);
			DecalFont_DrawLine(&string, menu.posX_curr, 0x48, FONT_BIG, JUSTIFY_CENTER | WHITE);
		}
		if (menuIsDynamic || otd_menuDraw)
		{
			otd_menuDraw = false;
			(*menuDrawPage)(menuPageNumber);
		}
	}
	else
		RECTMENU_Hide(&menu);
}

void SetCursorPosition(uint8_t row, uint8_t pageNumber)
{
	menu.rowSelected = row;
	menuPageNumber = pageNumber;
}

void SetRowString(uint8_t row, char* string)
{
	int selectMask = menuRows[row].stringIndex & 0x8000;
	menuRows[row].stringIndex = (0x9a + row) | selectMask;
	sdata->lngStrings[0x9a + row] = string;
}

void SetRowInternalString(uint8_t row, char* string)
{
	int selectMask = menuRows[row].stringIndex & 0x8000;
	menuRows[row].stringIndex = (char*)((((int)string) & ~(0x8000)) | selectMask);
}

void SetRowSelectable(uint8_t row, bool selectable)
{
	if (selectable)
		menuRows[row].stringIndex &= ~(0x8000);
	else
		menuRows[row].stringIndex |= 0x8000;
}

void SetMenuPosition(uint16_t* x, uint16_t* y, int16_t* w, int16_t* h)
{
	if (x)
		menu.posX_curr = *x;
	if (y)
		menu.posY_curr = *y;
	if (w)
		menu.width = *w;
	if (h)
		menu.height = *h;
}

void SetMenuContents(void (*drawPage)(uint8_t), uint8_t maxPageCount, bool isDynamic) //1st param of func pointer is pageNumber
{
	//todo: change isDynamic to an enum
	//0 = call drawPage only once (upon calling SetMenuContents)
	//1 = call drawPage only once every page change
	//2 = call drawPage every frame
	if (drawPage != menuDrawPage)
		otd_menuDraw = true; //reassigning the same draw function shouldn't redraw
	menuDrawPage = drawPage;
	menuMaxPageCount = maxPageCount;
	menuIsDynamic = isDynamic;
	if (menuMaxPageCount <= menuPageNumber - 1)
		menuPageNumber = menuMaxPageCount - 1;
}

void SetMenuShow(bool show)
{
	if (!menuShow && show) //wasn't being shown, now is
		SetCursorPosition(0, 0); //zero the cursor pos
	menuShow = show;
	if (show)
		sdata->ptrActiveMenu = &menu;
	else
		sdata->ptrActiveMenu = 0;
}