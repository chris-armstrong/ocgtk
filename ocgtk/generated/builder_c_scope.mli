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
    The functions it is built on are in {!Ocgtk.Raw.Builder_c_scope}. *)

(** The methods, signals and properties of a [GtkBuilderCScope]. *)
class type builder_c_scope_t = object
  inherit Builder_scope.builder_scope_t
  method as_builder_c_scope : Raw.Builder_c_scope.t
end

class builder_c_scope : Raw.Builder_c_scope.t -> builder_c_scope_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Builder_c_scope.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkBuilderCScope], give one already wrapped. *)

val new_ : unit -> builder_c_scope_t
