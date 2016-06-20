{ stdenv, buildGoPackage, fetchFromGitHub, fetchGxGoPackage }:

buildGoPackage rec {
  name = "ipfs-${version}";
  version = "i20160514--${stdenv.lib.strings.substring 0 7 rev}";
  rev = "0b701e832a1804e2b5ea5852a9703a1f3186793c";

  goPackagePath = "github.com/ipfs/go-ipfs";

  goDeps = ./deps.json;

  src = fetchFromGitHub {
    owner = "ipfs";
    repo = "go-ipfs";
    inherit rev;
    sha256 = "1lbxjblcmacpnngjmgyxp9hd5lmvm49bsvjcig5bh06gyf0hj66d";
  };

  extraSrcs = let
    ipfsAliasSrcList = ipfsSrc: aliases: [ipfsSrc]
      ++ map (alias: rec {
        goPackagePath = alias;
        src = ipfsSrc.src;
      }) aliases;
  in [
    rec {
      goPackagePath = "gx/ipfs/QmdhsRK1EK2fvAz2i2SH5DEfkL6seDuyMYEsxKa9Braim3/client_golang/prometheus";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "0dk3z0j3i682v7713lkhjj1zbhqwn3102439arzv2g7bp7chlbs8";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmQopLATEYMNg7dVqZRNDfeE2S1yKy8zrRh5xnYiuqeZBn/goprocess/context";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "15swy70jawhf5bvdkdg4zh4wb51gcxvs0a0fzfynvfk9r3lskfjn";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmQopLATEYMNg7dVqZRNDfeE2S1yKy8zrRh5xnYiuqeZBn/goprocess/periodic";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "15swy70jawhf5bvdkdg4zh4wb51gcxvs0a0fzfynvfk9r3lskfjn";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmQopLATEYMNg7dVqZRNDfeE2S1yKy8zrRh5xnYiuqeZBn/goprocess/ratelimit";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "15swy70jawhf5bvdkdg4zh4wb51gcxvs0a0fzfynvfk9r3lskfjn";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmYzDkkgAEmrcNzFCiYo6L1dTX4EAG1gZkbtdbd9trL4vd/go-multiaddr";
      goPackageAliases = ["github.com/jbenet/go-multiaddr"];
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "00cay579zdy9ddz11qz6q1ickmkgawavmdn5ra9nsnbzvb9k3cpn";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmUaRHbB7pUwj5mS9BS4CMvBiW48MpaH2wbGxeWfFhhHxK/multiaddr-filter";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "195ikv1lmd1by434zvxvhf7bkyfdxl3sl4ggp5ad0lqvgsv2j88n";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpD74pUj6vuxTp1o6LhA3JavC2Bvh9fsWPPVvHnD9sE7/go-libp2p-peer/queue";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "00adqb9jyc668x5nhg3lj0my87cfwx507mjixdc1hf4fgyyczbcv";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/discovery";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/host";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/host/basic";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/host/routed";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/metrics";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/net";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/net/conn";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/net/swarm";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/net/swarm/addr";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/protocol";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/protocol/identify";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/protocol/ping";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p/p2p/test/util";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
      };
    }
    rec {
      goPackagePath = "gx/ipfs/QmZy2y8t9zQH2a1b8q2ZSLKp17ATuJoCNxxyMFG5qFExpt/go-net/context";
      src = fetchGxGoPackage {
        package = goPackagePath;
        sha256 = "0g9ryd5z2hfyvbh32mlswqjm9ncxnjj87si4igr86k2l8v9cpydj";
      };
    }
  ] ++ [
    rec {
      goPackagePath = "github.com/anacrolix/missinggo";
      src = fetchFromGitHub {
        owner = "anacrolix";
        repo = "missinggo";
        rev = "b58ed0d2d777019fbe0b01fb30eb3137826ec4b8";
        sha256 = "0x77gwi9iy7xgxzwv5p8fddq1piwfvyxwbp1bfa2da3qhrkwckxh";
      };
    }
    rec {
      goPackagePath = "github.com/anacrolix/sync";
      src = fetchFromGitHub {
        owner = "anacrolix";
        repo = "sync";
        rev = "812602587b72df6a2a4f6e30536adc75394a374b";
        sha256 = "0pc38wanzws3vzqj0l5pakg3gn2hacqrb4n7pd0sqz083rss5k0l";
      };
    }
    rec {
      goPackagePath = "github.com/anacrolix/utp";
      src = fetchFromGitHub {
        owner = "anacrolix";
        repo = "utp";
        rev = "d7ad5aff2b8a5fa415d1c1ed00b71cfd8b4c69e0";
        sha256 = "07piwfny3b4prxf2shc512ai0qmrmrj839lbza9clhgcmj1a75d7";
      };
    }
    rec {
      goPackagePath = "github.com/cryptix/mdns";
      src = fetchFromGitHub {
        owner = "cryptix";
        repo = "mdns";
        rev = "04ff72a32679d57d009c0ac0fc5c4cda10350bad";
        sha256 = "04wdq7xhsndj5gxvcfssnc097jrisnb7zwx7pppzjir2yambwzyh";
      };
    }
    rec {
      goPackagePath = "github.com/docker/spdystream";
      src = fetchFromGitHub {
        owner = "docker";
        repo = "spdystream";
        rev = "449fdfce4d962303d702fec724ef0ad181c92528";
        sha256 = "1412cpiis971iq1kxrirzirhj2708ispjh0x0dh879b66x8507sl";
      };
    }
    rec {
      goPackagePath = "github.com/fd/go-nat";
      src = fetchFromGitHub {
        owner = "fd";
        repo = "go-nat";
        rev = "dcaf50131e4810440bed2cbb6f7f32c4f4cc95dd";
        sha256 = "094aqkjv9qfmy1k8xrg7cl4njbvamm51fdilay9c75wcax9p41jv";
      };
    }
    rec {
      goPackagePath = "github.com/hashicorp/yamux";
      src = fetchFromGitHub {
        owner = "hashicorp";
        repo = "yamux";
        rev = "badf81fca035b8ebac61b5ab83330b72541056f4";
        sha256 = "19mxjb4l2wn6rjxldydl332na1zmp8a52csm2qhwj21qidajwzvl";
      };
    }
    rec {
      goPackagePath = "github.com/huin/goupnp";
      src = fetchFromGitHub {
        owner = "huin";
        repo = "goupnp";
        rev = "46bde78b11f3f021f2a511df138be9e2fc7506e8";
        sha256 = "0mp3667ibzmxc5b4cmvrssr58d4p8izyagfcjdpyrw92as2bxbmc";
      };
    }
    rec {
      goPackagePath = "github.com/ipfs/go-libp2p-loggables";
      src = fetchFromGitHub {
        owner = "ipfs";
        repo = "go-libp2p-loggables";
        rev = "6eb2b1d60eb3f4b3d02d69d2a4352c8ffd8a1c78";
        sha256 = "06rzjn1daaa50hds580i1zjma5k1miyn38zspabshmy01mw3555n";
      };
    }
    rec {
      goPackagePath = "github.com/jackpal/gateway";
      src = fetchFromGitHub {
        owner = "jackpal";
        repo = "gateway";
        rev = "3e333950771011fed13be63e62b9f473c5e0d9bf";
        sha256 = "1bsml9kx49ihsnlq5k8cw7875ar4vmh9q15kpxn0dlvpafmma1bi";
      };
    }
    rec {
      goPackagePath = "github.com/jackpal/go-nat-pmp";
      src = fetchFromGitHub {
        owner = "jackpal";
        repo = "go-nat-pmp";
        rev = "1fa385a6f45828c83361136b45b1a21a12139493";
        sha256 = "1n5h3qrd613cfw95vyqpy9vh3xv0zgbk3j5q8zad25q10wvp6ymn";
      };
    }
    rec {
      goPackagePath = "github.com/jbenet/go-msgio";
      src = fetchFromGitHub {
        owner = "jbenet";
        repo = "go-msgio";
        rev = "242a3f4ed2d0098bff2f25b1bd32f4254e803b23";
        sha256 = "111w6y4kyls4p0azzv42m2dkalkpyji5wrawxyzpa5h100qqh3g9";
      };
    }
    rec {
      goPackagePath = "github.com/jbenet/go-peerstream";
      src = fetchFromGitHub {
        owner = "jbenet";
        repo = "go-peerstream";
        rev = "f3ab20739a88aa79306dc039c1b5a39e7afa45d6";
        sha256 = "1zb6bs2ppahk06zc4wz5q52vxvzzyy4nbjck7x6rpp6k9vcsdj8y";
      };
    }
    rec {
      goPackagePath = "github.com/jbenet/go-reuseport";
      src = fetchFromGitHub {
        owner = "jbenet";
        repo = "go-reuseport";
        rev = "71193aa1a9b006b1071652f02f2f9d8db699a8b3";
        sha256 = "12vzrchywkp1h17f8hxkbw5abs294zkc5cfvbx658nyl5gqwfdbz";
      };
    }
    rec {
      goPackagePath = "github.com/jbenet/go-sockaddr";
      src = fetchFromGitHub {
        owner = "jbenet";
        repo = "go-sockaddr";
        rev = "2e7ea655c10e4d4d73365f0f073b81b39cb08ee1";
        sha256 = "1idhfm0s6nk7bbm6q5lrx7yjs3qmxj8ji4i93zvlziyy01fqsk00";
      };
    }
    rec {
      goPackagePath = "github.com/jbenet/go-stream-muxer";
      src = fetchFromGitHub {
        owner = "jbenet";
        repo = "go-stream-muxer";
        rev = "65362092d90b4b2eaa3573ea6198cc65ef0468e6";
        sha256 = "05c9x6dkk1qgkbm13ry6a54517grpyprvydy04ij5vgb1g6nxy98";
      };
    }
    rec {
      goPackagePath = "github.com/jbenet/go-temp-err-catcher";
      src = fetchFromGitHub {
        owner = "jbenet";
        repo = "go-temp-err-catcher";
        rev = "aac704a3f4f27190b4ccc05f303a4931fd1241ff";
        sha256 = "1fyqkcggnrzwxa8iii15g60w2jikdm26sr7l36km7y0nc2kvf7jc";
      };
    }
    rec {
      goPackagePath = "github.com/whyrusleeping/go-keyspace";
      src = fetchFromGitHub {
        owner = "whyrusleeping";
        repo = "go-keyspace";
        rev = "5b898ac5add1da7178a4a98e69cb7b9205c085ee";
        sha256 = "0fkk7i7qxwbz1g621mm6a6inb69lr57cyc9ayyfiwhnjwfz78rbb";
      };
    }
    rec {
      goPackagePath = "github.com/whyrusleeping/go-logging";
      src = fetchFromGitHub {
        owner = "whyrusleeping";
        repo = "go-logging";
        rev = "128b9855511a4ea3ccbcf712695baf2bab72e134";
        sha256 = "1fp3xmhngmfxwfp1xnyd6w12y288a0pacx9glqcbbjxkzfwn595x";
      };
    }
    rec {
      goPackagePath = "github.com/whyrusleeping/go-metrics";
      src = fetchFromGitHub {
        owner = "whyrusleeping";
        repo = "go-metrics";
        rev = "1ca5caed0cfa95a47fd65a79762286ae626c865c";
        sha256 = "0czypdbzdd8m17hqzqqrnv248nrgg01aihdb0pvs796ni8czrgzm";
      };
    }
    rec {
      goPackagePath = "github.com/whyrusleeping/go-multistream";
      src = fetchFromGitHub {
        owner = "whyrusleeping";
        repo = "go-multistream";
        rev = "4681a3904ab3a103783eca67ce297a25ffe3f68c";
        sha256 = "0mpw3ny4mzp0si7lvdm48k3qal95c7mmj18ayhc9ai23zkrccahf";
      };
    }
    rec {
      goPackagePath = "github.com/whyrusleeping/go-notifier";
      src = fetchFromGitHub {
        owner = "whyrusleeping";
        repo = "go-notifier";
        rev = "8104fe9cf050122ef9b93660d51b72d8cfa2a302";
        sha256 = "0afgs1kkxdxy9bd125n2ak10ikz7341bfq88vsb6q4c53rcynbk7";
      };
    }
    rec {
      goPackagePath = "github.com/whyrusleeping/go-smux-multistream";
      src = fetchFromGitHub {
        owner = "whyrusleeping";
        repo = "go-smux-multistream";
        rev = "8b0da8d003bb52de41eebc179888fceb3787392e";
        sha256 = "0splgs31n6hnd4xw1w212qggqw78hhf465gs9mjw30w3d74g9wvq";
      };
    }
  ] ++ (stdenv.lib.concatMap (x: ipfsAliasSrcList x.ipfsSrc x.aliases) [
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmT8rehPR3F6bmwL6zjUN8XpiDBFFpMP2myPdC6ApsWfJf/go-base58";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "0w88fl4ll8s1s0p4dabvdwz369354qla998y759i71hah429b2k7";
        };
      };
      aliases = ["github.com/jbenet/go-base58"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmYf7ng2hG5XBtJA3tN34DQ2GUN5HNksEw1rLDkmr6vGku/go-multihash";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "16a82gifad0dz7yxfkr2r8q143q6kn01qy9g7gggnw7dls2a0ks1";
        };
      };
      aliases = ["github.com/jbenet/go-multihash"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmYzDkkgAEmrcNzFCiYo6L1dTX4EAG1gZkbtdbd9trL4vd/go-multiaddr";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "00cay579zdy9ddz11qz6q1ickmkgawavmdn5ra9nsnbzvb9k3cpn";
        };
      };
      aliases = ["github.com/jbenet/go-multiaddr"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmZ4Qi3GaRbjcx28Sme5eMH7RQjGkt8wHxt2a65oLaeFEV/gogo-protobuf/io";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "1mryighzgr3lm37sc74zd8pjjqpn1xbsykskx550rwpmahq0bxpv";
        };
      };
      aliases = ["github.com/gogo/protobuf/io"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmZ4Qi3GaRbjcx28Sme5eMH7RQjGkt8wHxt2a65oLaeFEV/gogo-protobuf/proto";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "1mryighzgr3lm37sc74zd8pjjqpn1xbsykskx550rwpmahq0bxpv";
        };
      };
      aliases = ["github.com/gogo/protobuf/proto"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmZNVWh8LLjAavuQ2JXuFmuYH3C11xo988vSgp7UQrTRj1/go-ipfs-util";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "1r0i97phihg7vgqdw5rspdp5xrnxk1g35lnzssijyvbdb9zs6jb4";
        };
      };
      aliases = ["github.com/ipfs/go-ipfs-util"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmUEUu1CM8bxBJxc3ZLojAi8evhTr4byQogWstABet79oY/go-libp2p-crypto";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "19xb70ggb7xrw8ir8cyaamzdzxn47s4fz5jj3rj7ks8jpax37ls4";
        };
      };
      aliases = ["github.com/ipfs/go-libp2p-crypto"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmZpD74pUj6vuxTp1o6LhA3JavC2Bvh9fsWPPVvHnD9sE7/go-libp2p-peer";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "00adqb9jyc668x5nhg3lj0my87cfwx507mjixdc1hf4fgyyczbcv";
        };
      };
      aliases = ["github.com/ipfs/go-libp2p-peer"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmZpVD1kkRwoC67vNknvCrY72pjmVdtZ7txSk8mtCbuwd3/go-libp2p";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "14adq32qmqs360b9zxlzi7c5fl3h9zd7qmdbs8kmqj99xdw7pvcf";
        };
      };
      aliases = ["github.com/ipfs/go-libp2p"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmQopLATEYMNg7dVqZRNDfeE2S1yKy8zrRh5xnYiuqeZBn/goprocess";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "15swy70jawhf5bvdkdg4zh4wb51gcxvs0a0fzfynvfk9r3lskfjn";
        };
      };
      aliases = ["github.com/jbenet/goprocess"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmZ4Qi3GaRbjcx28Sme5eMH7RQjGkt8wHxt2a65oLaeFEV/gogo-protobuf";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "1mryighzgr3lm37sc74zd8pjjqpn1xbsykskx550rwpmahq0bxpv";
        };
      };
      aliases = ["github.com/gogo/protobuf"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmPDQHJHvzAp9Tver9VAoqzuzcS3uEjPYLYp2CMh89h5fC/go-libp2p-secio";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "061ciqhh22hxwj6i1c6f4ybvkcy00nxfw0wjhbzkv00jbky5asmk";
        };
      };
      aliases = ["github.com/ipfs/go-libp2p-secio"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmaNko8ug5seuo61TnmW8jcVtCVgD6uR454wagU7PPKVWA/go-libp2p-transport";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "064kclk4v9k40qyzy5v369bcpnq2axgx24jwy37536cvdg6fi5f8";
        };
      };
      aliases = ["github.com/ipfs/go-libp2p-transport"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmaDNZ4QMdBdku1YZWBysufYyoQt1negQGNav6PLYarbY8/go-log";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "1rlavxr1ln09bhmr8kzkimb0c97niyvq40wbjwjrpis1bzp898wf";
        };
      };
      aliases = ["github.com/ipfs/go-log"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmUBa4w6CbHJUMeGJPDiMEDWsM93xToK1fTnFXnrC8Hksw/go-multiaddr-net";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "02jk1kbc3i9nm1yi6jaria5s8slfmcrky283jwm6gd7yicmwqmrm";
        };
      };
      aliases = ["github.com/jbenet/go-multiaddr-net"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmeLQ13LftT9XhNn22piZc3GP56fGqhijuL5Y8KdUaRn1g/mafmt";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "04bjh7xmk42i6g63vdcb5j3sg4rad0r705ihdn14zzwpk9pqspiy";
        };
      };
      aliases = ["github.com/whyrusleeping/mafmt"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmSMZwvs3n4GBikZ7hKzT17c3bk65FmyZo2JqtJ16swqCv/multiaddr-filter";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "1y4r962rgagyjzcf1afb5l15x6s4vvpn5ggbf5aijyc9fmklx39v";
        };
      };
      aliases = ["github.com/whyrusleeping/multiaddr-filter"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmYVkdUUNyPfPGYKc49TMd9BV8ByxRgoCauaZghh3bu81d/go-smux-spdystream";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "0b25avddwa768j1hw8a0jxwsb6csd42wv251acqinf3vb7j52nfq";
        };
      };
      aliases = ["github.com/whyrusleeping/go-smux-spdystream"];
    }
    {
      ipfsSrc = rec {
        goPackagePath = "gx/ipfs/QmRgddEN3nMY2jecG3EFNTMZzdk1gXEnPQxksJuReMTUZV/go-smux-yamux";
        src = fetchGxGoPackage {
          package = goPackagePath;
          sha256 = "0q5iw59x0m0pcvvvlx48gbps9vj0wqwb6ll9rgakm42wk5irphcw";
        };
      };
      aliases = ["github.com/whyrusleeping/go-smux-yamux"];
    }
  ]);


  meta = with stdenv.lib; {
    description = "A global, versioned, peer-to-peer filesystem";
    license = licenses.mit;
  };
}
