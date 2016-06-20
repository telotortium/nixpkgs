{stdenv, gx}:
{name, ipfsHash, md5 ? "", sha256 ? ""}:

let
  name_ = "${name}-${toString ipfsHash}";
in

stdenv.mkDerivation {
  name = name_;
  builder = ./builder.sh;
  buildInputs = [gx];

  outputHashAlgo = if sha256 == "" then "md5" else "sha256";
  outputHashMode = "recursive";
  outputHash = if sha256 == "" then md5 else sha256;

  inherit ipfsHash;

  preferLocalBuild = true;
}
