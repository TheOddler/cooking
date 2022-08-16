with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    ruby
  ];

  shellHook = ''
    alias serve='bundle exec jekyll serve'
    alias build='bundle exec jekyll build'
  '';
}