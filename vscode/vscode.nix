{ pkgs, ... }: {

    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        extensions = [
            pkgs.vscode-extensions.bbenoist.nix
            pkgs.vscode-extensions.ms-python.python
            pkgs.vscode-extensions.emroussel.atomize-atom-one-dark-theme
        ];

        userSettings = {
            "workbench.colorTheme" = "Atomize";
            "workbench.startupEditor" = "none";
        };
    };
}