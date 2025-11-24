/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IconPaintable */

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

/* Type-specific conversion macros for GtkIconPaintable */
#define GtkIconPaintable_val(val) ((GtkIconPaintable*)ext_of_val(val))
#define Val_GtkIconPaintable(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_icon_paintable_new_for_file(value arg1, value arg2, value arg3)
{
CAMLparam3(arg1, arg2, arg3);
GtkIconPaintable *obj = gtk_icon_paintable_new_for_file(arg1, Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_GtkIconPaintable(obj));
}

CAMLexport CAMLprim value ml_gtk_icon_paintable_is_symbolic(value self)
{
CAMLparam1(self);


    gboolean result = gtk_icon_paintable_is_symbolic(GtkIconPaintable_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_icon_paintable_get_icon_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconPaintable *obj = (GtkIconPaintable *)GtkIconPaintable_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "icon-name", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_icon_paintable_get_is_symbolic(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkIconPaintable *obj = (GtkIconPaintable *)GtkIconPaintable_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "is-symbolic", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}
