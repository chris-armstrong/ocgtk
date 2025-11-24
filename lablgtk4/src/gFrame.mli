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

(** High-level GtkFrame wrapper for GTK4 *)

(** {1 GtkFrame} *)

class frame_skel : Frame.t ->
  object
    inherit GObj.widget_impl

    method set_child : GObj.widget option -> unit
    method child : GObj.widget option
    method add : GObj.widget -> unit

    method label : string option
    method set_label : string option -> unit

    method label_xalign : float
    method set_label_xalign : float -> unit
  end

class frame : Frame.t ->
  object
    inherit frame_skel
  end

(** Create a new frame
    @param label Frame label (default: None)
    @param label_xalign Label horizontal alignment 0.0-1.0 (default: 0.0)
*)
val frame :
  ?label:string ->
  ?label_xalign:float ->
  unit -> frame
