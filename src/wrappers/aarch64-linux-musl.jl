# Autogenerated wrapper script for Gettext_jll for aarch64-linux-musl
export libgettext

using Libiconv_jll
using XML2_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libgettext`
const libgettext_splitpath = ["lib", "libgettextlib.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgettext_path = ""

# libgettext-specific global declaration
# This will be filled out by __init__()
libgettext_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgettext = "libgettextlib-0.20.1.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Gettext")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Libiconv_jll.PATH_list, XML2_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Libiconv_jll.LIBPATH_list, XML2_jll.LIBPATH_list,))

    global libgettext_path = normpath(joinpath(artifact_dir, libgettext_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgettext_handle = dlopen(libgettext_path)
    push!(LIBPATH_list, dirname(libgettext_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':'))            end  # __init__()

