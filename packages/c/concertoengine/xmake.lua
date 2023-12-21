package('ConcertoEngine')
    set_homepage('https://github.com/ConcertoEngine/Concerto')
    set_description('Concerto engine')
    set_license('MIT')
    set_kind('library')
    add_urls('https://github.com/ConcertoEngine/Concerto.git')
    add_versions('2023.12.21+1', 'a2267d712d789869c76e755ec5c4fda6a735cdf0')
    add_deps('ConcertoCore')

    local modules = {
        Ecs = {
            name = "ecs",
            Option = "ecs",
            Dependencies = {},
        },
        Graphics = {
            name = "graphics",
            Option = "graphics",
            Dependencies = { "ConcertoEngineEcs" },
        }
    }

    for name, data in table.orderpairs(modules) do
        add_configs(data.name, { description = "Enable " .. data.name .. " module", default = true, type = "boolean" })
    end

    on_load(function (package)
        for name, data in table.orderpairs(modules) do
            if package:config(name) then
                for _, dep in ipairs(data.Dependencies) do
                    package:add('deps', dep)
                end
            end
        end
        if package:config("graphics") then
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
        end
    end)

    on_install(function (package)
        import("package.tools.xmake").install(package)
    end)
