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
	size_t m_langIndex = 2;
	const std::vector<std::string> m_langs = {"Deutsch", "English", "Español", "Français", "Indonesia", "Italiano", "日本語", "Português", "Pусский", "Suomi"};

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
		TRANSLATE("Already on the latest patch", "Ja esta no ultimo patch."),
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
		TRANSLATE("Vibration", "Vibração"),
		TRANSLATE("Advanced Settings", "Configurações Avançadas"),
		TRANSLATE("Information", "Informação"),
	};
};

extern Languages g_lang;