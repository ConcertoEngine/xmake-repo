package("concerto-reflection")
    set_homepage("git@github.com:ConcertoEngine/ConcertoReflection")
    set_description("Concerto reflection system for C++")
    set_license("MIT")
    set_kind("library")
    add_urls("https://github.com/ConcertoEngine/ConcertoReflection.git")

    add_versions("2025.10.12", "aa7cff985421db57fc0ce1e0f5c676d26d4606a7")

    add_configs("asserts", {description = "Enable asserts.", default = false, type = "boolean"})
    
    on_load(function (package)
        package:add("deps", "concerto-core", {configs = {asserts = package:config("asserts"), shared = package:config("shared")}})
        if package:config("asserts") then
            package:add("defines", "CCT_ENABLE_ASSERTS")
        end

        if not package:config("shared") then
            package:add("defines", "CCT_REFLECTION_STATIC")
        end
    end)

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <Concerto/Core/Types/Types.hpp>
            #include <Concerto/Reflection/Reflection.hpp>

            void test() {
                cct::refl::Int32 i32;
                bool ok = *cct::refl::Int32::GetClass() == *cct::refl::GlobalNamespace::Get().GetClassByName("cct::refl::Int32");
            }
        ]]}, {configs = {languages = "c++20"}}))
    end)