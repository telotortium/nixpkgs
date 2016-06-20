{stdenv, fetchipfs}:
{package, md5 ? "", sha256 ? ""}:

with stdenv.lib;

let
  prefix = "gx/ipfs/";
  parts = (
    assert hasPrefix prefix package;
    splitString "/" (removePrefix prefix package));
  ipfsHash = builtins.head parts;
  srcParts = builtins.tail parts;
  name = concatStringsSep "_" srcParts;
  drv = fetchipfs {
    name = name;
    ipfsHash = ipfsHash;
    md5 = md5;
    sha256 = sha256;
  };
in

concatStringsSep "/" ([drv.out] ++ srcParts)
