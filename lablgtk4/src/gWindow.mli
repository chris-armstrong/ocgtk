(**************************************************************************)
(*                Lablgtk4                                                *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(** High-level GtkWindow wrapper for GTK4 *)

(** {1 GtkWindow} *)

class window_skel : Window.t ->
  object
    inherit GObj.widget_impl

    method set_child : GObj.widget option -> unit
    method child : GObj.widget option
    method add : GObj.widget -> unit

    method title : string
    method set_title : string -> unit

    method set_default_size : width:int -> height:int -> unit
    method get_default_size : int * int

    method resizable : bool
    method set_resizable : bool -> unit

    method modal : bool
    method set_modal : bool -> unit

    method destroy : unit
    method present : unit
    method close : unit
  end

class window : Window.t ->
  object
    inherit window_skel
  end

(** Create a new window
    @param title Window title (default: "")
    @param width Default width in pixels (default: -1, use natural size)
    @param height Default height in pixels (default: -1, use natural size)
    @param resizable Whether window can be resized (default: true)
    @param modal Whether window is modal (default: false)
*)
val window :
  ?title:string ->
  ?width:int ->
  ?height:int ->
  ?resizable:bool ->
  ?modal:bool ->
  unit -> window
