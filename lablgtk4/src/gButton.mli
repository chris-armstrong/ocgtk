(**************************************************************************)
(*    High-level button widget wrappers for lablgtk4                     *)
(**************************************************************************)

(** A widget that creates a signal when clicked on *)

(** {2 Button} *)

(** Button signal connections *)
class button_signals : Gtk.widget -> object
  method clicked : callback:(unit -> unit) -> Gobject.Signal.handler_id
end

class button_skel : Gtk.widget -> object
  inherit GObj.widget_impl
  method connect : button_signals
  method set_label : string -> unit
  method label : string
  method set_has_frame : bool -> unit
  method has_frame : bool
  method set_use_underline : bool -> unit
  method use_underline : bool
  method set_icon_name : string -> unit
  method icon_name : string
  method set_can_shrink : bool -> unit
  method can_shrink : bool
  method set_child : Gtk.widget option -> unit
  method child : Gtk.widget option
end

class button : Gtk.widget -> object
  inherit button_skel
end

val button :
  ?label:string ->
  ?use_mnemonic:bool ->
  ?icon_name:string ->
  ?has_frame:bool ->
  ?packing:(GObj.widget -> unit) ->
  ?show:bool ->
  unit -> button

(** {2 Check Button} *)

class check_button_skel : Gtk.widget -> object
  inherit GObj.widget_impl
  method set_active : bool -> unit
  method active : bool
  method set_label : string -> unit
  method label : string
  method set_use_underline : bool -> unit
  method use_underline : bool
  method set_inconsistent : bool -> unit
  method inconsistent : bool
  method set_group : check_button option -> unit
end

and check_button : Gtk.widget -> object
  inherit check_button_skel
end

val check_button :
  ?label:string ->
  ?use_mnemonic:bool ->
  ?active:bool ->
  ?group:check_button ->
  ?packing:(GObj.widget -> unit) ->
  ?show:bool ->
  unit -> check_button

(** Radio button using check button grouping (GTK4 style) *)
val radio_button :
  ?label:string ->
  ?use_mnemonic:bool ->
  ?group:check_button ->
  ?packing:(GObj.widget -> unit) ->
  ?show:bool ->
  unit -> check_button

(** {2 Toggle Button} *)

class toggle_button_skel : Gtk.widget -> object
  inherit button_skel
  method set_active : bool -> unit
  method active : bool
  method toggled : unit -> unit
end

class toggle_button : Gtk.widget -> object
  inherit toggle_button_skel
end

val toggle_button :
  ?label:string ->
  ?use_mnemonic:bool ->
  ?active:bool ->
  ?packing:(GObj.widget -> unit) ->
  ?show:bool ->
  unit -> toggle_button
