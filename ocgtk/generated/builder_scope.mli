(** Provides language binding support to [GtkBuilder].

    Its methods, signals and properties are on {!class-type-builder_scope_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Builder_scope}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BuilderScope].}

    Provides language binding support to [GtkBuilder].

    The goal of [GtkBuilderScope] is to look up programming-language-specific
    values for strings that are given in a [GtkBuilder] UI file.

    The primary intended audience is bindings that want to provide deeper
    integration of [GtkBuilder] into the language.

    A [GtkBuilderScope] instance may be used with multiple [GtkBuilder] objects,
    even at once.

    By default, GTK will use its own implementation of [GtkBuilderScope] for the
    C language which can be created via [Gtk.BuilderCScope.new].

    If you implement [GtkBuilderScope] for a language binding, you may want to
    (partially) derive from or fall back to a [Gtk.BuilderCScope], as that class
    implements support for automatic lookups from C symbols. *)
class type builder_scope_t = object
  (** {2:conversions Conversions} *)

  method as_builder_scope : Raw.Builder_scope.t
end

class builder_scope : Raw.Builder_scope.t -> builder_scope_t
(** Wraps a raw handle of {!Ocgtk.Raw.Builder_scope.t}. *)

(** {1:description Description}

    Provides language binding support to [GtkBuilder].

    The goal of [GtkBuilderScope] is to look up programming-language-specific
    values for strings that are given in a [GtkBuilder] UI file.

    The primary intended audience is bindings that want to provide deeper
    integration of [GtkBuilder] into the language.

    A [GtkBuilderScope] instance may be used with multiple [GtkBuilder] objects,
    even at once.

    By default, GTK will use its own implementation of [GtkBuilderScope] for the
    C language which can be created via [Gtk.BuilderCScope.new].

    If you implement [GtkBuilderScope] for a language binding, you may want to
    (partially) derive from or fall back to a [Gtk.BuilderCScope], as that class
    implements support for automatic lookups from C symbols. *)
