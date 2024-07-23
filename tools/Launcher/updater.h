#pragma once

#include <string>
#include <unordered_map>
#include <mutex>
#include <future>

enum class RoutineStatus
{
	NONE, RUNNING, RET_TRUE, RET_FALSE
};

class Updater
{
public:
	Updater();
	bool HasValidUpdate();
	bool IsBusy();
	bool HasUpdateAvailable();
	void IsValidBios(RoutineStatus& ret, const std::string& path);
	void IsValidGame(RoutineStatus& ret, const std::string& path);
	void CheckForUpdates(const std::string& currVersion);
	void Update(std::string& status, std::string& currVersion, const std::string& gamePath, const std::string& biosPath);
	const std::string GetVersionAvailable();

private:
	void StartRoutine(const std::function<bool(void)>& func, RoutineStatus* const ret = nullptr);
	void KillRoutines();

public:
	bool m_deleteOldVersions = true;

private:
	std::string m_versionAvailable;
	bool m_updateAvailable = false;
	bool m_hasDuckstation = false;
	bool m_updated;

	std::mutex m_routineMutex;
	std::unordered_map<unsigned, std::future<void>> m_asyncRefs;
	unsigned m_routineCount = 0;
	unsigned m_routineIndex = 0;
};