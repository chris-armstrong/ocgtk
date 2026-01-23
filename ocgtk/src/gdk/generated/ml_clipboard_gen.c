/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Clipboard */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gdk_clipboard_set_texture(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_clipboard_set_texture(GdkClipboard_val(self), GdkTexture_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_clipboard_set_text(value self, value arg1)
{
CAMLparam2(self, arg1);

gdk_clipboard_set_text(GdkClipboard_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gdk_clipboard_set_content(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gdk_clipboard_set_content(GdkClipboard_val(self), Option_val(arg1, GdkContentProvider_val, NULL));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_clipboard_is_local(value self)
{
CAMLparam1(self);

gboolean result = gdk_clipboard_is_local(GdkClipboard_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gdk_clipboard_get_formats(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_clipboard_get_formats(GdkClipboard_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_clipboard_get_display(value self)
{
CAMLparam1(self);

GdkDisplay* result = gdk_clipboard_get_display(GdkClipboard_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GdkDisplay(result));
}

CAMLexport CAMLprim value ml_gdk_clipboard_get_content(value self)
{
CAMLparam1(self);

GdkContentProvider* result = gdk_clipboard_get_content(GdkClipboard_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkContentProvider));
}

CAMLexport CAMLprim value ml_gtk_clipboard_get_local(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GdkClipboard *obj = (GdkClipboard *)GdkClipboard_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "local");
if (pspec == NULL) caml_failwith("ml_gtk_clipboard_get_local: property 'local' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "local", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
