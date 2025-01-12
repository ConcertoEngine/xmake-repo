rule("find_cct_pkg_generator")
    before_build(function (target)
        import("core.project.project")
        import("lib.detect.find_tool")

        local cctPkgGen = project.required_package("concerto-reflection")
        local dir
		local envs
        if cctPkgGen then
            dir = path.join(cctPkgGen:installdir(), "bin")
        else
            cctPkgGen = project.target("concerto-pkg-generator")
        end

        if cctPkgGen then
            dir = cctPkgGen:targetdir()
            envs = cctPkgGen:get("runenvs")
            if not envs then
                envs = {}
                for _, pkg in ipairs(cctPkgGen:orderpkgs()) do
                    if os.host() == "linux" or os.host() == "macosx" then
                        local installDir = path.join(pkg:installdir(), "lib")
                        envs.LD_LIBRARY_PATH = installDir .. path.envsep() .. (envs.LD_LIBRARY_PATH or "")
                    elseif os.host() == "windows" then
                        local installDir = path.join(pkg:installdir(), "bin")
                        envs.PATH = installDir .. path.envsep() .. (envs.PATH or "")
                    end
                end
            end
        end
        print(envs)
        local program = find_tool("concerto-pkg-generator", {version = false, paths = dir, envs = envs})
        target:data_set("concerto-pkg-generator", program)
        target:data_set("concerto-pkg-generator-envs", envs)
    end)