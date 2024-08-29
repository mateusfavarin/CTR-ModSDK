#include "languages.h"
#include "data.h"

Languages g_lang;

Languages::Languages()
{
  g_dataManager.BindData(&m_langIndex, DataType::SIZE_T, "Language");
}

const std::string& Languages::operator[](const std::string& str)
{
  {
    const std::string& language = m_langs[m_langIndex];
    const auto& translationMap = m_translations.find(str);
    if (translationMap != m_translations.end()) {
      const auto& langMap = translationMap->second;
      const auto& translation = langMap.find(language);
      if (translation != langMap.end()) {
        return translation->second;
      }
    }
    return str; // If no translation is found, return the original string
  }
}
