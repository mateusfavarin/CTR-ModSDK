#pragma once

#include "network.h"

#include <OnlineCTR/global.h>

namespace Message
{
	void Rooms(const SG_Message& message, OnlineCTR& octr);
	void NewClient(const SG_Message& message, OnlineCTR& octr);
	void UpdateID(const SG_Message& message, OnlineCTR& octr);
	void Name(const SG_Message& message, OnlineCTR& octr);
	void Track(const SG_Message& message, OnlineCTR& octr);
	void Character(const SG_Message& message, OnlineCTR& octr);
	void StartLoading(const SG_Message& message, OnlineCTR& octr);
	void StartRace(const SG_Message& message, OnlineCTR& octr);
	void Kart(const SG_Message& message, OnlineCTR& octr);
	void Weapon(const SG_Message& message, OnlineCTR& octr);
	void EndRace(const SG_Message& message, OnlineCTR& octr);
	void ForceEndRace(const SG_Message& message, OnlineCTR& octr);
}