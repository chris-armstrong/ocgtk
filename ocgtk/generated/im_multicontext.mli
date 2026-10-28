(** Supports switching between multiple input methods.

    Text widgets such as [GtkText] or [GtkTextView] use a [GtkIMMultiContext] to
    implement their [im-module] property for switching between different input
    methods.

    Its methods, signals and properties are on {!class-type-im_multicontext_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Im_multicontext}. *)

(** The methods, signals and properties of a [IMMulticontext]. *)
class type im_multicontext_t = object
  inherit Im_context.im_context_t

  method get_context_id : unit -> string
  (** Gets the id of the currently active delegate of the [context]. *)

  method set_context_id : string option -> unit
  (** Sets the context id for [context].

      This causes the currently active delegate of [context] to be replaced by
      the delegate corresponding to the new context id.

      Setting this to a non-[NULL] value overrides the system-wide IM module
      setting. See the [Gtk.Settings:gtk-im-module] property. *)

  method as_im_multicontext : Raw.Im_multicontext.t
end

class im_multicontext : Raw.Im_multicontext.t -> im_multicontext_t
(** Wraps a raw handle of {!Ocgtk.Raw.Im_multicontext.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> im_multicontext_t
(** Creates a new [GtkIMMulticontext]. *)
