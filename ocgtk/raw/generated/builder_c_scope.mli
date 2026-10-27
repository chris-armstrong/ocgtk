(* GENERATED CODE - DO NOT EDIT *)
(* BuilderCScope: BuilderCScope *)

(** A [GtkBuilderScope] implementation for the C language.

    [GtkBuilderCScope] instances use symbols explicitly added to [builder] with
    prior calls to [Gtk.BuilderCScope.add_callback_symbol]. If developers want
    to do that, they are encouraged to create their own scopes for that purpose.

    In the case that symbols are not explicitly added; GTK will uses [GModule]’s
    introspective features (by opening the module [NULL]) to look at the
    application’s symbol table. From here it tries to match the signal function
    names given in the interface description with symbols in the application.

    Note that unless [Gtk.BuilderCScope.add_callback_symbol] is called for all
    signal callbacks which are referenced by the loaded XML, this functionality
    will require that [GModule] be supported on the platform.

    The class built on this module is in {!Ocgtk.Builder_c_scope}. *)

type t = [ `builder_c_scope | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_builder_c_scope_get_type"

external new_ : unit -> t = "ml_gtk_builder_cscope_new"
(** Creates a new [GtkBuilderCScope] object to use with future [GtkBuilder]
    instances.

    Calling this function is only necessary if you want to add custom callbacks
    via [Gtk.BuilderCScope.add_callback_symbol]. *)

(* Methods *)
