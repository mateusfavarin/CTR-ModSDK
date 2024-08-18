#pragma once

#include "network.h"

#include <OnlineCTR/global.h>

namespace Message
{
	void Rooms(const SG_Message& message, OnlineCTR& octr);
	void NewClient(const SG_Message& message, OnlineCTR& octr);
}