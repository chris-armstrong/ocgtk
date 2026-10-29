(** An interface for style information used by
    {{!Ocgtk.Style_context.class-type-style_context_t}[Gtk.StyleContext]}.

    Its methods, signals and properties are on {!class-type-style_provider_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Style_provider}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [StyleProvider].}

    An interface for style information used by
    {{!Ocgtk.Style_context.class-type-style_context_t}[Gtk.StyleContext]}.

    See
    {{!Ocgtk.Style_context.class-type-style_context_t.method-add_provider}[Gtk.StyleContext.add_provider]}
    and [Gtk.StyleContext.add_provider_for_display] for adding
    [GtkStyleProviders].

    GTK uses the [GtkStyleProvider] implementation for CSS in
    {{!Ocgtk.Css_provider.class-type-css_provider_t}[Gtk.CssProvider]}. *)
class type style_provider_t = object
  (** {2:signals Signals} *)

  method on_gtk_private_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  (** {2:conversions Conversions} *)

  method as_style_provider : Raw.Style_provider.t
end

class style_provider : Raw.Style_provider.t -> style_provider_t
(** Wraps a raw handle of {!Ocgtk.Raw.Style_provider.t}. *)

(** {1:description Description}

    An interface for style information used by
    {{!Ocgtk.Style_context.class-type-style_context_t}[Gtk.StyleContext]}.

    See
    {{!Ocgtk.Style_context.class-type-style_context_t.method-add_provider}[Gtk.StyleContext.add_provider]}
    and [Gtk.StyleContext.add_provider_for_display] for adding
    [GtkStyleProviders].

    GTK uses the [GtkStyleProvider] implementation for CSS in
    {{!Ocgtk.Css_provider.class-type-css_provider_t}[Gtk.CssProvider]}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
