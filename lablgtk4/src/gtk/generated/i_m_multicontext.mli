(* GENERATED CODE - DO NOT EDIT *)
(* IMMulticontext: IMMulticontext *)

type t = [`i_m_multicontext | `i_m_context | `object_] Gobject.obj

(** Create a new IMMulticontext *)
external gtk_im_multicontext_new : unit -> t = "ml_gtk_im_multicontext_new"

(** Sets the context id for @context.

This causes the currently active delegate of @context to be
replaced by the delegate corresponding to the new context id.

Setting this to a non-%NULL value overrides the system-wide
IM module setting. See the [property@Gtk.Settings:gtk-im-module]
property. *)
external gtk_im_multicontext_set_context_id : t -> string option -> unit = "ml_gtk_im_multicontext_set_context_id"

(** Gets the id of the currently active delegate of the @context. *)
external gtk_im_multicontext_get_context_id : t -> string = "ml_gtk_im_multicontext_get_context_id"

