(* GENERATED CODE - DO NOT EDIT *)
(* PrintOperationPreview: PrintOperationPreview *)

type t = [`print_operation_preview] Gobject.obj

(** Renders a page to the preview.

This is using the print context that was passed to the
[signal@Gtk.PrintOperation::preview] handler together
with @preview.

A custom print preview should use this function to render
the currently selected page.

Note that this function requires a suitable cairo context to
be associated with the print context. *)
external render_page : t -> int -> unit = "ml_gtk_print_operation_preview_render_page"

(** Returns whether the given page is included in the set of pages that
have been selected for printing. *)
external is_selected : t -> int -> bool = "ml_gtk_print_operation_preview_is_selected"

(** Ends a preview.

This function must be called to finish a custom print preview. *)
external end_preview : t -> unit = "ml_gtk_print_operation_preview_end_preview"

