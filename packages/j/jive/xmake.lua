package("jive")
    set_homepage("https://github.com/ImJimmi/JIVE")
    set_description("JIVE is a bundle of JUCE modules centered around the desire to have a more modern approach to UI development.")
    set_license("MIT")

    add_urls("https://github.com/ImJimmi/JIVE/archive/refs/tags/v1.1.1.zip")
    add_versions("1.1.1", "28e1b057c49c33b3c71ac9ea8714fcb2af4b0d5dc57b52a072cabbfb84bdc354")

    add_deps("cmake")
    add_deps("juce", {configs = {gui_basics=true}})

    on_install("macosx", "linux", "windows", function (package)
        package:add("defines", "JIVE_GUI_ITEMS_HAVE_STYLE_SHEETS")
        os.cp(path.join(package:scriptdir(), "port", "xmake.lua"), "xmake.lua")
        import("package.tools.xmake").install(package, configs)
    end)