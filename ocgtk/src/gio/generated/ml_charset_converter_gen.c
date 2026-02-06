/* GENERATED CODE - DO NOT EDIT */
/* C bindings for CharsetConverter */

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


CAMLexport CAMLprim value ml_g_charset_converter_set_use_fallback(value self, value arg1)
{
CAMLparam2(self, arg1);

g_charset_converter_set_use_fallback(GCharsetConverter_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_g_charset_converter_get_use_fallback(value self)
{
CAMLparam1(self);

gboolean result = g_charset_converter_get_use_fallback(GCharsetConverter_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_g_charset_converter_get_num_fallbacks(value self)
{
CAMLparam1(self);

guint result = g_charset_converter_get_num_fallbacks(GCharsetConverter_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_g_charset_converter_get_from_charset(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GCharsetConverter *obj = (GCharsetConverter *)GCharsetConverter_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "from-charset");
if (pspec == NULL) caml_failwith("ml_g_charset_converter_get_from_charset: property 'from-charset' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "from-charset", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_g_charset_converter_get_to_charset(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GCharsetConverter *obj = (GCharsetConverter *)GCharsetConverter_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "to-charset");
if (pspec == NULL) caml_failwith("ml_g_charset_converter_get_to_charset: property 'to-charset' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "to-charset", &prop_gvalue);
          prop_value = g_value_get_string(&prop_gvalue);

      result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
