#include <common.h>

#define ushort u_short

void DECOMP_MM_Battle_MenuBox(struct MenuBox* unused)
{
    char numPlyr;
    ushort uVar4;
    short sVar6;
    int i, j;
    int iVar8;
    int iVar9;
    u_int uVar10;
    u_int color;
    short *psVar11;
    u_int uVar12;
    int iVar13;
    u_short *puVar14;
    int iVar16;
    u_int uVar17;
    short *puVar18;
    short sVar20;
    RECT local_60;
    ushort local_60b[4];
    RECT local_58;
    short local_58b[4];
    RECT local_50;
    RECT local_48;
    RECT local_40;
    short local_38;
    short local_36[3];

    struct MenuBox *box;
    struct GameTracker *gGT = sdata->gGT;

    local_38 = 0;

    // save all five battle settings,
    // these are selected rows from all battle options
    for (i = 0; i < 5; i++)
    {
        D230.battleMenuBoxArray[i]->rowSelected = sdata->battleSettings[i];
    }

    sVar6 = D230.battle_transitionFrames;
    if (D230.battle_transitionState != 1)
    {
        if ((short)D230.battle_transitionState < 2)
        {
            // if transitioning in
            if (D230.battle_transitionState == 0)
            {
                DECOMP_MM_TransitionInOut(&D230.transitionMeta_battle[0], (int)D230.battle_transitionFrames, 8);

                // reduce frames
                sVar6 = D230.battle_transitionFrames - 1;

                // if finished
                if (D230.battle_transitionFrames == 0)
                {
                    // menu is now in focus
                    D230.battle_transitionState = 1;
                    sVar6 = D230.battle_transitionFrames;
                }
            }
        }
        else
        {
            // if transitioning out
            if (D230.battle_transitionState == 2)
            {
                DECOMP_MM_TransitionInOut(&D230.transitionMeta_battle[0], (int)D230.battle_transitionFrames, 8);

                // count frames
                D230.battle_transitionFrames++;

                sVar6 = D230.battle_transitionFrames;

                // if 12 frames past
                if (0xc < D230.battle_transitionFrames)
                {
                    // if starting race
                    if (D230.battle_postTransition_boolStart != 0)
                    {
                        // passthrough MenuBox for funcPtr "TitleBeginTrack"
                        sdata->ptrDesiredMenuBox = &data.menuBox_TitleBeginTrack;
                        return;
                    }

                    // == else goBack ==

                    DECOMP_MM_TrackSelect_Init();
                    sdata->ptrDesiredMenuBox = &D230.menubox_trackSelect;

                    return;
                }
            }
        }
    }
    D230.battle_transitionFrames = sVar6;

    // There are no battle teams (clear flags)
    gGT->battleSetup.teamFlags = 0;

    // there are no battle teams (clear amount of teams)
    gGT->battleSetup.numTeams = 0;

    numPlyr = gGT->numPlyrNextGame;

    // loop through all players
    for (i = 0; i < numPlyr; i++)
    {
        // get the team of each player
        uVar12 = (short)(1 << gGT->battleSetup.teamOfEachPlayer[i]);

        // If we have not accounted for this team existing
        if ((gGT->battleSetup.teamFlags & uVar12) == 0)
        {
            // This team now exists
            gGT->battleSetup.teamFlags |= uVar12;

            // increase number of teams
            gGT->battleSetup.numTeams++;
        }
    }

    for (i = 0; i < 4; i++)
    {
        if ((gGT->battleSetup.teamFlags & (1 << i)) == 0)
        {
            // -500
            gGT->battleSetup.pointsPerTeam[i] = 0xfffffe0c;
        }
        else
        {
            gGT->battleSetup.pointsPerTeam[i] = 0;
        }
    }

    // Related to Battle mode
    if (
          (
            // If number of teams is less than 2
            ((gGT->battleSetup.numTeams) < 2) ||

			// If no weapons are slected
			((gGT->battleSetup.enabledWeapons & 0xcde) == 0)
		  ) &&

            // If you are hovering over row 5 (Start Battle)
			(sdata->battleSetupRowHighlighted == 5)
		)
    {
        // Move cursor back to row 4 (in weapons selection)
        sdata->battleSetupRowHighlighted = 4;
    }

	for (i = 0; i < numPlyr; i++)
	{
		// If you are selecting "Teams" row
		if (sdata->battleSetupRowHighlighted == 2)
		{
			// If you press Left on D-Pad or move stick to the Left
			if ((sdata->buttonTapPerPlayer[i] & 4) != 0)
			{
				// If you have room to move left
				// if your team number is more than 0
				if (0 < gGT->battleSetup.teamOfEachPlayer[i])
				{
#ifndef REBUILD_PS1
					// play sound
					OtherFX_Play(0, 1);
#endif
	
					// Move your icon to the left
					gGT->battleSetup.teamOfEachPlayer[i]--;
				}
	
				// clear the gamepad input so that it
				// does not use this frame's input on the next frame
				sdata->buttonTapPerPlayer[i] = 0;
			}
	
			// If you press Right on D-Pad or move stick to the Right
			if ((sdata->buttonTapPerPlayer[i] & 8) != 0)
			{
				// If there is room to move right,
				// If your team number is less than 3
				if (gGT->battleSetup.teamOfEachPlayer[i] < 3)
				{
#ifndef REBUILD_PS1
					// play sound
					OtherFX_Play(0, 1);
#endif
	
					// Move your icon to the right
					gGT->battleSetup.teamOfEachPlayer[i]++;
				}
	
				// clear the gamepad input so that it
				// does not use this frame's input on the next frame
				sdata->buttonTapPerPlayer[i] = 0;
			}
		}
	}

    // make a copy of the row you have highlighted
    uVar4 = sdata->battleSetupRowHighlighted;

    if (
        (D230.battle_transitionState == 1) &&

        // If you press D-pad or Cross, Square, Triangle, Circle
        ((sdata->buttonTapPerPlayer[0] & 0x4007f) != 0))
    {
        // if you are not in any drop-down menu
        if ((short)sdata->battleSetupExpandMenu < 0)
        {

            // If you dont press Up
            if ((sdata->buttonTapPerPlayer[0] & 1) == 0)
            {

                // If you dont press Down
                if ((sdata->buttonTapPerPlayer[0] & 2) == 0)
                {

                    // If you dont press Left
                    if ((sdata->buttonTapPerPlayer[0] & 4) == 0)
                    {

                        // If you dont press Right
                        if ((sdata->buttonTapPerPlayer[0] & 8) == 0)
                        {

                            // If you dont press Cross or Circle
                            if ((sdata->buttonTapPerPlayer[0] & 0x50) == 0)
                            {

                                // If you press Square or Trianlge
                                if ((sdata->buttonTapPerPlayer[0] & 0x40020) != 0)
                                {
									#ifndef REBUILD_PS1
                                    // Play "Go Back" sound
                                    OtherFX_Play(2, 1);
									#endif

                                    // go back when transition is done, dont start race
                                    D230.battle_postTransition_boolStart = 0;

                                    // start transition out
                                    D230.battle_transitionState = 2;
                                }
                            }

                            // If you press Cross or Circle
                            else
                            {
								#ifndef REBUILD_PS1
                                // Play sound
                                OtherFX_Play(1, 1);
								#endif

                                switch (sdata->battleSetupRowHighlighted)
                                {
                                    // If row selected can be
                                    // expanded (type, length, lives)
                                case 0:
                                case 1:
                                case 10:
                                    // Row expanded = row selected
                                    sdata->battleSetupExpandMenu = sdata->battleSetupRowHighlighted;
                                    break;

                                    // If row selected is 3 or 4
                                case 3:
                                case 4:

                                    // Enable or disable a weapon when you click it
                                    gGT->battleSetup.enabledWeapons ^=
                                        D230.battleWeaponsEnabled
                                            [((int)sdata->battleSetupWeaponHighlighted + ((int)(((u_int)sdata->battleSetupRowHighlighted - 3) * 0x10000) >> 0x10) * 6) * 2];
                                    break;

                                    // If row selected is "start battle",
                                    // all code below is for starting the battle
                                case 5:

                                    // get game mode, minus some flags
                                    gGT->gameMode1 &= ~(POINT_LIMIT|LIFE_LIMIT|TIME_LIMIT);

                                    uVar12 = D230.FlagesGameMode1_BattleType[D230.battleType_box.rowSelected];
                                    gGT->gameMode1 |= uVar12;

                                    if ((uVar12 & TIME_LIMIT) != 0)
                                    {
                                        // point limit
                                        gGT->gameMode1 |= POINT_LIMIT;
                                    }

                                    if (((gGT->gameMode1 & LIFE_LIMIT) != 0) &&
                                        (0 < D230.time_3_6_INF[D230.battleLengthLifeTime_box.rowSelected]))
                                    {
                                        // time limit
                                        gGT->gameMode1 |= TIME_LIMIT;
                                    }

                                    // set kill limit
                                    gGT->battleSetup.killLimit = D230.points_5_10_15[D230.battleLengthPoints_box.rowSelected];

                                    // if time limit
                                    if (D230.battleType_box.rowSelected == 1)
                                    {
                                        uVar12 = D230.time_3_6_9[D230.battleLengthTimeTime_box.rowSelected];
                                    }

                                    else
                                    {
                                        uVar12 = D230.time_3_6_INF[D230.battleLengthLifeTime_box.rowSelected];
                                    }

                                    // set time limit based on number of minutes
                                    gGT->originalEventTime = uVar12;
                                    i = gGT->originalEventTime;
                                    if (0 < i)
                                    {
                                        gGT->originalEventTime = i * 0xe100;
                                    }

                                    gGT->battleSetup.numWeapons = 0;

                                    // life limit
                                    gGT->battleSetup.lifeLimit = D230.lives_3_6_9[D230.battleLengthLifeLife_box.rowSelected];

                                    // write RNG array of weaponIDs, based on weapon flags,
                                    // loop through 14 "possible" weapons
                                    for (uVar12 = 0; uVar12 < 0xe; uVar12++)
                                    {

                                        // bit flag of weapons enabled
                                        if ((gGT->battleSetup.enabledWeapons & 1 << uVar12) != 0)
                                        {
                                            // write weaponID in RNG array
                                            gGT->battleSetup.RNG_itemSetCustom[gGT->battleSetup.numWeapons] = uVar12;

                                            // increment number of weapons RNG can choose from
                                            gGT->battleSetup.numWeapons++;
                                        }
                                    }

                                    // start battle when transition is done
                                    D230.battle_postTransition_boolStart = 1;

                                    // start transition out
                                    D230.battle_transitionState = 2;

                                    // check if player changed team,
                                    // then clear stats if a change happened

                                        for (i = 0; i < numPlyr; i++)
                                        {
                                            if (sdata->teamOfEachPlayer[i] != gGT->battleSetup.teamOfEachPlayer[i])
                                            {
												#ifndef REBUILD_PS1
                                                MainStats_ClearBattleVS();
												#endif
											}
                                            gGT->battleSetup.teamOfEachPlayer[i] = gGT->battleSetup.teamOfEachPlayer[i];
                                        }

                                    sdata->buttonTapPerPlayer[1] = 0;
                                    sdata->buttonTapPerPlayer[2] = 0;
                                    sdata->buttonTapPerPlayer[3] = 0;
                                }
                            }
                        }

                        // If you press Right
                        else
                        {
                            // if row 3 or 4 (weapons)
                            if ((unsigned short)(sdata->battleSetupRowHighlighted - 3) < 2)
                            {
                                // change which weapon is highlighted
                                sdata->battleSetupWeaponHighlighted++;
                            }

                            else
                            {
                                if ((D230.battleType_box.rowSelected == 2) && (sdata->battleSetupRowHighlighted == 1))
                                {
                                    sdata->battleSetupRowHighlighted = 10;
                                }
                            }
                        }
                    }

                    // If you press Left
                    else
                    {
                        // if row 3 or 4 (weapons)
                        if ((unsigned short)(sdata->battleSetupRowHighlighted - 3) < 2)
                        {
                            // change which weapon is highlighted
                            sdata->battleSetupWeaponHighlighted--;
                        }

                        else
                        {
                            if ((D230.battleType_box.rowSelected == 2) && (sdata->battleSetupRowHighlighted == 10))
                                goto LAB_800b1d7c;
                        }
                    }
                }

                // If you press Down
                else
                {
                    if ((D230.battleType_box.rowSelected == 2) && (sdata->battleSetupRowHighlighted == 10))
                    {
                        sdata->battleSetupRowHighlighted = D230.battleType_box.rowSelected;
                    }
                    else
                    {
                        // Move one row down
                        sdata->battleSetupRowHighlighted++;

                        // If you go below row 5 (Start Battle)
                        if (5 < sdata->battleSetupRowHighlighted)
                        {
                            // Go back to row 5
                            sdata->battleSetupRowHighlighted = 5;
                        }
                    }
                }
            }

            // If you press Up
            else
            {
                if ((D230.battleType_box.rowSelected == 2) && (sdata->battleSetupRowHighlighted == 10))
                {
                LAB_800b1d7c:
                    sdata->battleSetupRowHighlighted = D230.battle_transitionState;
                }
                else
                {
                    // Go up one row
                    sdata->battleSetupRowHighlighted--;

                    // If you go above the top row (0)
                    if (sdata->battleSetupRowHighlighted << 0x10 < 0)
                    {
                        // Go back to the top row
                        sdata->battleSetupRowHighlighted = 0;
                    }
                }
            }

            // If you are a row less than 5,
            // any row except the bottom
            if ((unsigned short)sdata->battleSetupRowHighlighted - 3 < 2)
            {
                i = (u_int)sdata->battleSetupRowHighlighted - 2;
                if (sdata->battleSetupWeaponHighlighted < 0)
                {
                    sdata->battleSetupWeaponHighlighted = 0;
                }
                if (6 - (i) < (int)sdata->battleSetupWeaponHighlighted)
                {
                    sdata->battleSetupWeaponHighlighted = 6 - (short)i;
                }
            }

            if (sdata->battleSetupRowHighlighted != uVar4)
            {
				#ifndef REBUILD_PS1
                // Play sound
                OtherFX_Play(0, 1);
				#endif
            }
        }

        // if you are in any drop-down menu
        else
        {
            box = NULL;

            // If you are chosing Length
            // Dropdown menu for Points (5, 10, 15)
            // Dropdown menu for Time (3 minutes, 6 minutes, etc)
            if (sdata->battleSetupExpandMenu == 1)
            {
                if (D230.battleType_box.rowSelected == 1)
                {
                    box = &D230.battleLengthTimeTime_box;
                }
                else
                {
                    if ((short)D230.battleType_box.rowSelected < 2)
                    {
                        if (D230.battleType_box.rowSelected == 0)
                        {
                            box = &D230.battleLengthPoints_box;
                        }
                    }
                    else
                    {
                        if (D230.battleType_box.rowSelected == 2)
                        {
                            box = &D230.battleLengthLifeTime_box;
                        }
                    }
                }
            }

            // If not choosing Length
            else
            {
                // < 2 means 0 or 1, seems pointless,
                // considering the previous != 1 check and next == 0 check
                if (sdata->battleSetupExpandMenu < 2)
                {
                    // if you are chosing type of battle
                    // Dropdown menu for (Point Limit, Life Limit, TIme Limit)
                    if (sdata->battleSetupExpandMenu == 0)
                    {
                        box = &D230.battleType_box;
                    }
                }

                // sdata->battleSetupExpandMenu == 2
                else
                {
                    // If you're not chosing life limit
                    // Dropdown for 3 lives, 6 lives, 9 lives
                    if (sdata->battleSetupExpandMenu == 10)
                    {
                        box = &D230.battleLengthLifeLife_box;
                    }
                }
            }
            if (box != NULL)
            {
                DECOMP_MENUBOX_ProcessInput(box);
                if ((box->state & 4) != 0)
                {
                    box->state &= ~(ONLY_DRAW_TITLE);

                    // Leave the submenu that is within the Setup Battle menu

                    // Set to 0xFFFF
                    sdata->battleSetupExpandMenu = 0xffff;
                }
            }
        }

        // clear gamepad input (for menus)
        DECOMP_MENUBOX_ClearInput();
    }

    // "SETUP BATTLE"
    DECOMP_DecalFont_DrawLine(sdata->lngStrings[0x90],
		D230.transitionMeta_battle[9].currX + 0x100,
		D230.transitionMeta_battle[9].currY + 10, 1, 0xffff8000);

    // "TYPE:"
    DECOMP_DecalFont_DrawLine(sdata->lngStrings[0x91],
		D230.transitionMeta_battle[1].currX + 0x8c,
		D230.transitionMeta_battle[1].currY + 0x24, 1, 0x4000);

    D230.battleType_box.state &= ~(0x100 | SHOW_ONLY_HIGHLIT_ROW);

    // if you are not choosing type of battle
    if (sdata->battleSetupExpandMenu != 0)
    {
        D230.battleType_box.state |= 0x40;
    }

    if (sdata->battleSetupRowHighlighted != 0)
    {
        D230.battleType_box.state |= 0x100;
    }

    DECOMP_MENUBOX_DrawSelf(&D230.battleType_box, 
		D230.transitionMeta_battle[0].currX + 0x9c,
		D230.transitionMeta_battle[0].currY + 0x24, 0x134);
		
    local_38 = 0xd;
    DECOMP_MENUBOX_GetHeight(&D230.battleType_box, &local_38, 0);
    sVar6 = local_38 + 0x20;

    // "LENGTH:"
    DECOMP_DecalFont_DrawLine(sdata->lngStrings[0x95],
		D230.transitionMeta_battle[3].currX + 0x8c,
		D230.transitionMeta_battle[3].currY + sVar6 + 4, 1, 0x4000);

    if (D230.battleType_box.rowSelected == 1)
    {
        box = &D230.battleLengthTimeTime_box;
    }
    else
    {
        sVar20 = sVar6;
        if (1 < D230.battleType_box.rowSelected)
        {
            if (D230.battleType_box.rowSelected == 2)
            {
                D230.battleLengthLifeTime_box.state &= ~(0x100 | SHOW_ONLY_HIGHLIT_ROW);
				
                if (sdata->battleSetupExpandMenu != 1)
                {
                    D230.battleLengthLifeTime_box.state |= 0x40;
                }
                if (sdata->battleSetupRowHighlighted != 1)
                {
                    D230.battleLengthLifeTime_box.state |= 0x100;
                }
				
                DECOMP_MENUBOX_DrawSelf(&D230.battleLengthLifeTime_box,
					D230.transitionMeta_battle[2].currX + 0x9c,
					D230.transitionMeta_battle[2].currY + sVar6 + 4, 0x8e);
								 
                D230.battleLengthLifeLife_box.state &= ~(0x100 | SHOW_ONLY_HIGHLIT_ROW);
                
				if (sdata->battleSetupExpandMenu != 10)
                {
                    D230.battleLengthLifeLife_box.state |= 0x40;
                }
                if (sdata->battleSetupRowHighlighted != 10)
                {
                    D230.battleLengthLifeLife_box.state |= 0x100;
                }
				
                DECOMP_MENUBOX_DrawSelf(&D230.battleLengthLifeLife_box,
					D230.transitionMeta_battle[2].currX + 0x142,
					D230.transitionMeta_battle[2].currY + sVar6 + 4, 0x8e);
								 
                local_38 = 0xd;
                DECOMP_MENUBOX_GetHeight(&D230.battleLengthLifeTime_box, &local_38, 0);
                local_36[0] = 0xd;
                DECOMP_MENUBOX_GetHeight(&D230.battleLengthLifeLife_box, &local_36, 0);
                sVar20 = local_36[0] + sVar6;
                if (local_36[0] < local_38)
                {
                    sVar20 = local_38 + sVar6;
                }
            }
            goto LAB_800b25f0;
        }
        if (D230.battleType_box.rowSelected != 0)
            goto LAB_800b25f0;
        box = &D230.battleLengthPoints_box;
    }
    
	box->state &= ~(0x100 | SHOW_ONLY_HIGHLIT_ROW);
	
    if (sdata->battleSetupExpandMenu != 1)
    {
        box->state |= 0x40;
    }
    if (sdata->battleSetupRowHighlighted != 1)
    {
        box->state |= 0x100;
    }
    
	DECOMP_MENUBOX_DrawSelf(box, 
		D230.transitionMeta_battle[2].currX + 0x9c,
		D230.transitionMeta_battle[2].currY + sVar6 + 4, 0x134);
    
	local_38 = 0xd;
    DECOMP_MENUBOX_GetHeight(box, &local_38, 0);
    sVar20 = local_38 + sVar6;
	
LAB_800b25f0:
    
	iVar8 = 0x9f;

    // "TEAMS:"
    DECOMP_DecalFont_DrawLine(sdata->lngStrings[0x98],
		D230.transitionMeta_battle[5].currX + 0x8c,
		D230.transitionMeta_battle[5].currY + sVar20 + 10, 1, 0x4000);

    i = 4;

    for (j = 0; j < 4; j++)
    {
        iVar16 = i;
        iVar13 = (int)(short)j;
        local_58b[iVar13] = 0;
        local_60b[iVar13] = 4;

        for (i = 0; i < numPlyr; i++)
        {
            iVar9 = (int)gGT->battleSetup.teamOfEachPlayer[i];
            if (iVar9 == iVar13)
            {
                psVar11 = &local_58b[iVar9];
                puVar14 = &local_60b[iVar9];
                *psVar11 = *psVar11 + 1;
                iVar16 = iVar16 + 0x2a;
                *puVar14 = *puVar14 + 0x2a;
            }
        }
			
        i = iVar16 + 4;
    }

    uVar10 = 0x12e - iVar16;
    i = (int)(uVar10);
    uVar12 = i + 3;
    if ((int)uVar12 < 0)
    {
        uVar12 = i + 6;
    }
    uVar12 = uVar12 >> 2;

    for (i = 0; i < 4; i++)
    {
        psVar11 = &local_60b[i];
        uVar10 = uVar10 - uVar12;
        *psVar11 = *psVar11 + (short)uVar12;
        if ((int)(uVar10) < (int)(uVar12))
        {
            uVar12 = uVar10;
        }
    }

    for (i = 0; i < 4; i++)
    {
        uVar4 = local_60b[i];
        iVar13 = iVar8 + (uVar4>>0x1) + (int)local_58b[i] * -0x15;

            for (iVar16 = 0; iVar16 < numPlyr; iVar16++)
            {
                if (gGT->battleSetup.teamOfEachPlayer[iVar16] == i)
                {
                    sVar6 = (short)iVar13;
                    iVar13 = iVar13 + 0x2a;

                    DECOMP_MM_Battle_DrawIcon_Character(
						gGT->ptrIcons[data.MetaDataCharacters[data.characterIDs[iVar16]].iconID],
						(int)D230.transitionMeta_battle[4].currX + (int)sVar6,
						(int)D230.transitionMeta_battle[4].currY + (int)sVar20 + 6,
	
						&gGT->backBuffer->primMem,
						gGT->tileView_UI.ptrOT,
						1, 0x1000);
                }
            }

        local_48.h = 0x1a;
        local_48.x = D230.transitionMeta_battle[4].currX + (short)iVar8;
        iVar8 = iVar8 + (u_int)uVar4;
        local_48.y = D230.transitionMeta_battle[4].currY + sVar20 + 5;
        
		local_48.w = uVar4;

        DECOMP_CTR_Box_DrawSolidBox(
			&local_48, data.ptrColor[PLAYER_BLUE+i],
			gGT->backBuffer->otMem.startPlusFour,
            &gGT->backBuffer->primMem);
    }

    if (sdata->battleSetupRowHighlighted == 2)
    {
        local_50.w = 0x134;
        local_50.h = 0x1e;
        local_50.x = D230.transitionMeta_battle[4].currX + 0x9c;
        local_50.y = D230.transitionMeta_battle[4].currY + sVar20 + 3;

        DECOMP_CTR_Box_DrawClearBox(
			&local_50, &sdata->menuRowHighlight_Normal, TRANS_50_DECAL,
			gGT->backBuffer->otMem.startPlusFour,
			&gGT->backBuffer->primMem);
    }
	
    local_40.w = 0x140;
    local_40.h = 0x24;
    local_40.x = D230.transitionMeta_battle[4].currX + 0x96;
    local_40.y = D230.transitionMeta_battle[4].currY + sVar20;

    // Draw 2D Menu rectangle background
    DECOMP_MENUBOX_DrawInnerRect(
		&local_40, 0, gGT->backBuffer->otMem.startPlusFour);

    // "WEAPONS:"
    DECOMP_DecalFont_DrawLine(
		sdata->lngStrings[0x99],
		D230.transitionMeta_battle[7].currX + 0x8c,
		D230.transitionMeta_battle[7].currY + sVar20 + 0x44,
		1, 0x4000);

    // make flashing color for error message

    // set default color
    sVar6 = -0x7fff;

    // if time on timer is odd
    if ((sdata->frameCounter & 1) != 0)
    {
        // change color
        sVar6 = -0x7ffd;
    }

    i = 0;

    // If you have no weapons selected, which are in flags "0xcde"
    if ((gGT->battleSetup.enabledWeapons & 0xcde) == 0)
    {

        // THERE MUST BE
        j = 0xac;

        // AT LEAST ONE WEAPON
        i = 0xad;
    }

    // if you have at least one weapon selected
    else
    {
        // No error so far
        j = 0;

        // If number of teams is less than 2
        if (gGT->battleSetup.numTeams < 2)
        {
            // THERE MUST BE
            j = 0xaa;

            // TWO OR MORE TEAMS
            i = 0xab;
        }
    }

    // If you have no errors that prevent
    // the player from starting the Battle
    if (j == 0)
    {
        D230.battleStartGame_box.state &= ~(0x100 | SHOW_ONLY_HIGHLIT_ROW); 
		
        if (sdata->battleSetupExpandMenu != 5)
        {
            D230.battleStartGame_box.state |= SHOW_ONLY_HIGHLIT_ROW;
        }
        if (sdata->battleSetupRowHighlighted != 5)
        {
            D230.battleStartGame_box.state |= 0x100;
        }
        DECOMP_MENUBOX_DrawSelf(&D230.battleStartGame_box, 
				D230.transitionMeta_battle[8].currX + 0x9c,
				D230.transitionMeta_battle[8].currY + sVar20 + 0x78, 0x134);
				
        local_38 = 0xd;
        DECOMP_MENUBOX_GetHeight(&D230.battleStartGame_box, &local_38, 0);
    }

    // If you have no errors that prevent
    // the player from starting the Battle
    else
    {
        // Print two lines of error text,
        // one on top of the other, centered text,
        // 0x100 for halfway on the X-axis,
        // flashing sVar6 color

        DECOMP_DecalFont_DrawLine(sdata->lngStrings[j], 0x100, sVar20 + 0x6a, 1, (int)sVar6);
        DECOMP_DecalFont_DrawLine(sdata->lngStrings[i], 0x100, sVar20 + 0x7a, 1, (int)sVar6);
    }
    i = 0;
    local_40.w = 0x140;
    local_40.h = 0x44;
    local_40.x = D230.transitionMeta_battle[6].currX + 0x96;
    local_40.y = D230.transitionMeta_battle[6].currY + sVar20 + 0x2a;

    // Loop through all 11 weapon icons
    for (i = 0; i < 11; i++)
    {		
        iVar8 = (int)(short)i;
        j = (iVar8 / 6);

        color = &D230.color1;
        uVar17 = 4;

        // Check if this weapon is not enabled
        if ((gGT->battleSetup.enabledWeapons & D230.battleWeaponsEnabled[iVar8*2]) == 0)
        {
            color = &D230.color2;
            uVar17 = 0x15;
        }

        // iVar4 % 6
        // Go to 2nd row after 6th icon
        iVar13 = (u_int)local_40.x + (iVar8 % 6) * 0x34 + j * 0x1a + 6;
        j = (u_int)local_40.y + j * 0x20 + 2;

        // If the icon is bowling bomb or missile on the 2nd row
        if ((i - 7U & 0xffff) < 2)
        {
            // draw the "3" over the icons
            DECOMP_DecalFont_DrawLine(&R230.s_3[0], iVar13, j, 2, uVar17);
        }

        DECOMP_MM_Battle_DrawIcon_Weapon(
			gGT->ptrIcons[D230.battleWeaponsEnabled[iVar8*2+1]],
            iVar13, j,
            &gGT->backBuffer->primMem,
            gGT->tileView_UI.ptrOT,
            1, 0x1000, 1, color);
    }

    if ((unsigned short)sdata->battleSetupRowHighlighted - 3 < 2)
    {
        sVar6 = local_40.x + sdata->battleSetupWeaponHighlighted * 0x34;
        local_60.x = sVar6 + 4;
        if (sdata->battleSetupRowHighlighted == 4)
        {
            local_60.x = sVar6 + 0x1e;
        }
        local_60.w = 0x34;
        local_60.h = 0x20;
        local_60.y = local_40.y + (sdata->battleSetupRowHighlighted - 3) * 0x20 + 2;

        DECOMP_CTR_Box_DrawClearBox(
			&local_60, &sdata->menuRowHighlight_Normal, TRANS_50_DECAL,
            gGT->backBuffer->otMem.startPlusFour,
            &gGT->backBuffer->primMem);
    }

    local_58.x = local_40.x + 3;
    local_58.y = local_40.y + 2;
    local_58.w = local_40.w - 6;
    local_58.h = local_40.h - 4;

    DECOMP_CTR_Box_DrawClearBox(
		&local_58, &D230.color3, TRANS_50_DECAL,
		gGT->backBuffer->otMem.startPlusFour,
		&gGT->backBuffer->primMem);

    DECOMP_MENUBOX_DrawInnerRect(
		&local_40, 0, gGT->backBuffer->otMem.startPlusFour);

    // save all five battle settings
    // these are selected rows from all battle options
    for (i = 0; i < 5; i++)
    {
        sdata->battleSettings[i] = D230.battleMenuBoxArray[i]->rowSelected;
    }
    return;
}
