/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ThemedIcon */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_g_themed_icon_new(value arg1)
{
CAMLparam1(arg1);
GThemedIcon *obj = g_themed_icon_new(String_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GThemedIcon(obj));
}

CAMLexport CAMLprim value ml_g_themed_icon_new_from_names(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GThemedIcon *obj = g_themed_icon_new_from_names(arg1, Int_val(arg2));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GThemedIcon(obj));
}

CAMLexport CAMLprim value ml_g_themed_icon_new_with_default_fallbacks(value arg1)
{
CAMLparam1(arg1);
GThemedIcon *obj = g_themed_icon_new_with_default_fallbacks(String_val(arg1));
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GThemedIcon(obj));
}

CAMLexport CAMLprim value ml_g_themed_icon_prepend_name(value self, value arg1)
{
CAMLparam2(self, arg1);

g_themed_icon_prepend_name(GThemedIcon_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_themed_icon_append_name(value self, value arg1)
{
CAMLparam2(self, arg1);

g_themed_icon_append_name(GThemedIcon_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_themed_icon_get_name(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GThemedIcon *obj = (GThemedIcon *)GThemedIcon_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "name");
if (pspec == NULL) caml_failwith("ml_gtk_themed_icon_get_name: property 'name' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "name", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_themed_icon_get_use_default_fallbacks(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GThemedIcon *obj = (GThemedIcon *)GThemedIcon_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "use-default-fallbacks");
if (pspec == NULL) caml_failwith("ml_gtk_themed_icon_get_use_default_fallbacks: property 'use-default-fallbacks' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "use-default-fallbacks", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}
