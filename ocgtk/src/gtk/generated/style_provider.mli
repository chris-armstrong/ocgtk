(* GENERATED CODE - DO NOT EDIT *)
(* StyleProvider: StyleProvider *)

type t = [ `style_provider ] Gobject.obj
(** An interface for style information used by [Gtk.StyleContext].

    See [Gtk.StyleContext.add_provider] and
    [Gtk.StyleContext.add_provider_for_display] for adding [GtkStyleProviders].

    GTK uses the [GtkStyleProvider] implementation for CSS in [Gtk.CssProvider].
*)

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_style_provider_from_gobject"

(* Methods *)
val on_gtk_private_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
