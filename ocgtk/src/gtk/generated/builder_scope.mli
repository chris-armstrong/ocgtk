(* GENERATED CODE - DO NOT EDIT *)
(* BuilderScope: BuilderScope *)

type t = [ `builder_scope ] Gobject.obj
(** Provides language binding support to [GtkBuilder].

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

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_builder_scope_from_gobject"

(* Methods *)
