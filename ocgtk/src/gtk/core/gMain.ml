(**************************************************************************)
(*                ocgtk - OCaml bindings for GTK4                         *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License version 2, as published by the                       *)
(*    Free Software Foundation with the exception described in file       *)
(*    COPYING which comes with the library.                               *)
(*                                                                        *)
(*    Based on lablgtk3 (https://github.com/garrigue/lablgtk)             *)
(*                                                                        *)
(**************************************************************************)

(** Main event loop and initialization for GTK4 *)

exception Error of string

(** C bindings *)
external gtk_init_check : string array -> string array = "ml_gtk_init"
external gtk_main : unit -> unit = "ml_gtk_main"
external gtk_main_quit : unit -> unit = "ml_gtk_main_quit"
external gtk_main_iteration_do : bool -> bool = "ml_gtk_main_iteration_do"

(** Initialize GTK *)
let init ?(setlocale=true) () =
  if not setlocale then
    (* GTK4 doesn't have gtk_disable_setlocale, but we can use setlocale(LC_ALL, "C") *)
    (* For now, just ignore this option - it's rarely used *)
    ();

  try
    gtk_init_check Sys.argv
  with Failure msg ->
    raise (Error ("GTK initialization failed: " ^ msg))

(** Start main loop *)
let main = gtk_main

(** Quit main loop *)
let quit = gtk_main_quit

(** Run one iteration *)
let iteration = gtk_main_iteration_do
