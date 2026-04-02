/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EmblemedIcon */

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
/* Include library-specific type conversions and forward declarations */
#include "gio_decls.h"


#if GLIB_CHECK_VERSION(2,18,0)

CAMLexport CAMLprim value ml_g_emblemed_icon_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);

GEmblemedIcon *obj = g_emblemed_icon_new(GIcon_val(arg1), Option_val(arg2, GEmblem_val, NULL));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GEmblemedIcon(obj));
}
#else

CAMLexport CAMLprim value ml_g_emblemed_icon_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
(void)arg1;
(void)arg2;
caml_failwith("EmblemedIcon requires GLib >= 2.18");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,18,0)

CAMLexport CAMLprim value ml_g_emblemed_icon_get_icon(value self)
{
CAMLparam1(self);

GIcon* result = g_emblemed_icon_get_icon(GEmblemedIcon_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_GIcon(result));
}

#else

CAMLexport CAMLprim value ml_g_emblemed_icon_get_icon(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("EmblemedIcon requires GLib >= 2.18");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,18,0)

CAMLexport CAMLprim value ml_g_emblemed_icon_get_emblems(value self)
{
CAMLparam1(self);

CAMLlocal3(result, item, cell);
    GList* c_result = g_emblemed_icon_get_emblems(GEmblemedIcon_val(self));
Val_GList_with(c_result, result, item, cell, Val_GEmblem((gpointer)_tmp->data));
    g_list_free(c_result);
    CAMLreturn(result);
}

#else

CAMLexport CAMLprim value ml_g_emblemed_icon_get_emblems(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("EmblemedIcon requires GLib >= 2.18");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,28,0)

CAMLexport CAMLprim value ml_g_emblemed_icon_clear_emblems(value self)
{
CAMLparam1(self);

g_emblemed_icon_clear_emblems(GEmblemedIcon_val(self));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_emblemed_icon_clear_emblems(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("EmblemedIcon requires GLib >= 2.28");
return Val_unit;
}
#endif

#if GLIB_CHECK_VERSION(2,18,0)

CAMLexport CAMLprim value ml_g_emblemed_icon_add_emblem(value self, value arg1)
{
CAMLparam2(self, arg1);

g_emblemed_icon_add_emblem(GEmblemedIcon_val(self), GEmblem_val(arg1));
CAMLreturn(Val_unit);
}

#else

CAMLexport CAMLprim value ml_g_emblemed_icon_add_emblem(value self, value arg1)
{
CAMLparam2(self, arg1);
(void)self;
(void)arg1;
caml_failwith("EmblemedIcon requires GLib >= 2.18");
return Val_unit;
}
#endif
