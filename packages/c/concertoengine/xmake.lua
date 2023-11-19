package('ConcertoEngine')
    set_homepage('https://github.com/ConcertoEngine/Concerto')
    set_description('Concerto engine')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/Concerto.git')
    add_versions('2023.11.19+1', 'c1e618483e1e14226d8905fcd7c1983a2f040281')
    add_deps('ConcertoCore')

    on_load(function (package)
        package:add('deps', 'nazaraengine', {configs={ debug = package:is_debug(),
                                                    utility = true,
                                                    audio = false,
                                                    renderer = true,
                                                    joltphysics3d = false,
                                                    bulletphysics3d = false,
                                                    graphics = true,
                                                    plugin_assimp = false,
                                                    platform = true,
                                                    chipmunkphysics2d = false,
                                                    widgets = false,
                                                    network = false}})
    end)

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
