local M = {}

M.start = function()
  local jdtls = require("jdtls")
  local home = os.getenv("HOME")

  local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
  if root_dir == nil then return end

  local workspace_dir = home .. "/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

  local config = {
    cmd = {
      "/usr/lib/jvm/java-21-openjdk-amd64/bin/java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens", "java.base/java.util=ALL-UNNAMED",
      "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
      "-jar",
      vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
      "-configuration",
      home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
      "-data", workspace_dir,
    },
    root_dir = root_dir,
    settings = {
      java = {
        eclipse = { downloadSources = true },
        configuration = { updateBuildConfiguration = "interactive" },
        maven = { downloadSources = true },
        references = { includeDecompiledSources = true },
        format = { enabled = true },
      },
    },
    on_attach = function(client, bufnr)
            if client.server_capabilities.semanticTokensProvider and client.server_capabilities.semanticTokensProvider.full then
                vim.lsp.semantic_tokens.start(bufnr, client.id)
            end

            vim.api.nvim_set_hl(0, "@lsp.type.class", { bold = true})
            vim.api.nvim_set_hl(0, "@lsp.type.interface", { italic = true})
            vim.api.nvim_set_hl(0, "@lsp.type.method", { italic = true})
            vim.api.nvim_set_hl(0, "@lsp.type.function", { italic = true })
            vim.api.nvim_set_hl(0, "@lsp.type.variable", { italic = true })
            vim.api.nvim_set_hl(0, "@lsp.type.property", { italic = true })
            vim.api.nvim_set_hl(0, "@lsp.type.parameter.java", { underline = true })
        end,
    init_options = { bundles = {} },
  }

  jdtls.start_or_attach(config)
end

return M

