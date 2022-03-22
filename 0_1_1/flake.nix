{
  description = ''Hashicorp Vault HTTP Client'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-vaultclient-0_1_1.flake = false;
  inputs.src-vaultclient-0_1_1.owner = "jackhftang";
  inputs.src-vaultclient-0_1_1.ref   = "0_1_1";
  inputs.src-vaultclient-0_1_1.repo  = "vaultclient.nim";
  inputs.src-vaultclient-0_1_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-vaultclient-0_1_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-vaultclient-0_1_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}