### Nix expressions for GHC with -fcompact-holes

This patched version of GHC supports a `-fcompact-holes` flag, which
you can easily test if you are running Nix.

To build and run a shell with this version of GHC, either clone the
repository and run
```
nix-shell
```
or, without cloning, say
```
nix-shell https://github.com/kosmikus/ghc-compact-holes/archive/master.tar.gz
```

If the `-fcompact-holes` flag is set, typed holes are printed in a much more
compact format:
```
GHCi, version 8.7.20181108: http://www.haskell.org/ghc/  :? for help
Prelude> f = _ "foo"

<interactive>:1:5: error:
    • Found hole: _ :: [Char] -> t
      Where: ‘t’ is a rigid type variable bound by
               the inferred type of f :: t
               at <interactive>:1:1-11
    • In the expression: _
      In the expression: _ "foo"
      In an equation for ‘f’: f = _ "foo"
    • Relevant bindings include f :: t (bound at <interactive>:1:1)
      Valid hole fits include
        f :: forall t. t
          with f @([Char] -> t)
          (defined at <interactive>:1:1)
Prelude> :set -fcompact-holes 
Prelude> f = _ "foo"

<interactive>:3:5: error:
    • Hole:
        _ :: [Char] -> t
    • Context:
        f :: t
```

Currently, setting the flag implies the following:
```
  -fshow-hole-constraints
  -fno-show-valid-hole-fits
  -funclutter-valid-hole-fits
```

Note that even while valid hole fits are currently disabled by default with
this flag, you can simply enable them again by adding `-fshow-valid-hole-fits`
after -`fcompact-holes`.
