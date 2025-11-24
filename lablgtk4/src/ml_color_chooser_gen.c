/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ColorChooser */

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

/* Type-specific conversion macros for GtkColorChooser */
#define GtkColorChooser_val(val) ((GtkColorChooser*)ext_of_val(val))
#define Val_GtkColorChooser(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_color_chooser_get_use_alpha(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkColorChooser *obj = (GtkColorChooser *)GtkColorChooser_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-alpha", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_set_use_alpha(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkColorChooser *obj = (GtkColorChooser *)GtkColorChooser_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-alpha", c_value, NULL);
CAMLreturn(Val_unit);
}
