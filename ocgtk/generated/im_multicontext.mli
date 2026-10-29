(** Supports switching between multiple input methods.

    Its methods, signals and properties are on {!class-type-im_multicontext_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Im_multicontext}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [IMMulticontext].}

    Inherits from: {{!Ocgtk.Im_context.class-type-im_context_t}Ocgtk.Im_context}

    Supports switching between multiple input methods.

    Text widgets such as [GtkText] or [GtkTextView] use a [GtkIMMultiContext] to
    implement their [im-module] property for switching between different input
    methods. *)
class type im_multicontext_t = object
  inherit Im_context.im_context_t

  (** {2:methods Methods} *)

  method get_context_id : unit -> string
  (** Gets the id of the currently active delegate of the [context]. *)

  method set_context_id : string option -> unit
  (** Sets the context id for [context].

      This causes the currently active delegate of [context] to be replaced by
      the delegate corresponding to the new context id.

      Setting this to a non-[None] value overrides the system-wide IM module
      setting. See the [Gtk.Settings:gtk-im-module] property. *)

  (** {2:conversions Conversions} *)

  method as_im_multicontext : Raw.Im_multicontext.t
end

class im_multicontext : Raw.Im_multicontext.t -> im_multicontext_t
(** Wraps a raw handle of {!Ocgtk.Raw.Im_multicontext.t}. *)

(** {1:description Description}

    Supports switching between multiple input methods.

    Text widgets such as [GtkText] or [GtkTextView] use a [GtkIMMultiContext] to
    implement their [im-module] property for switching between different input
    methods. *)

(** {1:constructors Constructors} *)

val new_ : unit -> im_multicontext_t
(** Creates a new [GtkIMMulticontext]. *)
