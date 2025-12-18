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

(** High-level GtkScrolled_window wrapper for GTK4 *)

(** {1 GtkScrolled_window} *)

class scrolled_window_skel : Scrolled_window.t ->
  object
    inherit GObj.widget_impl

    method set_child : GObj.widget option -> unit
    method child : GObj.widget option
    method add : GObj.widget -> unit

    method set_policy :
      hpolicy:Gtk_enums.policytype ->
      vpolicy:Gtk_enums.policytype ->
      unit
    method policy : Gtk_enums.policytype * Gtk_enums.policytype

    method hscrollbar : GObj.widget option
    method vscrollbar : GObj.widget option

    method min_content_width : int
    method set_min_content_width : int -> unit

    method min_content_height : int
    method set_min_content_height : int -> unit
  end

class scrolled_window : Scrolled_window.t ->
  object
    inherit scrolled_window_skel
  end

(** Create a new scrolled window
    @param hpolicy Horizontal scrollbar policy (default: `AUTOMATIC)
    @param vpolicy Vertical scrollbar policy (default: `AUTOMATIC)
    @param min_content_width Minimum content width (default: -1, no minimum)
    @param min_content_height Minimum content height (default: -1, no minimum)
*)
val scrolled_window :
  ?hpolicy:Gtk_enums.policytype ->
  ?vpolicy:Gtk_enums.policytype ->
  ?min_content_width:int ->
  ?min_content_height:int ->
  unit -> scrolled_window
