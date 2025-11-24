/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextChildAnchor */

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

/* Type-specific conversion macros for GtkTextChildAnchor */
#define GtkTextChildAnchor_val(val) ((GtkTextChildAnchor*)ext_of_val(val))
#define Val_GtkTextChildAnchor(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_text_child_anchor_new(value unit)
{
CAMLparam1(unit);
GtkTextChildAnchor *obj = gtk_text_child_anchor_new();
CAMLreturn(Val_GtkTextChildAnchor(obj));
}

CAMLexport CAMLprim value ml_gtk_text_child_anchor_new_with_replacement(value arg1)
{
CAMLparam1(arg1);
GtkTextChildAnchor *obj = gtk_text_child_anchor_new_with_replacement(String_val(arg1));
CAMLreturn(Val_GtkTextChildAnchor(obj));
}

CAMLexport CAMLprim value ml_gtk_text_child_anchor_get_deleted(value self)
{
CAMLparam1(self);

gboolean result = gtk_text_child_anchor_get_deleted(GtkTextChildAnchor_val(self));
CAMLreturn(Val_bool(result));
}
