/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AppChooser */

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

/* Type-specific conversion macros for GtkAppChooser */
#define GtkAppChooser_val(val) ((GtkAppChooser*)ext_of_val(val))
#define Val_GtkAppChooser(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_app_chooser_refresh(value self)
{
CAMLparam1(self);


    gtk_app_chooser_refresh(GtkAppChooser_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_app_chooser_get_content_type(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAppChooser *obj = (GtkAppChooser *)GtkAppChooser_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "content-type", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}
