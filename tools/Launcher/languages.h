#pragma once

#include <vector>
#include <string>
#include <unordered_map>

#define TRANSLATE(EN, PT, IT, RU, FI, AR, DE, ID, FR, IS, ES, JP) {EN,{{"English", EN}, {"Português", PT}, {"Italiano", IT}, {"Pусский", RU}, {"Suomi", FI}, {"عربي", AR}, {"Deutsch", DE}, {"Indonesia", ID}, {"Français", FR}, {"Íslenska", IS}, {"Español", ES}, {"日本語", JP}}}

class Languages
{
public:
	Languages();
	const std::string& operator[](const std::string& str);

public:
	size_t m_langIndex = 1; // Default to english
	const std::vector<std::string> m_langs = {"Deutsch", "English", "عربي", "Español", "Français", "Íslenska", "Indonesia", "Italiano", "日本語", "Português", "Pусский", "Suomi"};

private:
	const std::unordered_map<std::string, std::unordered_map<std::string, std::string>> m_translations = {
		/* patch.cpp */
		TRANSLATE(
			"Decompressing",
			"Descompactando",
			"Decompressione",
			"Распаковка",
			"Purkaa",
			"جاري رفع الضغط",
			"Entpacken",
			"Mendekompresi",
			"Décompression",
			"Afþjappar gögn",
			"Descomprimiendo",
			"解凍しています"
		),
		TRANSLATE(
			"Error decompressing",
			"Erro descompactando o",
			"Errore nella decompressione",
			"Ошибка распаковки",
			"Virhe Purkaessa",
			"خطأ في رفع الضغط",
			"Fehler beim Entpacken",
			"Terjadi kesalahan mendekompresi",
			"Erreur de décompression",
			"Villa við afþjöppun gagna",
			"Error al descomprimir",
			"解凍エラー"
		),
		TRANSLATE(
			"Applying xdelta patch...",
			"Aplicando o patch xdelta...",
			"Applicando la patch xdelta...",
			"Применяется патч xdelta...",
			"Asennetaan xdelta päivitystä…",
			"...جاري تطبيق التحديث",
			"Wende XDELTA Patch an ...",
			"Memasang patch xdelta...",
			"Application du patch XDELTA...",
			"Stagar xdelta bót...",
			"Aplicando parche xdelta...",
			"xdeltaパッチを適用しています..."
		),
		TRANSLATE(
			"Error applying xdelta patch",
			"Erro ao aplicar o patch xdelta",
			"Errore nell'applicazione della patch xdelta",
			"Ошибка патча xdelta",
			"Virhe asentaessa xdelta päivitystä",
			"خطأ في تطبيق التحديث",
			"Fehler beim Anwenden des XDELTA Patches",
			"Terjadi kesalahan memasang patch xdelta",
			"Erreur lors de l'application du patch XDELTA",
			"Villa við stögum xdelta bótar",
			"Error al aplicar parche xdelta",
			"xdeltaパッチの適用エラー"
		),
		/* requests.cpp */
		TRANSLATE(
			"Downloading",
			"Baixando",
			"Scaricamento",
			"Загрузка",
			"Ladataan",
			"جاري التحميل",
			"Am Herunterladen",
			"Mengunduh",
			"Téléchargement",
			"Sækir skjöl",
			"Descargando",
			"ダウンロードしています"
		),
		TRANSLATE(
			"Error downloading",
			"Erro baixando",
			"Errore di scaricamento",
			"Ошибка загрузки",
			"Virhe ladattaessa",
			"خطأ في التحميل",
			"Fehler beim Herunterladen",
			"Terjadi kesalahan mengunduh",
			"Échec du telechargement",
			"Villa við niðurhalningu",
			"Error al descargar",
			"ダウンロードエラー"
		),
		/* updater.cpp */
		TRANSLATE(
			"Downloading Duckstation...",
			"Baixando Duckstation...",
			"Scaricamento di Duckstation...",
			"Загрузка Duckstation...",
			"Ladataan sovellusta Duckstation…",
			"جاري تحميل المحاكي Duckstation",
			"Lade Duckstation herunter ...",
			"Mengunduh Duckstation...",
			"Téléchargement de Duckstation...",
			"Sækir Duckstation...",
			"Descargando Duckstation...",
			"Duckstationをダウンロードしています..."
		),
		TRANSLATE(
			"Error: could not download Duckstation.",
			"Erro: não foi possível baixar o Duckstation.",
			"Errore: non è stato possibile scaricare Duckstation.",
			"Ошибка: Не удалось загрузить Duckstation.",
			"Virhe ladattaessa sovellusta Duckstation",
			"خطأ: فشل في تحميل المحاكي Duckstation",
			"Fehler: Duckstation konnte nicht heruntergeladen werden.",
			"Kesalahan: Tidak dapat mengunduh Duckstation.",
			"Erreur: échec du téléchargement de Duckstation.",
			"Villa: ekki var hægt að sækja Duckstation.",
			"Error: no se pudo descargar Duckstation.",
			"エラー: Duckstationがダウンロードできませんでした."
		),
		TRANSLATE(
			"Decompressing Duckstation...",
			"Descompactando o Duckstation...",
			"Decompressione di Duckstation...",
			"Распаковка Duckstation...",
			"Puretaan sovellusta Duckstation…",
			"جاري رفع الضغط عن المحاكي Duckstation",
			"Entpacke Duckstation ...",
			"Mendekompresi Duckstation...",
			"Décompression de Duckstation...",
			"Afþjappar Duckstation...",
			"Descomprimiendo Duckstation...",
			"DuckStationを解凍しています..."
		),
		TRANSLATE(
			"Error: could not decompress Duckstation.",
			"Erro: não foi possível descompactar o Duckstation.",
			"Errore: non è stato possibile decomprimere Duckstation.",
			"Ошибка: Не удалось распаковать Duckstation.",
			"Virhe puratessa sovellusta Duckstation",
			"خطأ: فشل في رفع الضغط عن المحاكي Duckstation",
			"Fehler: Duckstation konnte nicht entpackt werden.",
			"Kesalahan: Tidak dapat mendekompresi Duckstation.",
			"Erreur: échec de la décompression de Duckstation.",
			"Villa: ekki var hægt að afþjappa Duckstation.",
			"Error: no se pudo descomprimir Duckstation.",
			"エラー: Duckstationが解凍できませんでした."
		),
		TRANSLATE(
			"Installing OnlineCTR settings...",
			"Instalando configurações do OnlineCTR...",
			"Installazione delle impostazioni di OnlineCTR...",
			"Установка настроек для OnlineCTR...",
			"Asennetaan OnlineCTR asetuksia…",
			"...جاري تثبيت اعدادات OnlineCTR",
			"Einstellungen für OnlineCTR werden eingerichtet ...",
			"Memasang pengaturan OnlineCTR...",
			"Instalation des paramètres de OnlineCTR...",
			"Vistar stillingar fyrir OnlineCTR...",
			"Instalando configuraciones de OnlineCTR...",
			"OnlineCTR設定をインストールしています..."
		),
		TRANSLATE(
			"Checking for new updates...",
			"Verificando novas atualizações...",
			"Controllo di nuovi aggiornamenti...",
			"Проверка обновлений...",
			"Tarkistetaan päivityksiä…",
			"التحقق من وجود تحديثات...",
			"Suche nach Aktualisierungen ...",
			"Mengecek pembaruan terbaru...",
			"Vérification des nouvelles mises à jour...",
			"Uppfærslu athugun...",
			"Buscando actualizaciones...",
			"新しいアップデートを確認しています..."
		),
		TRANSLATE(
			"Update completed.",
			"Atualização completa.",
			"Aggiornamento completato.",
			"Обновление завершено.",
			"Päivitys asennettu.",
			"تم التحديث.",
			"Aktualisierung abgeschlossen.",
			"Pembaruan selesai.",
			"Mise à jour terminée.",
			"Uppfærsla klár.",
			"Actualizado correctamente.",
			"アップデートが完了しました."
		),
		TRANSLATE(
			"Already on the latest patch",
			"Ja está no último patch",
			"Ultima patch disponibile già applicata",
			"У вас последняя версия.",
			"Päivitys ajan tasalla.",
			"البرنامج في آخر نسخة",
			"Der neueste Patch ist bereits angewendet",
			"Sudah menggunakan patch terbaru",
			"Le dernier patch a déjà été installé",
			"Þú ert með nýjustu útgáfuna.",
			"Ya estás en el último parche",
			"既に最新のパッチです"
		),
		TRANSLATE(
			"Error: could not establish connection to online-ctr.com",
			"Erro: não foi possível estabelecer uma conexão ao online-ctr.com",
			"Errore: non è stato possibile connettersi a online-ctr.com",
			"Ошибка: Не удалось соединиться с online-ctr.com",
			"Virhe: Launcher ei kykene muodostamaan yhteyttä online-ctr.com:iin.",
			"خطأ: فشل في الإتصال الى online-ctr.com",
			"Fehler: Es konnte keine Verbindung zu online-ctr.com hergestellt werden",
			"Kesalahan: Tidak bisa membuat koneksi ke online-ctr.com",
			"Erreur: impossible de se connecter à online-ctr.com",
			"Villa: næst ekki sambandi við online-ctr.com",
			"Error: no se pudo establecer una conexión con online-ctr.com",
			"エラー: online-ctr.comとの接続を確立できませんでした."
		),
		TRANSLATE(
			"Update available",
			"Update disponível",
			"Aggiornamento disponibile",
			"Доступно обновление",
			"Päivitys saatavilla",
			"يوجد تحديث جديد",
			"Aktualisierung verfügbar",
			"Pembaruan tersedia",
			"Mise à jour disponible",
			"Uppfærsla í boði",
			"Actualización disponible",
			"アップデートがあります"
		),
		/* ui.cpp */
		TRANSLATE(
			"OnlineCTR Version",
			"Versão do OnlineCTR",
			"Versione di OnlineCTR",
			"Версия",
			"OnlineCTR Versio",
			"اصدار OnlineCTR",
			"OnlineCTR Version",
			"Versi OnlineCTR",
			"OnlineCTR version",
			"Útgáfa OnlineCTR",
			"Versión de OnlineCTR",
			"OnlineCTRバージョン"
		),
		TRANSLATE(
			"Language",
			"Língua",
			"Lingua",
			"Язык",
			"Kieliasetus",
			"اللغة",
			"Sprache",
			"Bahasa",
			"Langue",
			"Tungumál",
			"Idioma",
			"言語"
		),
		TRANSLATE(
			"Username",
			"Nome de usuário",
			"Nome utente",
			"Имя",
			"Käyttäjänimi",
			"اسم المستخدم",
			"Benutzername",
			"Nama user",
			"Pseudonyme",
			"Notandanafn",
			"Nombre de usuario",
			"ユーザー名"
		),
		TRANSLATE(
			"Bios File",
			"Arquivo da BIOS",
			"File BIOS",
			"Файл BIOS",
			"Bios-tiedosto",
			"ملف BIOS",
			"BIOS",
			"File BIOS",
			"Fichier BIOS",
			"BIOS skjal",
			"Archivo de la BIOS",
			"BIOSファイル"
		),
		TRANSLATE(
			"Path to a PS1 NTSC-U bios.",
			"Caminho para uma BIOS NTSC-U do PS1.",
			"Inserisci il percorso di un file BIOS NTSC-U per PS1.",
			"Путь к BIOS NTSC-U.",
			"PS1 NTSC-U bios tiedoston sijainti.",
			"مسار ملف PS1 NTSC-U BIOS",
			"Pfad zu einem NTSC-U PS1 BIOS.",
			"Lokasi file BIOS PS1 NTSC-U.",
			"Chemin d'accès du fichier BIOS PS1 de la version NTSC-U.",
			"Gagnaslóð að PS1 NTSC-U Bios skjali.",
			"Ruta de una bios PS1 NTSC-U.",
			"PS1 NTSC-U BIOSへのパス."
		),
		TRANSLATE(
			"Game File",
			"Arquivo do Jogo",
			"File Gioco",
			"Файл игры",
			"Pelitiedosto",
			"ملف اللعبة",
			"ROM",
			"File Game",
			"Fichier de jeu",
			"Leikja skjal",
			"Archivo del Juego",
			"ゲームファイル"
		),
		TRANSLATE(
			"Path to the original NTSC-U CTR.",
			"Caminho para o CTR NTSC-U original.",
			"Inserisci il percorso di una ROM NTSC-U non modificata di CTR.",
			"Путь к CTR NTSC-U.",
			"Alkuperäisen NTSC-U CTR tiedoston sijainti.",
			"مسار ملف اللعبة الاصلي NTSC-U",
			"Pfad zu einer NTSC-U CTR ROM.",
			"Lokasi CTR NTSC-U asli.",
			"Chemin d'accès vers le fichier de jeu original CTR version NTSC-U.",
			"Slóð að óbreyttu NTSC-U CTR skjali.",
			"Ruta hacia CTR NTSC-U original.",
			"オリジナル版NTSC-U CTRへのパス."
		),
		TRANSLATE(
			"Game Settings",
			"Configurações do Jogo",
			"Impostazioni del gioco",
			"Настройки игры",
			"Peliasetukset",
			"اعدادات اللعبة",
			"Spieleeinstellungen",
			"Pengaturan Game",
			"Paramètres",
			"Hljóðstillingar",
			"Opciones del juego",
			"ゲーム設定"
		),
		TRANSLATE(
			"Music",
			"Música",
			"Musica",
			"Музыка",
			"Musiikki",
			"الموسيقى",
			"Musik",
			"Musik",
			"Musique",
			"Tónlist",
			"Música",
			"BGM"
		),
		TRANSLATE(
			"Voice",
			"Voz",
			"Voci",
			"Голос",
			"Äänet",
			"الصوت",
			"Stimme",
			"Suara",
			"Voix",
			"Raddir",
			"Voz",
			"ボイス"
		),
		TRANSLATE(
			"Audio:",
			"Áudio:",
			"Audio:",
			"Звук:",
			"Toisto:",
			"الصوت",
			"Audio:",
			"Audio:",
			"Audio:",
			"Hljóð:",
			"Audio:",
			"オーディオ:"
		),
		TRANSLATE(
			"Vibration",
			"Vibração",
			"Vibrazione",
			"Вибрация",
			"Ohjainvärinä",
			"الاهتزاز",
			"Vibration",
			"Getaran",
			"Vibration",
			"Titringur",
			"Vibración",
			"振動"
		),
		TRANSLATE(
			"Advanced Settings",
			"Configurações Avançadas",
			"Configurazioni Avanzate",
			"Дополнительные Настройки",
			"Lisäasetukset",
			"الإعدادات المتقدمة",
			"Erweiterte Einstellungen",
			"Pengaturan Lanjut",
			"Paramètres Avancés",
			"Fleiri stillingar",
			"Opciones Avanzadas",
			"詳細設定"
		),
		TRANSLATE(
			"Information",
			"Informações",
			"Informazioni",
			"Информация",
			"Asennuksen Tila",
			"معلومات",
			"Informationen",
			"Informasi",
			"Information",
			"Upplýsingar",
			"Informacion",
			"情報"
		),
		TRANSLATE(
			"Skip game checksum",
			"Ignorar checksum do jogo",
			"Ignora il checksum del gioco",
			"Не проверять контрольную сумму",
			"Ohita tarkistussumma (checksum)",
			"تجاهل Checksum اللعبة",
			"Ignoriere Prüfsumme der ROM",
			"Lewati cek checksum",
			"Ignorer la somme de contrôle des fichiers",
			"Hunsa prófsummu leiks",
			"Saltar checksum del juego",
			"ゲームチェックサムを無視"
		),
		TRANSLATE(
			"Ignore the game checksum while applying the xdelta patch.\nThis may result in patching errors.",
			"Ignora a checksum do jogo enquanto aplica o patch xdelta.\nIsso pode resultar em erros no patch.",
			"Ignora il checksum del gioco quando applichi la patch xdelta.\nQuesto può causare errori nell'applicazione della patch.",
			"Не проверять контрольную сумму во время патча.\nМожет привести к ошибкам",
			"Ohita pelitiedoston tarkistussumma xdelta päivitystä asentaessa. \nTämä voi aiheuttaa asennusvirheitä.",
			"تجاهل checksum اللعبة \n هذا قد يسبب خطأ في تحديث اللعبة",
			"Ignoriere die Prüfsumme der ROM bevor der XDELTA Patch angewendet wird.\nDas kann dazu führen, dass der Patch fehlerhaft angewendet wird.",
			"Abaikan checksum game saat memasang patch xdelta.\nHal ini dapat mengakibatkan kesalahan saat pemasangan patch.",
			"Ignorer la somme de contrôle pour l'application du patch XDELTA.\nCela peut potentiellement entraîner des erreurs.",
			"Hunsa prófsummu leiks þegar xdelta bót er stöguð. \nÞað getur komið fram villa ef þessi stilling er notuð.",
			"Saltar el checksum del juego mientras se aplica el parche xdelta.\nEsto puede causar errores al parchear.",
			"xdeltaパッチ適用中のゲームチェックサムを無視します.\nパッチエラーが発生する可能性があります."
		),
		TRANSLATE(
			"Delete old versions",
			"Deletar versões antigas",
			"Cancella versioni vecchie",
			"Удалить старые версии",
			"Poista vanhentuneet versiot",
			"حذف النسخة القديمة",
			"Alte Versionen löschen",
			"Hapus versi lama",
			"Supprimer les versions précédentes",
			"Eyða gömlum útgáfum",
			"Borrar versiones antiguas",
			"旧バージョンの削除"
		),
		TRANSLATE(
			"Automatically deletes the patched file\nfor obsolete versions during new updates.",
			"Deleta patches antigos automaticamente\ndurante novas atualizações.",
			"Cancella automaticamente i file patchati\nper versioni obsolete durante nuovi aggiornamenti.",
			"Автоматически удаляет прежние версии\nдля старых версии после обновления.",
			"Poistaa automaattisesti vanhentuneet pelitiedostot\nuuden version asennuksen yhteydessä.",
			"حذف النسخة القدديمة تلقائيا اثناء تحديث اللعبة",
			"Löscht automatisch gepatchte ROMs\nvon veralteten Versionen während neuen Aktualisierungen.",
			"Otomatis hapus file yang dipatch\nversi lama ketika ada pembaruan.",
			"Suppression automatique des versions obsolètes pendant\nl'installation d'une nouvelle mise à jour.",
			"Eyðir sjálfkrafa gömlum útgáfum þegar nýjar útgáfur eru í boði.",
			"Elimina archivos antiguos automáticamente\ndurante nuevas actualizaciones.",
			"廃止されたバージョンのパッチ適用済みファイルを新しいアップデート中に自動的に削除します."
		),
		TRANSLATE(
			"Calculating BIOS checksum...",
			"Calculando checksum da BIOS...",
			"Calcolando il checksum del BIOS...",
			"Проверка суммы BIOS...",
			"Lasketaan bios-tiedoston tarkistussumma (checksum)…",
			"جاري حساب BIOS Checksum...",
			"Berechne Prüfsumme des BIOS ...",
			"Menghitung checksum BIOS...",
			"Calcul de la somme de contrôle du fichier BIOS...",
			"Athugar BIOS prófsummu...",
			"Calculando el checksum de la BIOS...",
			"BIOSチェックサムを計算しています..."
		),
		TRANSLATE(
			"detected",
			"detectado",
			"rilevato",
			"Обнаружено",
			"Havaittu",
			"تم الكشف",
			"gefunden",
			"terdeteksi",
			"détecté",
			"fundið",
			"detectada",
			"を検出しました"
		),
		TRANSLATE(
			"Invalid PS1 bios file",
			"Arquivo de bios do PS1 inválido",
			"File BIOS PS1 invalido",
			"Неверный файл BIOS",
			"Väärä PS1 bios-tiedosto",
			"ملف PS1 Bios خاطئ",
			"Ungültiges PS1 BIOS",
			"File BIOS salah",
			"Fichier BIOS PS1 invalide",
			"Ógilt PS1 bios skjal",
			"Archivo de bios de PS1 inválido",
			"不正なPS1 BIOSファイルです"
		),
		TRANSLATE(
			"Calculating game checksum...",
			"Calculando checksum do jogo...",
			"Calcolando il checksum del gioco...",
			"Проверка суммы игры...",
			"Lasketaan pelitiedoston tarkistussumma (checksum)…",
			"جاري حساب checksum اللعبة",
			"Berechne Prüfsumme der ROM ...",
			"Menghitung checksum game...",
			"Calcul de la somme de contrôle du jeu...",
			"Reiknar prófsummu leiks...",
			"Calculando el checksum del juego...",
			"ゲームチェックサムを計算しています..."
		),
		TRANSLATE(
			"Invalid ROM or modified version of NTSC-U CTR detected\nThis may result in patching errors",
			"ROM inválida ou versão modificada do CTR NTSC-U detectado\nIsto pode resultar em erros duranto o patch",
			"ROM invalida o versione modificata di CTR NTSC-U rilevata\nQuesto può causare errori nell'applicazione della patch",
			"Неверный ROM или модифицированная версия игры\nМожет привести к ошибкам",
			"Havaittu väärä tai modifoitu NTSC-U CTR pelitiedosto.\nTämä voi aiheuttaa asennusvirheitä.",
			"ملف اللعبة خاطئ او معدل \n هذا قد يتسبب في خطأ في التحديث",
			"Ungültige oder modifizierte NTSC-U CTR ROM erkannt\nDer Patch kann zu Fehlern führen",
			"ROM Salah atau terdeteksi CTR NTSC-U yang sudah dimodifikasi\nHal ini dapat menyebabkan kesalahan saat pemasangan patch.",
			"Fichier de jeu invalide ou version modifié de CTR NTSC-U détecté\nCela peut potentiellement entraîner des erreurs.",
			"Ógilt eða breytt ROM skjal fundið\nÞað getur komið fram villa ef þetta skjal er notað.",
			"ROM invalida o versión modificada de CTR NTSC-U detectada\nEsto puede causar errores al parchear",
			"不正なROMまたは変更済みのNTSC-U CTRを検出しました\nパッチエラーが発生する可能性があります"
		),
		TRANSLATE(
			"Game path does not match with an original NTSC-U CTR game file",
			"Arquivo do jogo não corresponde com o CTR NTSC-U original",
			"Il percorso del gioco non corrisponde ad una versione non modificata della ROM di CTR NTSC-U.",
			"Путь не соответствует файлу игры",
			"Asetetusta sijainnista ei löydy alkuperäistä NTSC-U CTR pelitiedostoa.",
			"مسار اللعبة لا يشابه مسار ملف اللعبة الأصلي NTSC-U",
			"Unter dem Pfad kann keine gültige NTSC-U CTR ROM gefunden werden",
			"File game tidak sesuai dengan file game CTR NTSC-U asli",
			"Le chemin d'accès ne contient aucun fichier de jeu original CTR version NTSC-U",
			"Leikjarslóð bendir ekki að óbreyttu NSTC-U CTR ROM skjali",
			"Este archivo no corresponde con un juego CTR NTSC-U original",
			"ゲームパスのゲームファイルがオリジナル版NTSC-U CTRと一致しません"
		),
		TRANSLATE(
			"Launch Game",
			"Jogar",
			"Avvia Gioco",
			"Запуск",
			"Avaa Peli",
			"جاري تشغيل اللعبة",
			"Spiel Starten",
			"Mulai Game",
			"Lancer le jeu",
			"Spila leik",
			"Jugar",
			"ゲームを始める"
		),
		TRANSLATE(
			"Error: could not find",
			"Erro: não foi possível encontrar",
			"Errore: non è stato possibile trovare",
			"Ошибка: Не удалось найти",
			"Virhe: Ei löydy",
			"خطأ: فشل في ايجاد الملف",
			"Fehler: Konnte nicht finden",
			"Kesalahan: Tidak dapat ditemukan",
			"Erreur: impossible de trouver le fichier",
			"Villa: fann ekki",
			"Error: no se pudo encontrar",
			"エラー: 見つけられませんでした"
		),
		TRANSLATE(
			"Update the game and make sure\nall settings are correct.",
			"Atualize o jogo e verifique que\ntodas as configurações estão corretas.",
			"Aggiorna il gioco e sii sicuro/a\nche tutte le impostazioni siano corrette.",
			"Обновите игру и проверьте настройки.",
			"Päivitä peli ja varmista asetusten olvevan oikein.",
			"خدث اللعبة وتأكد ان جميع الإعدادات صحيحة",
			"Aktualisiere das Spiel und\n stelle sicher, dass die Einstellungen korrekt sind.",
			"Perbarui game dan\npastikan semua pengaturan sudah benar.",
			"Installer la mise à jour et vérifier\nque tous les paramètres sont corrects.",
			"Uppfærðu leikinn og passaðu\nað allar stillingar séu réttar.",
			"Actualiza el juego y verifica que\ntodas las configuraciones son correctas.",
			"ゲームをアップデートして、設定が正しいか確認してください."
		),
		TRANSLATE(
			"Update",
			"Atualizar",
			"Aggiorna",
			"Обновить",
			"Päivitä",
			"تحديث",
			"Aktualisieren",
			"Perbarui",
			"Mise à jour",
			"Uppfæra",
			"Actualizar",
			"アップデートする"
		),
		TRANSLATE(
			"Provide a correct nickname, bios file\nand game file before updating.",
			"Forneça corretamente o nome de usuário, arquivo de bios\ne o arquivo do jogo antes de atualizar.",
			"Inserisci un nome utente, file BIOS\ne un file di gioco corretti prima di aggiornare.",
			"Укажите корректное имя, файл BIOS\nи файл игры перед обновлением.",
			"Syötä kenttiin nimike sekä bios-\nja pelitiedoston sijainnit ennen päivittämistä.",
			"تاكد من صحة الاسم, ملف اللعبة, و BIOS قبل التحديث",
			"Setze einen Benutzernamen, ein BIOS\nund eine ROM vor dem Aktualisieren.",
			"Berikan nama user yang benar, file bios\ndan file game sebelum memperbarui.",
			"Vérifier que votre pseudo, le fichier BIOS et le\nfichier de jeu sont corrects avant la mise à jour.",
			"Passaðu að notandanafn, BIOS skjal\nog leikjarskal er rétt fyrir uppfærslu.",
			"Inserta correctamente un nombre de usuario, archivo de bios\ny el archivo del juego antes de actualizar.",
			"アップデート前に、ユーザー名、BIOSファイル、ゲームファイルを設定してください."
		),
	};
};

extern Languages g_lang;