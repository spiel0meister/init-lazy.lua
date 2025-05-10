" Compiler: Odin

if exists("current_compiler")
    finish
endif
let current_compiler = "odin"

CompilerSet errorformat=
            \%f(%l:%c)\ Syntax\ Error:\ %m,
            \%f(%l:%c)\ Error:\ %m,

