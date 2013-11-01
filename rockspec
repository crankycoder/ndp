package = "ndp"
version = "1.0-1"
source = {
   url = "https://github.com/crankycoder/ndp/archive/releases/1.0.tar.gz"
}
description = {
   summary = "ndp is a 'natural date parser' library.",
   detailed = [[
        ndp is a "natural date parser" library. It allows you to
        convert natural language user input to a more 
        machine-friendly time value.
   ]],
   homepage = "https://github.com/crankycoder/ndp/",
   license = "MIT"
}
dependencies = {
   "lua ~> 5.1",
   "lpeg~> 0.12",
}
build = {
    type = "builtin",
    modules = {
        ndp = "./ndp.lua"
    }
}

