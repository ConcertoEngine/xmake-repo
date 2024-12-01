package('concerto-core')
    set_homepage('https://github.com/ConcertoEngine/ConcertoCore')
    set_description('Concerto engine core library')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/ConcertoCore.git')
    add_versions('2024.12.01', '206b3d66e8ac14068d14d813f92db8a3ca36527c')
    add_deps("nlohmann_json")

    on_install(function (package)
        if package:has_tool("cxx", "cl", "clang_cl") then
            package:add("cxxflags", "/Zc:preprocessor")
        end
        import("package.tools.xmake").install(package)
    end)
