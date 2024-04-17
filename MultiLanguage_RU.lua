local addonName = ...
local optionsFrame = CreateFrame("Frame")

local function languageExists(value)
    for _, language in ipairs(MultiLanguageOptions.AVAILABLE_LANGUAGES) do
        if language.value == value then
            return true
        end
    end
    return false
end

local function addLanguageOption()
    if not languageExists('ru') then
        table.insert(MultiLanguageOptions.AVAILABLE_LANGUAGES, {value = 'ru', text = 'Russian'})
        AddLanguageDropdownOption()
    end

    if MultiLanguageTranslations['ru'] == nil then
        MultiLanguageTranslations['ru'] = {
            description = "Описание",
            objectives = "Цели"
        }
    end
end

local function addonLoaded(self, event, addonLoadedName)
    if addonLoadedName == addonName then
        addLanguageOption()
    end
end

optionsFrame:RegisterEvent("ADDON_LOADED")
optionsFrame:SetScript("OnEvent", addonLoaded)
