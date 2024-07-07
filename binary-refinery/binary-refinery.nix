{ lib
, python3Packages
, fetchFromGitHub
, python-magic
}:

python3Packages.buildPythonApplication {
  pname = "binary-refinery";
  version = "0.6.42";

  src = fetchFromGitHub {
    owner = "binref";
    repo = "refinery";
    rev = "0.6.42";
    sha256 = "sha256-s98ILKtU54ZmGaY2lrzlCTNlXJNXEoZEsDHT9MIqJAY=";
  };

  nativeBuildInputs = with python3Packages; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    python-magic
  ] ++ (with python3Packages; [
    (callPackage ./macholib.nix {})
    colorama
    defusedxml
    msgpack
    pefile
    pycryptodomex
    pyelftools
    setuptools
    toml
  ]);

  # Disable tests for now
  doCheck = false;

  # Prevent setuptools from trying to fetch dependencies
  SETUPTOOLS_USE_DISTUTILS = "stdlib";

  meta = with lib; {
    description = "A toolkit to transform and refine (mostly) binary data.";
    homepage = "https://github.com/binref/refinery/";
    license = licenses.bsd3;
    maintainers = [ "bsendpacket" ];
  };
}