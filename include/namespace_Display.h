struct PrimMem
{
	// 0x0
	int size;		// 74 [0]

	// 0x4
	void* start;	// 78 [1]

	// 0x8
	void* end;		// 7c [2]

	// 0xC
	// Pointer to location of next primitive, as per primitive buffers
	void* curr;		// 80 [3]

	// 0x10
	void* endMin100;	// 84 -- exists why?

	// 0x14
	int unk1;		// 88

	// 0x18
	int unk2; 		// 8c [6] in FUN_800349c4, +0x23 in 8003b0f0
};

struct OTMem
{
	// 0x0
	int size;		// 90

	// 0x4
	u_long* start;	// 94

	// 0x8
	u_long* end;		// 98

	// 0xC
	u_long* curr;		// 9c

	// 0x10
	u_long* startPlusFour; // a0
};

typedef struct _NikoFakeDrEnv
{
	u_long* tag;
	u_long unk[15];
} NikoFakeDrEnv;

typedef struct {
	RECT		clip;		// Drawing area
	int16_t		ofs[2];		// GPU draw offset (relative to draw area)
	RECT		tw;			// Texture window
	uint16_t	tpage;		// Initial tpage value
	uint8_t		dtd;		// Dither processing flag (simply OR'ed to tpage)
	uint8_t		dfe;		// Drawing to display area blocked/allowed (simply OR'ed to tpage)
	uint8_t		isbg;		// Clear draw area if non-zero
	uint8_t		r0, g0, b0;	// Draw area clear color (if isbg iz nonzero)
	NikoFakeDrEnv		dr_env;		// GPU primitive cache area (used internally)
} FAKE_DRAWENV;

// 0xA4
struct DB
{
  // 0x00
  FAKE_DRAWENV drawEnv;

  // 0x5C
  DISPENV dispEnv;

  // 0x70
  int unk_primMemRelated;

  // 0x74
  struct PrimMem primMem;

  // 0x90
  struct OTMem otMem;
};

_Static_assert(sizeof(struct PrimMem) == 0x1C);
_Static_assert(sizeof(struct OTMem) == 0x14);
_Static_assert(sizeof(struct DB) == 0xA4);