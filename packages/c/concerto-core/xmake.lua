package('concerto-core')
    set_homepage('https://github.com/ConcertoEngine/ConcertoCore')
    set_description('Concerto engine core library')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/ConcertoCore.git')
    add_versions('2024.11.12', 'ad1b71c22f8dd35f4676402ac6ef2e360740bde6')
    add_deps("nlohmann_json")

    on_install(function (package)
        if package:has_tool("cxx", "cl", "clang_cl") then
            package:add("cxxflags", "/Zc:preprocessor")
        end
        import("package.tools.xmake").install(package)
    end)
