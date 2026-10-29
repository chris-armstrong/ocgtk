(* GENERATED CODE - DO NOT EDIT *)
(* StyleProvider: StyleProvider *)

(** An interface for style information used by
    {{!Ocgtk.Raw.Style_context}[Gtk.StyleContext]}.

    See [Gtk.StyleContext.add_provider] and
    [Gtk.StyleContext.add_provider_for_display] for adding [GtkStyleProviders].

    GTK uses the [GtkStyleProvider] implementation for CSS in
    {{!Ocgtk.Raw.Css_provider}[Gtk.CssProvider]}.

    The class built on this module is in {!Ocgtk.Style_provider}. *)

type t = [ `style_provider ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_style_provider_get_type"

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_style_provider_from_gobject"

(* Methods *)
val on_gtk_private_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
