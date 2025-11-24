/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AspectFrame */

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

/* Type-specific conversion macros for GtkAspectFrame */
#define GtkAspectFrame_val(val) ((GtkAspectFrame*)ext_of_val(val))
#define Val_GtkAspectFrame(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_aspect_frame_new(value arg1, value arg2, value arg3, value arg4)
{
CAMLparam4(arg1, arg2, arg3, arg4);
GtkAspectFrame *obj = gtk_aspect_frame_new(Double_val(arg1), Double_val(arg2), Double_val(arg3), Bool_val(arg4));
CAMLreturn(Val_GtkAspectFrame(obj));
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_child(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_aspect_frame_set_child(GtkAspectFrame_val(self), GtkWidget_option_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_child(value self)
{
CAMLparam1(self);


    GtkWidget* result = gtk_aspect_frame_get_child(GtkAspectFrame_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_obey_child(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "obey-child", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_obey_child(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "obey-child", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_ratio(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "ratio", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_ratio(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "ratio", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_xalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "xalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_xalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "xalign", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_get_yalign(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
gfloat prop_value;
g_object_get(G_OBJECT(obj), "yalign", &prop_value, NULL);
result = caml_copy_double(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_aspect_frame_set_yalign(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkAspectFrame *obj = (GtkAspectFrame *)GtkAspectFrame_val(self);
gfloat c_value = Double_val(new_value);
g_object_set(G_OBJECT(obj), "yalign", c_value, NULL);
CAMLreturn(Val_unit);
}
