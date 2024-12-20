
-- 配置按键绑定和编译运行 C++ 文件
vim.api.nvim_set_keymap('n', '<F5>', [[:lua RunCppFile()<CR>]], { noremap = true, silent = true })

function RunCppFile()
    local file = vim.fn.expand('%')  -- 获取当前文件路径
    local file_name = vim.fn.fnamemodify(file, ':t:r')  -- 获取文件名（不包括扩展名）

    -- 如果当前文件是C++文件
    if file:match("%.cpp$") then
        -- 编译 C++ 文件
        local compile_cmd = "g++ -std=c++17 -o -Wall -O2  " .. file_name .. " " .. file
        local result = vim.fn.system(compile_cmd)

        if vim.v.shell_error == 0 then
            -- 如果编译成功，执行程序
            local run_cmd = "./" .. file_name
            vim.fn.system(run_cmd)
            print("Program executed successfully")
        else
            -- 如果编译失败，打印错误信息
            print("Compilation failed: " .. result)
        end
    else
        print("Not a C++ file!")
    end
end
