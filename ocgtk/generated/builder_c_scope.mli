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

    Its methods, signals and properties are on {!class-type-builder_c_scope_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Builder_c_scope}. *)

(** {b The methods, signals and properties of a [BuilderCScope].}

    A [GtkBuilderScope] implementation for the C language.

    [GtkBuilderCScope] instances use symbols explicitly added to [builder] with
    prior calls to [Gtk.BuilderCScope.add_callback_symbol]. If developers want
    to do that, they are encouraged to create their own scopes for that purpose.

    In the case that symbols are not explicitly added; GTK will uses [GModule]’s
    introspective features (by opening the module [NULL]) to look at the
    application’s symbol table. From here it tries to match the signal function
    names given in the interface description with symbols in the application.

    Note that unless [Gtk.BuilderCScope.add_callback_symbol] is called for all
    signal callbacks which are referenced by the loaded XML, this functionality
    will require that [GModule] be supported on the platform. *)
class type builder_c_scope_t = object
  inherit Builder_scope.builder_scope_t
  method as_builder_c_scope : Raw.Builder_c_scope.t
end

class builder_c_scope : Raw.Builder_c_scope.t -> builder_c_scope_t
(** Wraps a raw handle of {!Ocgtk.Raw.Builder_c_scope.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> builder_c_scope_t
(** Creates a new [GtkBuilderCScope] object to use with future [GtkBuilder]
    instances.

    Calling this function is only necessary if you want to add custom callbacks
    via [Gtk.BuilderCScope.add_callback_symbol]. *)
