/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Picture */

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

/* Type-specific conversion macros for GtkPicture */
#define GtkPicture_val(val) ((GtkPicture*)ext_of_val(val))
#define Val_GtkPicture(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_picture_new(value unit)
{
CAMLparam1(unit);
GtkPicture *obj = gtk_picture_new();
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_file(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_file(arg1);
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_filename(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_filename((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_paintable(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_paintable(arg1);
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_pixbuf(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_pixbuf(arg1);
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_new_for_resource(value arg1)
{
CAMLparam1(arg1);
GtkPicture *obj = gtk_picture_new_for_resource((Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkPicture(obj));
}

CAMLexport CAMLprim value ml_gtk_picture_set_resource(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_picture_set_resource(GtkPicture_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_set_filename(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_picture_set_filename(GtkPicture_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_set_content_fit(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_picture_set_content_fit(GtkPicture_val(self), GtkContentFit_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_get_content_fit(value self)
{
CAMLparam1(self);


    GtkContentFit result = gtk_picture_get_content_fit(GtkPicture_val(self));
CAMLreturn(Val_GtkContentFit(result));
}

CAMLexport CAMLprim value ml_gtk_picture_get_alternative_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "alternative-text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_picture_set_alternative_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "alternative-text", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_get_can_shrink(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-shrink", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_picture_set_can_shrink(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "can-shrink", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_get_keep_aspect_ratio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "keep-aspect-ratio", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_picture_set_keep_aspect_ratio(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkPicture *obj = (GtkPicture *)GtkPicture_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "keep-aspect-ratio", c_value, NULL);
CAMLreturn(Val_unit);
}
