#ifdef USE_ONLINE
#include "OnlineCTR/global.h"
unsigned int checkpointTimes[(MAX_LAPS * CPS_PER_LAP) + 1];
#ifndef REBUILD_PC
//moved from mods1
void AssignMeterGrade(struct Driver* driver, int meterLeft)
{
	const int gradeTreshold[] = { SECONDS(1) * FP(0.50), SECONDS(1) * FP(0.65),
						SECONDS(1) * FP(0.80), SECONDS(1) * FP(0.90),
						SECONDS(1) * FP(0.95) };
	const int gradeColors[] = { TROPY_LIGHT_BLUE, TINY_GREEN, PAPU_YELLOW, ROO_ORANGE, ORANGE_RED };

	driver->meterGradeTimer = SECONDS(0.5);
	driver->meterGrade[1] = '\0';

	char grades[] = "FDCBA";
	for (int i = 0; i < len(gradeTreshold); i++)
	{
		if (meterLeft > SECONDS(1) - FP_INT(gradeTreshold[i]))
		{
			driver->meterGrade[0] = grades[i];
			driver->gradeColor = gradeColors[i];
			return;
		}
	}
	driver->meterGrade[0] = 'S';
	driver->gradeColor = COCO_MAGENTA;
}

void StatsUpgrade()
{
	/*
		Stat 9 is acceleration,
		Stats 11 and 12 speed related
	*/
	for (int i = 9; i < 13; i++)
	{
		for (int j = 0; j < 4; j++)
		{
			data.metaPhys[i].value[j] = data.metaPhys[i].value[4]; // copy MAX
		}
	}
}

#include "OnlineCTR/thread.c"
#endif
#endif