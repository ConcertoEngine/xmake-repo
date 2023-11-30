package('ConcertoEngine')
    set_homepage('https://github.com/ConcertoEngine/Concerto')
    set_description('Concerto engine')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/Concerto.git')
    add_versions('2023.11.30', '9af64464098a4a99152cccfa83a36e5768c9a768')
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
