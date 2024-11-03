# desk.nu - desk completions for nushell
# To install the completions, you can either:
# 1. Copy this file to your Nushell config directory
# 2. Source it from your config.nu

def "nu-complete desk subcommands" [] {
    [
        "init", 
        "list", 
        "ls",
        "go",
        ".",
        "run",
        "edit",
        "help",
        "shell",
        "version"
    ]
}

def "nu-complete desk names" [] {
    ^desk ls --only-names
}

# Main completion registration
export extern "desk" [
    subcommand?: string@"nu-complete desk subcommands"  # The desk subcommand to run
    --help(-h)                                         # Show help text
    ...args: any                                       # Additional arguments
]

# Subcommand completions
export extern "desk init" []                           # Initialize desk configuration

export extern "desk list" [
    --only-names                                       # List only the names of the desks
    --no-format                                        # Use ' - ' to separate names from descriptions
]

export extern "desk ls" [
    --only-names                                       # List only the names of the desks
    --no-format                                        # Use ' - ' to separate names from descriptions
]

export extern "desk go" [
    desk_name?: string@"nu-complete desk names"        # Name of the desk to activate
    ...args: any                                       # Additional arguments passed to shell
]

export extern "desk ." [
    desk_name?: string@"nu-complete desk names"        # Name of the desk to activate
    ...args: any                                       # Additional arguments passed to shell
]

export extern "desk run" [
    desk_name?: string@"nu-complete desk names"        # Name of the desk to run
    ...args: any                                       # Command to run in desk's environment
]

export extern "desk edit" [
    desk_name?: string@"nu-complete desk names"        # Name of the desk to edit
]

export extern "desk help" []                           # Show help text

export extern "desk version" []                        # Show version information 