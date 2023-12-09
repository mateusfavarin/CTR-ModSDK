#include <common.h>

void DECOMP_CAM_FollowDriver_Spin360(struct CameraDC* cDC, int param_2, struct Driver* d, short* desiredPos, short* desiredRot)
{
  int ratio;
  short posX;
  
  // rotate one way
  posX = cDC->transitionTo.pos[0];
  
  // rotate other way for odd number
  if ((d->driverID & 1) != 0)
	posX = -posX;

  int angle = cDC->unk90 + posX;
  cDC->unk90 = angle;

  ratio = MATH_Sin(angle);
  desiredPos[0] = (short)(d->posCurr[0] >> 8) + (short)((ratio * cDC->transitionTo.pos[2]) >> 0xc);

  ratio = MATH_Cos(angle);
  desiredPos[2] = (short)(d->posCurr[2] >> 8) + (short)((ratio * cDC->transitionTo.pos[2]) >> 0xc);

  desiredPos[1] = (short)(d->posCurr[1] >> 8) + cDC->transitionTo.pos[1];

  DECOMP_CAM_LookAtPosition(param_2, d->posCurr, desiredPos, desiredRot);
  return;
}