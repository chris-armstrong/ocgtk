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

(* $Id$ *)

(* Option handling *)

let may ~f x =
  match x with None -> ()
  | Some x -> let _ = f x in ()

let may_map ~f x =
  match x with None -> None
  | Some x -> Some (f x)

let default x ~opt =
  match opt with None -> x | Some y -> y

let may_default f x ~opt =
  match opt with None -> f x | Some y -> y
