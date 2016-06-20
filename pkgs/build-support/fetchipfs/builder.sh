source $stdenv/setup

header "exporting $name into $out"

gx get -o "$out" "$ipfsHash"

stopNest
