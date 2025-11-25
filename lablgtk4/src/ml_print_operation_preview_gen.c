/* GENERATED CODE - DO NOT EDIT */
/* C bindings for PrintOperationPreview */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkPrintOperationPreview */
#ifndef Val_GtkPrintOperationPreview
#define GtkPrintOperationPreview_val(val) ((GtkPrintOperationPreview*)ext_of_val(val))
#define Val_GtkPrintOperationPreview(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPrintOperationPreview */


CAMLexport CAMLprim value ml_gtk_print_operation_preview_render_page(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_print_operation_preview_render_page(GtkPrintOperationPreview_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_print_operation_preview_is_selected(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_print_operation_preview_is_selected(GtkPrintOperationPreview_val(self), Int_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_print_operation_preview_end_preview(value self)
{
CAMLparam1(self);

gtk_print_operation_preview_end_preview(GtkPrintOperationPreview_val(self));
CAMLreturn(Val_unit);
}
