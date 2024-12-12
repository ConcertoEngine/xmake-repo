rule("find_cct_pkg_generator")
    on_config(function (target)
        import("core.project.project")
        import("lib.detect.find_tool")

        local cctPkgGen = project.required_package("concerto-reflection")
        local dir
        if cctPkgGen then
            dir = path.join(cctPkgGen:installdir(), "bin")
        end
        local program = find_tool("concerto-pkg-generator", {version = false, paths = dir})
        target:data_set("concerto-pkg-generator", program)
    end)
