//this file serves the purpose for #include'ing all of the source files for saphi (i.e., replaces ModsX.c)
#include "global.h"

#include "hooks.c"
#include "menu.c"
#include "states.c"
#include "endOfRaceUI.c"
#include "zMirrorMode.c"
#include "names3d.c"
#include "misc_states1.c"
#include "timestamp.c"
#include "thread.c"
#include "lap.c"

typedef void (*VehicleFuncPtr)(struct Thread* thread, struct Driver* driver);

void RunVehicleThread(VehicleFuncPtr func, struct Thread* thread, struct Driver* driver)
{
	UpdateCheckpointTracker(driver->driverID);
	if (func == nullptr) { return; }

	bool restore = false;
	if ((sdata->gGT->gameMode1 & END_OF_RACE) && (checkpointTracker[driver->driverID].raceFinished == 0))
	{
		sdata->gGT->gameMode1 &= ~(END_OF_RACE);
		restore = true;
	}
	func(thread, driver);
	if (restore) { sdata->gGT->gameMode1 |= END_OF_RACE; }
}

void RunVehicleSet13(struct Thread* dThread, struct Driver* dOnline)
{
	if (dThread->funcThTick != 0)
		return;

	// This only works because we have NO collision
	// and therefore NO bounce physics, update P1
	// first, then update other drivers later

	// We can still "eventually" have mask-weapon
	// collision, but no "bounce" physics with this logic

	for (int iVar11 = 0; iVar11 < 13; iVar11++)
	{
		int pcVar5 = dOnline->funcPtrs[iVar11];

		if (pcVar5 == 0)
			continue;

		RunVehicleThread(pcVar5, dThread, dOnline);

#ifdef USE_60FPS
#ifndef REBUILD_PS1
		// if this function just ran
		if (pcVar5 == VehFrameProc_Driving)
		{
			// only if jumping animation,
			// otherwise wheelie gets bugged
			if (dOnline->instSelf->animIndex == 3)
			{
				dOnline->matrixIndex =
					dOnline->matrixIndex >> 1;
			}
		}
#endif
#endif
	}
}

void FixReservesIncrement(struct Driver* driver, int reserves)
{
	if (driver->reserves > 30000) { driver->uncappedReserves += reserves; }
	else { driver->reserves += reserves; }
}

void Online_CollidePointWithBucket(struct Thread* th, short* vec3_pos)
{
	if (!(octr->onlineGameModifiers & MODIFIER_ITEMS)) { return; }
	while (th != 0)
	{
		DECOMP_PROC_CollidePointWithSelf(th, vec3_pos);

		// next
		th = th->siblingThread;
	}
}

unsigned int checkpointTimes[(MAX_LAPS * CPS_PER_LAP) + 1];
#ifndef REBUILD_PC
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

#endif