/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorChooserDialog */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkColorChooserDialog */
#ifndef Val_GtkColorChooserDialog
#define GtkColorChooserDialog_val(val) ((GtkColorChooserDialog*)ext_of_val(val))
#define Val_GtkColorChooserDialog(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkColorChooserDialog */


CAMLexport CAMLprim value ml_gtk_color_chooser_dialog_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkColorChooserDialog *obj = gtk_color_chooser_dialog_new(String_option_val(arg1), Option_val(arg2, GtkWindow_val, NULL));
CAMLreturn(Val_GtkColorChooserDialog(obj));
}

CAMLexport CAMLprim value ml_gtk_color_chooser_dialog_get_show_editor(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
gboolean *obj = (gboolean *)GtkColorChooserDialog_val(self);
    gboolean prop_value;
g_object_get(G_OBJECT(obj), "show-editor", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_dialog_set_show_editor(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkColorChooserDialog *obj = (GtkColorChooserDialog *)GtkColorChooserDialog_val(self);
    gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "show-editor", c_value, NULL);
CAMLreturn(Val_unit);
}
