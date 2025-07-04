package("concerto-graphics")
    set_homepage("https://github.com/ConcertoEngine/ConcertoGraphics")
    set_description("Concerto engine graphics library")
    set_license("MIT")
    set_kind("library")
    add_urls("https://github.com/ConcertoEngine/ConcertoGraphics.git")
    
    add_versions("2025.06.16", "9e84472117a11087414270124129d3838abe5fa9")

    add_configs("shared", {description = "Build shared library.", default = true, type = "boolean", readonly = true})
    
    add_deps("volk", "vulkan-headers", "vulkan-memory-allocator", "stb", "libsdl2")
    add_deps("concerto-core", {configs = {shared = true}})
    add_deps("imgui", {configs = {sdl2 = true, vulkan = true, with_symbols = true, debug = true}})

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <Concerto/Graphics/RHI/APIImpl.hpp>
            #include <Concerto/Graphics/RHI/Instance.hpp>

            void test() {
                cct::gfx::rhi::Instance rInstance;
            }
        ]]}, {configs = {languages = "c++20"}}))
    end)
