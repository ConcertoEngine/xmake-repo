package('ConcertoEngine')
    set_homepage('https://github.com/ConcertoEngine/Concerto')
    set_description('Concerto engine')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/Concerto.git')
    add_versions('2023.11.18+2', '63ba81a103435e977ce251c45eb398f2b9d8c760')
    add_deps('ConcertoCore')

    on_load(function (package)
        package:add('nazraengine', {configs={ debug = ismode('debug')
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
