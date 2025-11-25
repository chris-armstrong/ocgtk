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
#ifndef Val_GtkPicture
#define GtkPicture_val(val) ((GtkPicture*)ext_of_val(val))
#define Val_GtkPicture(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkPicture */


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

CAMLexport CAMLprim value ml_gtk_picture_set_keep_aspect_ratio(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_picture_set_keep_aspect_ratio(GtkPicture_val(self), Bool_val(arg1));
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

CAMLexport CAMLprim value ml_gtk_picture_set_can_shrink(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_picture_set_can_shrink(GtkPicture_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_set_alternative_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_picture_set_alternative_text(GtkPicture_val(self), (Is_some(arg1) ? String_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_picture_get_keep_aspect_ratio(value self)
{
CAMLparam1(self);

gboolean result = gtk_picture_get_keep_aspect_ratio(GtkPicture_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_picture_get_content_fit(value self)
{
CAMLparam1(self);

GtkContentFit result = gtk_picture_get_content_fit(GtkPicture_val(self));
CAMLreturn(Val_GtkContentFit(result));
}

CAMLexport CAMLprim value ml_gtk_picture_get_can_shrink(value self)
{
CAMLparam1(self);

gboolean result = gtk_picture_get_can_shrink(GtkPicture_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_picture_get_alternative_text(value self)
{
CAMLparam1(self);

const char* result = gtk_picture_get_alternative_text(GtkPicture_val(self));
CAMLreturn(caml_copy_string(result));
}
