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


CAMLexport CAMLprim value ml_gtk_color_chooser_set_rgba(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_color_chooser_set_rgba(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_get_rgba(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_color_chooser_get_rgba(GtkWidget_val(self), arg1);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_add_palette(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gtk_color_chooser_add_palette(GtkWidget_val(self), GtkOrientation_val(arg1), Int_val(arg2), Int_val(arg3), arg4);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_get_use_alpha(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "use-alpha", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_color_chooser_set_use_alpha(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkWidget *obj = (GtkWidget *)GtkWidget_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "use-alpha", c_value, NULL);
CAMLreturn(Val_unit);
}
