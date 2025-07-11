package("concerto-core")
    set_homepage("https://github.com/ConcertoEngine/ConcertoCore")
    set_description("Concerto engine core library")
    set_license("MIT")
    set_kind("library")
    add_urls("https://github.com/ConcertoEngine/ConcertoCore.git")
    add_versions("2025.06.20", "85e4236ffa246773f0e8df0dca3bcf9fc594d50c")
    add_deps("enet")

    add_configs("shared", {description = "Build shared library.", default = false, type = "boolean"})
    add_configs("asserts", {description = "Enable asserts.", default = false, type = "boolean"})

    on_install(function (package)
        if package:has_tool("cxx", "cl", "clang_cl") then
            package:add("cxxflags", "/Zc:preprocessor")
        end
        if not package:config("shared") then
            package:add("defines", "CCT_CORE_LIB_STATIC")
        end

        local configs = {}
        configs.static = not package:config("shared")
        configs.tests = false
        configs.mode = package:is_debug() and "debug" or "release"
        configs.override_runtime = false
        configs.asserts = package:config("asserts")

        import("package.tools.xmake").install(package, configs)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <string>
            #include <Concerto/Core/Types.hpp>
            #include <Concerto/Core/Result.hpp>
            #include <Concerto/Core/DynLib.hpp>
            void test() {
                cct::Result<cct::Int32, std::string> result(28);
                cct::DynLib lib;
                bool ok = lib.IsLoaded();
            }
        ]]}, {configs = {languages = "c++20"}}))
    end)
