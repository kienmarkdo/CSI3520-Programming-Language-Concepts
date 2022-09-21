# Overview
Personal notes and coursework in **CSI3520 Concepts des langages de programmation / CSI3120 Programming Language Concepts** at the University of Ottawa.

## Installation and setup (Windows 10)
This is how I set up OCaml on my Windows 10 computer.

- Follow this video from 0:00 to 4:10 https://www.youtube.com/watch?v=hyF_2uPjc8M
  - Install OCaml64 from fdopen https://fdopen.github.io/opam-repository-mingw/installation/
  - Open OCaml64 from home screen and run the following command `opam install dune utop ocaml-lsp-server`
- Install "OCaml Platform" extension on VS Code
- Follow this video from 4:00 to 5:45 https://www.youtube.com/watch?v=-yabnyUL4-U
  - Add the following path to environment variable `Path` for {USER} `C:\OCaml64\home\{USER}\.opam\4.14.0+mingw64c\bin`
  - Add the following path to new environment variable `OCAMLLIB` for {USER} `C:\OCaml64\home\{USER}\.opam\4.14.0+mingw64c\lib`
- Open VS Code and start coding away
  - OCaml files have extension `.ml`
  - Run `utop` in VS Code terminal before coding (Powershell or Bash, doesn't matter)
  - Run `#use FILE_NAME.ml` to import variables and functions in a file

## Learning the basics
Introduction to OCaml: Basics & Functions - Programming with OCaml #1 [2022] by narlock https://www.youtube.com/watch?v=uJ3_bNQPixQ
