function setup()
    local ok, startup = pcall(require, "startup")

    if ok then
        startup.setup({ theme = "startify" })
    end
end
