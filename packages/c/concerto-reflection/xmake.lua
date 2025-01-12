package("concerto-reflection")
    set_homepage("git@github.com:ConcertoEngine/ConcertoReflection")
    set_description("Concerto reflection system for C++")
    set_license("MIT")
    set_kind("library")
    add_urls("https://github.com/ConcertoEngine/ConcertoReflection.git")

    add_versions("2025.01.12+2", "4372b66e321f298b010f4d7d4557eca58500bbd7")
    add_deps("concerto-core", "pugixml")

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <Concerto/Core/Types.hpp>
            #include <Concerto/Reflection/Reflection.hpp>>

            void test() {
                cct::refl::Int32 i32;
                bool ok = *cct::refl::Int32::GetClass() == *cct::refl::GlobalNamespace::Get().GetClassByName("cct::refl::Int32");
            }
        ]]}, {configs = {languages = "c++20"}}))
    end)