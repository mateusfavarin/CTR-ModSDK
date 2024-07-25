#pragma once

#include <vector>
#include <string>
#include <unordered_map>

#define TRANSLATE(EN, PT) {EN,{{"English", EN}, {"Português", PT}}}

class Languages
{
public:
	Languages();
	const std::string& operator[](const std::string& str);

public:
	size_t m_langIndex = 1; // Default to english
	const std::vector<std::string> m_langs = {"Deutsch", "English", "عربي", "Español", "Français", "Icelandic", "Indonesia", "Italiano", "日本語", "Português", "Pусский", "Suomi"};

private:
	const std::unordered_map<std::string, std::unordered_map<std::string, std::string>> m_translations = {
		/* patch.cpp */
		TRANSLATE("Decompressing", "Descompactando"),
		TRANSLATE("Error decompressing", "Erro descompactando o"),
		TRANSLATE("Applying xdelta patch...", "Aplicando o patch xdelta..."),
		TRANSLATE("Error applying xdelta patch", "Erro ao aplicar o patch xdelta"),
		/* requests.cpp */
		TRANSLATE("Downloading", "Baixando"),
		TRANSLATE("Error downloading", "Erro baixando"),
		/* updater.cpp */
		TRANSLATE("Downloading Duckstation...", "Baixando Duckstation..."),
		TRANSLATE("Error: could not download Duckstation.", "Erro: não foi possível baixar o Duckstation."),
		TRANSLATE("Decompressing Duckstation...", "Descompactando o Duckstation..."),
		TRANSLATE("Error: could not decompress Duckstation.", "Erro: não foi possível descompactar o Duckstation."),
		TRANSLATE("Installing OnlineCTR settings...", "Instalando configurações do OnlineCTR..."),
		TRANSLATE("Checking for new updates...", "Verificando novas atualizações..."),
		TRANSLATE("Update completed.", "Atualização completa."),
		TRANSLATE("Already on the latest patch", "Ja está no último patch"),
		TRANSLATE("Error: could not establish connection to online-ctr.com", "Erro: não foi possível estabelecer uma conexão ao online-ctr.com"),
		TRANSLATE("Update available", "Update disponível"),
		/* ui.cpp */
		TRANSLATE("OnlineCTR Version", "Versão do OnlineCTR"),
		TRANSLATE("Language", "Língua"),
		TRANSLATE("Username", "Nome de usuário"),
		TRANSLATE("Bios File", "Arquivo da BIOS"),
		TRANSLATE("Path to a PS1 NTSC-U bios.", "Caminho para uma BIOS NTSC-U do PS1."),
		TRANSLATE("Game File", "Arquivo do Jogo"),
		TRANSLATE("Path to the original NTSC-U CTR.", "Caminho para o CTR NTSC-U original."),
		TRANSLATE("Game Settings", "Configurações do Jogo"),
		TRANSLATE("Music", "Música"),
		TRANSLATE("Voice", "Voz"),
		TRANSLATE("Audio:", "Áudio:"),
		TRANSLATE("Vibration", "Vibração"),
		TRANSLATE("Advanced Settings", "Configurações Avançadas"),
		TRANSLATE("Information", "Informações"),
		TRANSLATE("Skip game checksum", "Ignorar checksum do jogo"),
		TRANSLATE("Ignore the game checksum while applying the xdelta patch.\nThis may result in patching errors.", "Ignora a checksum do jogo enquanto aplica o patch xdelta.\nIsso pode resultar em erros no patch."),
		TRANSLATE("Delete old versions", "Deletar versões antigas"),
		TRANSLATE("Automatically deletes the patched file\nfor obsolete versions during new updates.", "Deleta patches antigos automaticamente\ndurante novas atualizações."),
		TRANSLATE("Calculating BIOS checksum...", "Calculando checksum da BIOS..."),
		TRANSLATE("detected", "detectado"),
		TRANSLATE("Invalid PS1 bios file", "Arquivo de bios do PS1 inválido"),
		TRANSLATE("Calculating game checksum...", "Calculando checksum do jogo..."),
		TRANSLATE("Invalid ROM or modified version of NTSC-U CTR detected\nThis may result in patching errors", "ROM inválida ou versão modificada do CTR NTSC-U detectado\nIsto pode resultar em erros duranto o patch"),
		TRANSLATE("Game path does not match with an original NTSC-U CTR game file", "Arquivo do jogo não corresponde com o CTR NTSC-U original"),
		TRANSLATE("Launch Game", "Jogar"),
		TRANSLATE("Error: could not find", "Erro: não foi possível encontrar"),
		TRANSLATE("Update the game and make sure\nall settings are correct.", "Atualize o jogo e verifique que\ntodas as configurações estão corretas."),
		TRANSLATE("Update", "Atualizar"),
		TRANSLATE("Provide a correct nickname, bios file\nand game file before updating.", "Forneça corretamente o nome de usuário, arquivo de bios\ne o arquivo do jogo antes de atualizar."),
	};
};

extern Languages g_lang;