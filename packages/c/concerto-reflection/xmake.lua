package("concerto-reflection")
    set_homepage("git@github.com:ConcertoEngine/ConcertoReflection")
    set_description("Concerto reflection system for C++")
    set_license("MIT")
    set_kind("library")
    add_urls("git@github.com:ConcertoEngine/ConcertoReflection.git")

    add_versions("2024.12.12+5", "0b88f354c18b6fdc3a8c138839f69abdb50503a3")
    add_deps("concerto-core", "pugixml", "eventpp", "catch2")

    on_install(function (package)
        import("package.tools.xmake").install(package, configs)
    end)
