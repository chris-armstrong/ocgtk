(* GENERATED CODE - DO NOT EDIT *)
(* IMMulticontext: IMMulticontext *)

(** Supports switching between multiple input methods.

    Text widgets such as [GtkText] or [GtkTextView] use a [GtkIMMultiContext] to
    implement their [im-module] property for switching between different input
    methods.

    The class built on this module is in {!Ocgtk.Im_multicontext}. *)

type t = [ `im_multicontext | `im_context | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_im_multicontext_get_type"

external new_ : unit -> t = "ml_gtk_im_multicontext_new"
(** Creates a new [GtkIMMulticontext]. *)

(* Methods *)

external set_context_id : t -> string option -> unit
  = "ml_gtk_im_multicontext_set_context_id"
(** Sets the context id for [context].

    This causes the currently active delegate of [context] to be replaced by the
    delegate corresponding to the new context id.

    Setting this to a non-[NULL] value overrides the system-wide IM module
    setting. See the [Gtk.Settings:gtk-im-module] property. *)

external get_context_id : t -> string = "ml_gtk_im_multicontext_get_context_id"
(** Gets the id of the currently active delegate of the [context]. *)
