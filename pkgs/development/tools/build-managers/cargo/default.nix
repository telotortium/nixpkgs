{ stdenv, fetchgit, rustPlatform, file, curl, python, pkgconfig, openssl
, cmake, zlib }:

with ((import ./common.nix) { inherit stdenv; version = "2015-06-24"; });

with rustPlatform;

buildRustPackage rec {
  inherit name version meta;

  src = fetchgit {
    url = "https://github.com/rust-lang/cargo.git";
    rev = "a2dd2ac60015974d413970f49fddd6784b293098";
    sha256 = "0crrgn1ndi57nvcj88jyyhwgj8x3fiyh9k5lj4hz009fxy7vav63";
    leaveDotGit = true;
  };

  depsSha256 = "1sgdr2akd9xrfmf5g0lbf842b2pdj1ymxk37my0cf2x349rjsf0w";

  buildInputs = [ file curl pkgconfig python openssl cmake zlib ];

  configurePhase = ''
    ./configure --enable-optimize --prefix=$out --local-cargo=${cargo}/bin/cargo
  '';

  buildPhase = "make";

  # Disable check phase as there are lots of failures (some probably due to
  # trying to access the network).
  doCheck = false;

  installPhase = ''
    make install
    ${postInstall}
  '';
}
