(** An interface for style information used by [Gtk.StyleContext].

    See [Gtk.StyleContext.add_provider] and
    [Gtk.StyleContext.add_provider_for_display] for adding [GtkStyleProviders].

    GTK uses the [GtkStyleProvider] implementation for CSS in [Gtk.CssProvider].

    Its methods, signals and properties are on {!class-type-style_provider_t}.
    The functions it is built on are in {!Ocgtk.Raw.Style_provider}. *)

(** {b The methods, signals and properties of a [StyleProvider].}

    An interface for style information used by [Gtk.StyleContext].

    See [Gtk.StyleContext.add_provider] and
    [Gtk.StyleContext.add_provider_for_display] for adding [GtkStyleProviders].

    GTK uses the [GtkStyleProvider] implementation for CSS in [Gtk.CssProvider].
*)
class type style_provider_t = object
  method on_gtk_private_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method as_style_provider : Raw.Style_provider.t
end

class style_provider : Raw.Style_provider.t -> style_provider_t
(** Wraps a raw handle of {!Ocgtk.Raw.Style_provider.t}. *)
