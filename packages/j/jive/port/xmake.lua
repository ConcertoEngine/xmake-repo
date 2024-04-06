add_requires("juce", {configs={gui_basics=true}})

local modules = {
    "jive_components",
    "jive_core",
    "jive_layouts",
    "jive_style_sheets"
}

target("jive")
    set_kind("$(kind)")
    set_languages("cxx17")

    add_packages("juce")
    add_defines("JIVE_GUI_ITEMS_HAVE_STYLE_SHEETS")
    add_includedirs(".", {public=true})

    for _, module in ipairs(modules) do
        add_files(module .. "/" .. module ..".cpp")
        for _, dir in ipairs(os.files(module .. "/**.h")) do
            dir = dir:gsub("\\", "/"):gsub(module .. "/", "")
            add_headerfiles("(" .. module .. "/" .. dir .. ")")
        end
    end

