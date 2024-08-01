#include "patch.h"
#include "io.h"
#include "languages.h"

#include <xdelta3.h>

static bool DecompressXDelta(const std::string& xdeltaPath, const std::string& inputPath, const std::string& ext)
{
  std::vector<char> xdelta;
  std::vector<char> game;
  IO::ReadBinaryFile(xdelta, xdeltaPath);
  IO::ReadBinaryFile(game, inputPath);
  std::vector<char> patchedGame;
  patchedGame.resize(2 * game.size());
  usize_t patchedGameSize;
  int result = xd3_decode_memory(reinterpret_cast<uint8_t*>(xdelta.data()), xdelta.size(), reinterpret_cast<uint8_t*>(game.data()), game.size(), reinterpret_cast<uint8_t*>(patchedGame.data()), &patchedGameSize, patchedGame.size(), 1 << 11);
  if (result != 0) { return false; }

  patchedGame.resize(patchedGameSize);
  std::string filename = GetPathWithoutExtension(xdeltaPath) + ext;
  IO::WriteBinaryFile(patchedGame, filename);
  return true;
}

bool Patch::PatchGame(const std::string & path, const std::string & gamePath, std::string & status, IconType & statusIcon)
{
  status = g_lang["Applying xdelta patch..."];
  statusIcon = IconType::RUNNING;
  if (!DecompressXDelta(path + g_patchString, gamePath, ".bin"))
  {
    status = g_lang["Error applying xdelta patch"];
    statusIcon = IconType::FAIL;
    return false;
  }
  return true;
}

bool Patch::NewVersion(const std::string& path, const std::string& gamePath, std::string& status, IconType& statusIcon)
{
  status = g_lang["Decompressing"] + " " + g_clientExecutable + "...";
  statusIcon = IconType::RUNNING;
  if (!IO::DecompressFiles(path, g_clientString))
  {
    status = g_lang["Error decompressing"] + " " + g_clientExecutable;
    statusIcon = IconType::FAIL;
    return false;
  }
  return PatchGame(path, gamePath, status, statusIcon);
}
