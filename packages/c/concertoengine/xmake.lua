package('ConcertoEngine')
    set_homepage('https://github.com/ConcertoEngine/Concerto')
    set_description('Concerto engine')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/Concerto.git')
    add_versions('2023.16.11+5', '2b5c29b94f366e5666837ba2dfe3fe978e108d59')
    add_deps('ConcertoCore')
    add_deps("nazaraengine", {debug=is_mode('debug'), configs={ utility = true,
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

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
