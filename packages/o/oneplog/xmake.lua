package("oneplog")
    set_homepage("https://github.com/onePercentzcl/oneplog")
    set_description("High performance C++17 multi-process logging system / 高性能 C++17 多进程日志系统")
    set_license("MIT")
    
    add_urls("https://github.com/onePercentzcl/oneplog/archive/refs/tags/$(version).tar.gz",
             "https://github.com/onePercentzcl/oneplog.git")
    add_versions("v0.3.0", "42a70c45503f167eb06360ed02855729a515bf589b9a3a2f341790e7916a5100")
    add_versions("v0.2.1", "745c0f8a1f321368cde93c8e7667408d9b6a3de148daf524c51aca28908997b0")
    add_versions("v0.2.0", "b2d02191711d9919d9330d03c000c425aa0a1c05de831d029e55b2aa17d62f36")
    add_versions("v0.1.3", "a90a9ba79fab439e3b1a40dce576366abd2521cb6db75d79e6aa8d20f89ab895")
    add_versions("v0.1.2", "d3ea20d3217228ee6b14127c8f4362b894a818951bcbb5b1b5361544a81600b7")
    add_versions("v0.1.1", "4c4b9dc533d0faeb86cde84a01db2d58ec17f35c841a9274c725f398fc33abdd")
    add_versions("v0.1.0", "fad2efc6fd7a04715dea426bfdc25a5762930df6b7ce3db6c679e2137220d390")
    add_versions("v0.0.1", "f08c1eb8fb72d737547fb5749e7b4d56238ca468ac97bd16d583b950a5c348eb")
    
    add_configs("shared", {description = "Build shared library", default = false, type = "boolean"})
    add_configs("header_only", {description = "Use header-only mode", default = false, type = "boolean"})
    add_configs("use_fmt", {description = "Use bundled fmt library", default = true, type = "boolean"})
    
    if is_plat("linux") then
        add_syslinks("pthread", "rt")
    elseif is_plat("macosx") then
        add_syslinks("pthread")
    end
    
    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        elseif package:config("header_only") then
            configs.kind = "headeronly"
        end
        
        import("package.tools.xmake").install(package, configs)
    end)
    
    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <oneplog/oneplog.hpp>
            void test() {
                oneplog::Init();
                log::Info("test");
                oneplog::Shutdown();
            }
        ]]}, {configs = {languages = "c++17"}}))
    end)
package_end()
