/* GENERATED CODE - DO NOT EDIT */
/* Gio enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <glib.h>
#include <gio/gio.h>
/* Convert GBusType to OCaml value */
value Val_GioBusType(GBusType val) {
  switch (val) {
    case G_BUS_TYPE_STARTER: return caml_hash_variant("STARTER"); /* `STARTER */
    case G_BUS_TYPE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case G_BUS_TYPE_SYSTEM: return caml_hash_variant("SYSTEM"); /* `SYSTEM */
    case G_BUS_TYPE_SESSION: return caml_hash_variant("SESSION"); /* `SESSION */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GBusType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GBusType */
GBusType GioBusType_val(value val) {
  if (val == caml_hash_variant("STARTER")) return G_BUS_TYPE_STARTER; /* `STARTER */
  else if (val == caml_hash_variant("NONE")) return G_BUS_TYPE_NONE; /* `NONE */
  else if (val == caml_hash_variant("SYSTEM")) return G_BUS_TYPE_SYSTEM; /* `SYSTEM */
  else if (val == caml_hash_variant("SESSION")) return G_BUS_TYPE_SESSION; /* `SESSION */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GBusType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GConverterResult to OCaml value */
value Val_GioConverterResult(GConverterResult val) {
  switch (val) {
    case G_CONVERTER_ERROR: return caml_hash_variant("ERROR"); /* `ERROR */
    case G_CONVERTER_CONVERTED: return caml_hash_variant("CONVERTED"); /* `CONVERTED */
    case G_CONVERTER_FINISHED: return caml_hash_variant("FINISHED"); /* `FINISHED */
    case G_CONVERTER_FLUSHED: return caml_hash_variant("FLUSHED"); /* `FLUSHED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GConverterResult value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GConverterResult */
GConverterResult GioConverterResult_val(value val) {
  if (val == caml_hash_variant("ERROR")) return G_CONVERTER_ERROR; /* `ERROR */
  else if (val == caml_hash_variant("CONVERTED")) return G_CONVERTER_CONVERTED; /* `CONVERTED */
  else if (val == caml_hash_variant("FINISHED")) return G_CONVERTER_FINISHED; /* `FINISHED */
  else if (val == caml_hash_variant("FLUSHED")) return G_CONVERTER_FLUSHED; /* `FLUSHED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GConverterResult tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GCredentialsType to OCaml value */
value Val_GioCredentialsType(GCredentialsType val) {
  switch (val) {
    case G_CREDENTIALS_TYPE_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case G_CREDENTIALS_TYPE_LINUX_UCRED: return caml_hash_variant("LINUX_UCRED"); /* `LINUX_UCRED */
    case G_CREDENTIALS_TYPE_FREEBSD_CMSGCRED: return caml_hash_variant("FREEBSD_CMSGCRED"); /* `FREEBSD_CMSGCRED */
    case G_CREDENTIALS_TYPE_OPENBSD_SOCKPEERCRED: return caml_hash_variant("OPENBSD_SOCKPEERCRED"); /* `OPENBSD_SOCKPEERCRED */
    case G_CREDENTIALS_TYPE_SOLARIS_UCRED: return caml_hash_variant("SOLARIS_UCRED"); /* `SOLARIS_UCRED */
    case G_CREDENTIALS_TYPE_NETBSD_UNPCBID: return caml_hash_variant("NETBSD_UNPCBID"); /* `NETBSD_UNPCBID */
    case G_CREDENTIALS_TYPE_APPLE_XUCRED: return caml_hash_variant("APPLE_XUCRED"); /* `APPLE_XUCRED */
    case G_CREDENTIALS_TYPE_WIN32_PID: return caml_hash_variant("WIN32_PID"); /* `WIN32_PID */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GCredentialsType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GCredentialsType */
GCredentialsType GioCredentialsType_val(value val) {
  if (val == caml_hash_variant("INVALID")) return G_CREDENTIALS_TYPE_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("LINUX_UCRED")) return G_CREDENTIALS_TYPE_LINUX_UCRED; /* `LINUX_UCRED */
  else if (val == caml_hash_variant("FREEBSD_CMSGCRED")) return G_CREDENTIALS_TYPE_FREEBSD_CMSGCRED; /* `FREEBSD_CMSGCRED */
  else if (val == caml_hash_variant("OPENBSD_SOCKPEERCRED")) return G_CREDENTIALS_TYPE_OPENBSD_SOCKPEERCRED; /* `OPENBSD_SOCKPEERCRED */
  else if (val == caml_hash_variant("SOLARIS_UCRED")) return G_CREDENTIALS_TYPE_SOLARIS_UCRED; /* `SOLARIS_UCRED */
  else if (val == caml_hash_variant("NETBSD_UNPCBID")) return G_CREDENTIALS_TYPE_NETBSD_UNPCBID; /* `NETBSD_UNPCBID */
  else if (val == caml_hash_variant("APPLE_XUCRED")) return G_CREDENTIALS_TYPE_APPLE_XUCRED; /* `APPLE_XUCRED */
  else if (val == caml_hash_variant("WIN32_PID")) return G_CREDENTIALS_TYPE_WIN32_PID; /* `WIN32_PID */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GCredentialsType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GDBusError to OCaml value */
value Val_GioDBusError(GDBusError val) {
  switch (val) {
    case G_DBUS_ERROR_FAILED: return caml_hash_variant("FAILED"); /* `FAILED */
    case G_DBUS_ERROR_NO_MEMORY: return caml_hash_variant("NO_MEMORY"); /* `NO_MEMORY */
    case G_DBUS_ERROR_SERVICE_UNKNOWN: return caml_hash_variant("SERVICE_UNKNOWN"); /* `SERVICE_UNKNOWN */
    case G_DBUS_ERROR_NAME_HAS_NO_OWNER: return caml_hash_variant("NAME_HAS_NO_OWNER"); /* `NAME_HAS_NO_OWNER */
    case G_DBUS_ERROR_NO_REPLY: return caml_hash_variant("NO_REPLY"); /* `NO_REPLY */
    case G_DBUS_ERROR_IO_ERROR: return caml_hash_variant("IO_ERROR"); /* `IO_ERROR */
    case G_DBUS_ERROR_BAD_ADDRESS: return caml_hash_variant("BAD_ADDRESS"); /* `BAD_ADDRESS */
    case G_DBUS_ERROR_NOT_SUPPORTED: return caml_hash_variant("NOT_SUPPORTED"); /* `NOT_SUPPORTED */
    case G_DBUS_ERROR_LIMITS_EXCEEDED: return caml_hash_variant("LIMITS_EXCEEDED"); /* `LIMITS_EXCEEDED */
    case G_DBUS_ERROR_ACCESS_DENIED: return caml_hash_variant("ACCESS_DENIED"); /* `ACCESS_DENIED */
    case G_DBUS_ERROR_AUTH_FAILED: return caml_hash_variant("AUTH_FAILED"); /* `AUTH_FAILED */
    case G_DBUS_ERROR_NO_SERVER: return caml_hash_variant("NO_SERVER"); /* `NO_SERVER */
    case G_DBUS_ERROR_TIMEOUT: return caml_hash_variant("TIMEOUT"); /* `TIMEOUT */
    case G_DBUS_ERROR_NO_NETWORK: return caml_hash_variant("NO_NETWORK"); /* `NO_NETWORK */
    case G_DBUS_ERROR_ADDRESS_IN_USE: return caml_hash_variant("ADDRESS_IN_USE"); /* `ADDRESS_IN_USE */
    case G_DBUS_ERROR_DISCONNECTED: return caml_hash_variant("DISCONNECTED"); /* `DISCONNECTED */
    case G_DBUS_ERROR_INVALID_ARGS: return caml_hash_variant("INVALID_ARGS"); /* `INVALID_ARGS */
    case G_DBUS_ERROR_FILE_NOT_FOUND: return caml_hash_variant("FILE_NOT_FOUND"); /* `FILE_NOT_FOUND */
    case G_DBUS_ERROR_FILE_EXISTS: return caml_hash_variant("FILE_EXISTS"); /* `FILE_EXISTS */
    case G_DBUS_ERROR_UNKNOWN_METHOD: return caml_hash_variant("UNKNOWN_METHOD"); /* `UNKNOWN_METHOD */
    case G_DBUS_ERROR_TIMED_OUT: return caml_hash_variant("TIMED_OUT"); /* `TIMED_OUT */
    case G_DBUS_ERROR_MATCH_RULE_NOT_FOUND: return caml_hash_variant("MATCH_RULE_NOT_FOUND"); /* `MATCH_RULE_NOT_FOUND */
    case G_DBUS_ERROR_MATCH_RULE_INVALID: return caml_hash_variant("MATCH_RULE_INVALID"); /* `MATCH_RULE_INVALID */
    case G_DBUS_ERROR_SPAWN_EXEC_FAILED: return caml_hash_variant("SPAWN_EXEC_FAILED"); /* `SPAWN_EXEC_FAILED */
    case G_DBUS_ERROR_SPAWN_FORK_FAILED: return caml_hash_variant("SPAWN_FORK_FAILED"); /* `SPAWN_FORK_FAILED */
    case G_DBUS_ERROR_SPAWN_CHILD_EXITED: return caml_hash_variant("SPAWN_CHILD_EXITED"); /* `SPAWN_CHILD_EXITED */
    case G_DBUS_ERROR_SPAWN_CHILD_SIGNALED: return caml_hash_variant("SPAWN_CHILD_SIGNALED"); /* `SPAWN_CHILD_SIGNALED */
    case G_DBUS_ERROR_SPAWN_FAILED: return caml_hash_variant("SPAWN_FAILED"); /* `SPAWN_FAILED */
    case G_DBUS_ERROR_SPAWN_SETUP_FAILED: return caml_hash_variant("SPAWN_SETUP_FAILED"); /* `SPAWN_SETUP_FAILED */
    case G_DBUS_ERROR_SPAWN_CONFIG_INVALID: return caml_hash_variant("SPAWN_CONFIG_INVALID"); /* `SPAWN_CONFIG_INVALID */
    case G_DBUS_ERROR_SPAWN_SERVICE_INVALID: return caml_hash_variant("SPAWN_SERVICE_INVALID"); /* `SPAWN_SERVICE_INVALID */
    case G_DBUS_ERROR_SPAWN_SERVICE_NOT_FOUND: return caml_hash_variant("SPAWN_SERVICE_NOT_FOUND"); /* `SPAWN_SERVICE_NOT_FOUND */
    case G_DBUS_ERROR_SPAWN_PERMISSIONS_INVALID: return caml_hash_variant("SPAWN_PERMISSIONS_INVALID"); /* `SPAWN_PERMISSIONS_INVALID */
    case G_DBUS_ERROR_SPAWN_FILE_INVALID: return caml_hash_variant("SPAWN_FILE_INVALID"); /* `SPAWN_FILE_INVALID */
    case G_DBUS_ERROR_SPAWN_NO_MEMORY: return caml_hash_variant("SPAWN_NO_MEMORY"); /* `SPAWN_NO_MEMORY */
    case G_DBUS_ERROR_UNIX_PROCESS_ID_UNKNOWN: return caml_hash_variant("UNIX_PROCESS_ID_UNKNOWN"); /* `UNIX_PROCESS_ID_UNKNOWN */
    case G_DBUS_ERROR_INVALID_SIGNATURE: return caml_hash_variant("INVALID_SIGNATURE"); /* `INVALID_SIGNATURE */
    case G_DBUS_ERROR_INVALID_FILE_CONTENT: return caml_hash_variant("INVALID_FILE_CONTENT"); /* `INVALID_FILE_CONTENT */
    case G_DBUS_ERROR_SELINUX_SECURITY_CONTEXT_UNKNOWN: return caml_hash_variant("SELINUX_SECURITY_CONTEXT_UNKNOWN"); /* `SELINUX_SECURITY_CONTEXT_UNKNOWN */
    case G_DBUS_ERROR_ADT_AUDIT_DATA_UNKNOWN: return caml_hash_variant("ADT_AUDIT_DATA_UNKNOWN"); /* `ADT_AUDIT_DATA_UNKNOWN */
    case G_DBUS_ERROR_OBJECT_PATH_IN_USE: return caml_hash_variant("OBJECT_PATH_IN_USE"); /* `OBJECT_PATH_IN_USE */
    case G_DBUS_ERROR_UNKNOWN_OBJECT: return caml_hash_variant("UNKNOWN_OBJECT"); /* `UNKNOWN_OBJECT */
    case G_DBUS_ERROR_UNKNOWN_INTERFACE: return caml_hash_variant("UNKNOWN_INTERFACE"); /* `UNKNOWN_INTERFACE */
    case G_DBUS_ERROR_UNKNOWN_PROPERTY: return caml_hash_variant("UNKNOWN_PROPERTY"); /* `UNKNOWN_PROPERTY */
    case G_DBUS_ERROR_PROPERTY_READ_ONLY: return caml_hash_variant("PROPERTY_READ_ONLY"); /* `PROPERTY_READ_ONLY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GDBusError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GDBusError */
GDBusError GioDBusError_val(value val) {
  if (val == caml_hash_variant("FAILED")) return G_DBUS_ERROR_FAILED; /* `FAILED */
  else if (val == caml_hash_variant("NO_MEMORY")) return G_DBUS_ERROR_NO_MEMORY; /* `NO_MEMORY */
  else if (val == caml_hash_variant("SERVICE_UNKNOWN")) return G_DBUS_ERROR_SERVICE_UNKNOWN; /* `SERVICE_UNKNOWN */
  else if (val == caml_hash_variant("NAME_HAS_NO_OWNER")) return G_DBUS_ERROR_NAME_HAS_NO_OWNER; /* `NAME_HAS_NO_OWNER */
  else if (val == caml_hash_variant("NO_REPLY")) return G_DBUS_ERROR_NO_REPLY; /* `NO_REPLY */
  else if (val == caml_hash_variant("IO_ERROR")) return G_DBUS_ERROR_IO_ERROR; /* `IO_ERROR */
  else if (val == caml_hash_variant("BAD_ADDRESS")) return G_DBUS_ERROR_BAD_ADDRESS; /* `BAD_ADDRESS */
  else if (val == caml_hash_variant("NOT_SUPPORTED")) return G_DBUS_ERROR_NOT_SUPPORTED; /* `NOT_SUPPORTED */
  else if (val == caml_hash_variant("LIMITS_EXCEEDED")) return G_DBUS_ERROR_LIMITS_EXCEEDED; /* `LIMITS_EXCEEDED */
  else if (val == caml_hash_variant("ACCESS_DENIED")) return G_DBUS_ERROR_ACCESS_DENIED; /* `ACCESS_DENIED */
  else if (val == caml_hash_variant("AUTH_FAILED")) return G_DBUS_ERROR_AUTH_FAILED; /* `AUTH_FAILED */
  else if (val == caml_hash_variant("NO_SERVER")) return G_DBUS_ERROR_NO_SERVER; /* `NO_SERVER */
  else if (val == caml_hash_variant("TIMEOUT")) return G_DBUS_ERROR_TIMEOUT; /* `TIMEOUT */
  else if (val == caml_hash_variant("NO_NETWORK")) return G_DBUS_ERROR_NO_NETWORK; /* `NO_NETWORK */
  else if (val == caml_hash_variant("ADDRESS_IN_USE")) return G_DBUS_ERROR_ADDRESS_IN_USE; /* `ADDRESS_IN_USE */
  else if (val == caml_hash_variant("DISCONNECTED")) return G_DBUS_ERROR_DISCONNECTED; /* `DISCONNECTED */
  else if (val == caml_hash_variant("INVALID_ARGS")) return G_DBUS_ERROR_INVALID_ARGS; /* `INVALID_ARGS */
  else if (val == caml_hash_variant("FILE_NOT_FOUND")) return G_DBUS_ERROR_FILE_NOT_FOUND; /* `FILE_NOT_FOUND */
  else if (val == caml_hash_variant("FILE_EXISTS")) return G_DBUS_ERROR_FILE_EXISTS; /* `FILE_EXISTS */
  else if (val == caml_hash_variant("UNKNOWN_METHOD")) return G_DBUS_ERROR_UNKNOWN_METHOD; /* `UNKNOWN_METHOD */
  else if (val == caml_hash_variant("TIMED_OUT")) return G_DBUS_ERROR_TIMED_OUT; /* `TIMED_OUT */
  else if (val == caml_hash_variant("MATCH_RULE_NOT_FOUND")) return G_DBUS_ERROR_MATCH_RULE_NOT_FOUND; /* `MATCH_RULE_NOT_FOUND */
  else if (val == caml_hash_variant("MATCH_RULE_INVALID")) return G_DBUS_ERROR_MATCH_RULE_INVALID; /* `MATCH_RULE_INVALID */
  else if (val == caml_hash_variant("SPAWN_EXEC_FAILED")) return G_DBUS_ERROR_SPAWN_EXEC_FAILED; /* `SPAWN_EXEC_FAILED */
  else if (val == caml_hash_variant("SPAWN_FORK_FAILED")) return G_DBUS_ERROR_SPAWN_FORK_FAILED; /* `SPAWN_FORK_FAILED */
  else if (val == caml_hash_variant("SPAWN_CHILD_EXITED")) return G_DBUS_ERROR_SPAWN_CHILD_EXITED; /* `SPAWN_CHILD_EXITED */
  else if (val == caml_hash_variant("SPAWN_CHILD_SIGNALED")) return G_DBUS_ERROR_SPAWN_CHILD_SIGNALED; /* `SPAWN_CHILD_SIGNALED */
  else if (val == caml_hash_variant("SPAWN_FAILED")) return G_DBUS_ERROR_SPAWN_FAILED; /* `SPAWN_FAILED */
  else if (val == caml_hash_variant("SPAWN_SETUP_FAILED")) return G_DBUS_ERROR_SPAWN_SETUP_FAILED; /* `SPAWN_SETUP_FAILED */
  else if (val == caml_hash_variant("SPAWN_CONFIG_INVALID")) return G_DBUS_ERROR_SPAWN_CONFIG_INVALID; /* `SPAWN_CONFIG_INVALID */
  else if (val == caml_hash_variant("SPAWN_SERVICE_INVALID")) return G_DBUS_ERROR_SPAWN_SERVICE_INVALID; /* `SPAWN_SERVICE_INVALID */
  else if (val == caml_hash_variant("SPAWN_SERVICE_NOT_FOUND")) return G_DBUS_ERROR_SPAWN_SERVICE_NOT_FOUND; /* `SPAWN_SERVICE_NOT_FOUND */
  else if (val == caml_hash_variant("SPAWN_PERMISSIONS_INVALID")) return G_DBUS_ERROR_SPAWN_PERMISSIONS_INVALID; /* `SPAWN_PERMISSIONS_INVALID */
  else if (val == caml_hash_variant("SPAWN_FILE_INVALID")) return G_DBUS_ERROR_SPAWN_FILE_INVALID; /* `SPAWN_FILE_INVALID */
  else if (val == caml_hash_variant("SPAWN_NO_MEMORY")) return G_DBUS_ERROR_SPAWN_NO_MEMORY; /* `SPAWN_NO_MEMORY */
  else if (val == caml_hash_variant("UNIX_PROCESS_ID_UNKNOWN")) return G_DBUS_ERROR_UNIX_PROCESS_ID_UNKNOWN; /* `UNIX_PROCESS_ID_UNKNOWN */
  else if (val == caml_hash_variant("INVALID_SIGNATURE")) return G_DBUS_ERROR_INVALID_SIGNATURE; /* `INVALID_SIGNATURE */
  else if (val == caml_hash_variant("INVALID_FILE_CONTENT")) return G_DBUS_ERROR_INVALID_FILE_CONTENT; /* `INVALID_FILE_CONTENT */
  else if (val == caml_hash_variant("SELINUX_SECURITY_CONTEXT_UNKNOWN")) return G_DBUS_ERROR_SELINUX_SECURITY_CONTEXT_UNKNOWN; /* `SELINUX_SECURITY_CONTEXT_UNKNOWN */
  else if (val == caml_hash_variant("ADT_AUDIT_DATA_UNKNOWN")) return G_DBUS_ERROR_ADT_AUDIT_DATA_UNKNOWN; /* `ADT_AUDIT_DATA_UNKNOWN */
  else if (val == caml_hash_variant("OBJECT_PATH_IN_USE")) return G_DBUS_ERROR_OBJECT_PATH_IN_USE; /* `OBJECT_PATH_IN_USE */
  else if (val == caml_hash_variant("UNKNOWN_OBJECT")) return G_DBUS_ERROR_UNKNOWN_OBJECT; /* `UNKNOWN_OBJECT */
  else if (val == caml_hash_variant("UNKNOWN_INTERFACE")) return G_DBUS_ERROR_UNKNOWN_INTERFACE; /* `UNKNOWN_INTERFACE */
  else if (val == caml_hash_variant("UNKNOWN_PROPERTY")) return G_DBUS_ERROR_UNKNOWN_PROPERTY; /* `UNKNOWN_PROPERTY */
  else if (val == caml_hash_variant("PROPERTY_READ_ONLY")) return G_DBUS_ERROR_PROPERTY_READ_ONLY; /* `PROPERTY_READ_ONLY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GDBusError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GDBusMessageByteOrder to OCaml value */
value Val_GioDBusMessageByteOrder(GDBusMessageByteOrder val) {
  switch (val) {
    case G_DBUS_MESSAGE_BYTE_ORDER_BIG_ENDIAN: return caml_hash_variant("BIG_ENDIAN"); /* `BIG_ENDIAN */
    case G_DBUS_MESSAGE_BYTE_ORDER_LITTLE_ENDIAN: return caml_hash_variant("LITTLE_ENDIAN"); /* `LITTLE_ENDIAN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GDBusMessageByteOrder value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GDBusMessageByteOrder */
GDBusMessageByteOrder GioDBusMessageByteOrder_val(value val) {
  if (val == caml_hash_variant("BIG_ENDIAN")) return G_DBUS_MESSAGE_BYTE_ORDER_BIG_ENDIAN; /* `BIG_ENDIAN */
  else if (val == caml_hash_variant("LITTLE_ENDIAN")) return G_DBUS_MESSAGE_BYTE_ORDER_LITTLE_ENDIAN; /* `LITTLE_ENDIAN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GDBusMessageByteOrder tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GDBusMessageHeaderField to OCaml value */
value Val_GioDBusMessageHeaderField(GDBusMessageHeaderField val) {
  switch (val) {
    case G_DBUS_MESSAGE_HEADER_FIELD_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case G_DBUS_MESSAGE_HEADER_FIELD_PATH: return caml_hash_variant("PATH"); /* `PATH */
    case G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE: return caml_hash_variant("INTERFACE"); /* `INTERFACE */
    case G_DBUS_MESSAGE_HEADER_FIELD_MEMBER: return caml_hash_variant("MEMBER"); /* `MEMBER */
    case G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME: return caml_hash_variant("ERROR_NAME"); /* `ERROR_NAME */
    case G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL: return caml_hash_variant("REPLY_SERIAL"); /* `REPLY_SERIAL */
    case G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION: return caml_hash_variant("DESTINATION"); /* `DESTINATION */
    case G_DBUS_MESSAGE_HEADER_FIELD_SENDER: return caml_hash_variant("SENDER"); /* `SENDER */
    case G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE: return caml_hash_variant("SIGNATURE"); /* `SIGNATURE */
    case G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS: return caml_hash_variant("NUM_UNIX_FDS"); /* `NUM_UNIX_FDS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GDBusMessageHeaderField value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GDBusMessageHeaderField */
GDBusMessageHeaderField GioDBusMessageHeaderField_val(value val) {
  if (val == caml_hash_variant("INVALID")) return G_DBUS_MESSAGE_HEADER_FIELD_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("PATH")) return G_DBUS_MESSAGE_HEADER_FIELD_PATH; /* `PATH */
  else if (val == caml_hash_variant("INTERFACE")) return G_DBUS_MESSAGE_HEADER_FIELD_INTERFACE; /* `INTERFACE */
  else if (val == caml_hash_variant("MEMBER")) return G_DBUS_MESSAGE_HEADER_FIELD_MEMBER; /* `MEMBER */
  else if (val == caml_hash_variant("ERROR_NAME")) return G_DBUS_MESSAGE_HEADER_FIELD_ERROR_NAME; /* `ERROR_NAME */
  else if (val == caml_hash_variant("REPLY_SERIAL")) return G_DBUS_MESSAGE_HEADER_FIELD_REPLY_SERIAL; /* `REPLY_SERIAL */
  else if (val == caml_hash_variant("DESTINATION")) return G_DBUS_MESSAGE_HEADER_FIELD_DESTINATION; /* `DESTINATION */
  else if (val == caml_hash_variant("SENDER")) return G_DBUS_MESSAGE_HEADER_FIELD_SENDER; /* `SENDER */
  else if (val == caml_hash_variant("SIGNATURE")) return G_DBUS_MESSAGE_HEADER_FIELD_SIGNATURE; /* `SIGNATURE */
  else if (val == caml_hash_variant("NUM_UNIX_FDS")) return G_DBUS_MESSAGE_HEADER_FIELD_NUM_UNIX_FDS; /* `NUM_UNIX_FDS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GDBusMessageHeaderField tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GDBusMessageType to OCaml value */
value Val_GioDBusMessageType(GDBusMessageType val) {
  switch (val) {
    case G_DBUS_MESSAGE_TYPE_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case G_DBUS_MESSAGE_TYPE_METHOD_CALL: return caml_hash_variant("METHOD_CALL"); /* `METHOD_CALL */
    case G_DBUS_MESSAGE_TYPE_METHOD_RETURN: return caml_hash_variant("METHOD_RETURN"); /* `METHOD_RETURN */
    case G_DBUS_MESSAGE_TYPE_ERROR: return caml_hash_variant("ERROR"); /* `ERROR */
    case G_DBUS_MESSAGE_TYPE_SIGNAL: return caml_hash_variant("SIGNAL"); /* `SIGNAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GDBusMessageType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GDBusMessageType */
GDBusMessageType GioDBusMessageType_val(value val) {
  if (val == caml_hash_variant("INVALID")) return G_DBUS_MESSAGE_TYPE_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("METHOD_CALL")) return G_DBUS_MESSAGE_TYPE_METHOD_CALL; /* `METHOD_CALL */
  else if (val == caml_hash_variant("METHOD_RETURN")) return G_DBUS_MESSAGE_TYPE_METHOD_RETURN; /* `METHOD_RETURN */
  else if (val == caml_hash_variant("ERROR")) return G_DBUS_MESSAGE_TYPE_ERROR; /* `ERROR */
  else if (val == caml_hash_variant("SIGNAL")) return G_DBUS_MESSAGE_TYPE_SIGNAL; /* `SIGNAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GDBusMessageType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GDataStreamByteOrder to OCaml value */
value Val_GioDataStreamByteOrder(GDataStreamByteOrder val) {
  switch (val) {
    case G_DATA_STREAM_BYTE_ORDER_BIG_ENDIAN: return caml_hash_variant("BIG_ENDIAN"); /* `BIG_ENDIAN */
    case G_DATA_STREAM_BYTE_ORDER_LITTLE_ENDIAN: return caml_hash_variant("LITTLE_ENDIAN"); /* `LITTLE_ENDIAN */
    case G_DATA_STREAM_BYTE_ORDER_HOST_ENDIAN: return caml_hash_variant("HOST_ENDIAN"); /* `HOST_ENDIAN */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GDataStreamByteOrder value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GDataStreamByteOrder */
GDataStreamByteOrder GioDataStreamByteOrder_val(value val) {
  if (val == caml_hash_variant("BIG_ENDIAN")) return G_DATA_STREAM_BYTE_ORDER_BIG_ENDIAN; /* `BIG_ENDIAN */
  else if (val == caml_hash_variant("LITTLE_ENDIAN")) return G_DATA_STREAM_BYTE_ORDER_LITTLE_ENDIAN; /* `LITTLE_ENDIAN */
  else if (val == caml_hash_variant("HOST_ENDIAN")) return G_DATA_STREAM_BYTE_ORDER_HOST_ENDIAN; /* `HOST_ENDIAN */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GDataStreamByteOrder tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GDataStreamNewlineType to OCaml value */
value Val_GioDataStreamNewlineType(GDataStreamNewlineType val) {
  switch (val) {
    case G_DATA_STREAM_NEWLINE_TYPE_LF: return caml_hash_variant("LF"); /* `LF */
    case G_DATA_STREAM_NEWLINE_TYPE_CR: return caml_hash_variant("CR"); /* `CR */
    case G_DATA_STREAM_NEWLINE_TYPE_CR_LF: return caml_hash_variant("CR_LF"); /* `CR_LF */
    case G_DATA_STREAM_NEWLINE_TYPE_ANY: return caml_hash_variant("ANY"); /* `ANY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GDataStreamNewlineType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GDataStreamNewlineType */
GDataStreamNewlineType GioDataStreamNewlineType_val(value val) {
  if (val == caml_hash_variant("LF")) return G_DATA_STREAM_NEWLINE_TYPE_LF; /* `LF */
  else if (val == caml_hash_variant("CR")) return G_DATA_STREAM_NEWLINE_TYPE_CR; /* `CR */
  else if (val == caml_hash_variant("CR_LF")) return G_DATA_STREAM_NEWLINE_TYPE_CR_LF; /* `CR_LF */
  else if (val == caml_hash_variant("ANY")) return G_DATA_STREAM_NEWLINE_TYPE_ANY; /* `ANY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GDataStreamNewlineType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GDriveStartStopType to OCaml value */
value Val_GioDriveStartStopType(GDriveStartStopType val) {
  switch (val) {
    case G_DRIVE_START_STOP_TYPE_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case G_DRIVE_START_STOP_TYPE_SHUTDOWN: return caml_hash_variant("SHUTDOWN"); /* `SHUTDOWN */
    case G_DRIVE_START_STOP_TYPE_NETWORK: return caml_hash_variant("NETWORK"); /* `NETWORK */
    case G_DRIVE_START_STOP_TYPE_MULTIDISK: return caml_hash_variant("MULTIDISK"); /* `MULTIDISK */
    case G_DRIVE_START_STOP_TYPE_PASSWORD: return caml_hash_variant("PASSWORD"); /* `PASSWORD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GDriveStartStopType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GDriveStartStopType */
GDriveStartStopType GioDriveStartStopType_val(value val) {
  if (val == caml_hash_variant("UNKNOWN")) return G_DRIVE_START_STOP_TYPE_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("SHUTDOWN")) return G_DRIVE_START_STOP_TYPE_SHUTDOWN; /* `SHUTDOWN */
  else if (val == caml_hash_variant("NETWORK")) return G_DRIVE_START_STOP_TYPE_NETWORK; /* `NETWORK */
  else if (val == caml_hash_variant("MULTIDISK")) return G_DRIVE_START_STOP_TYPE_MULTIDISK; /* `MULTIDISK */
  else if (val == caml_hash_variant("PASSWORD")) return G_DRIVE_START_STOP_TYPE_PASSWORD; /* `PASSWORD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GDriveStartStopType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GEmblemOrigin to OCaml value */
value Val_GioEmblemOrigin(GEmblemOrigin val) {
  switch (val) {
    case G_EMBLEM_ORIGIN_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case G_EMBLEM_ORIGIN_DEVICE: return caml_hash_variant("DEVICE"); /* `DEVICE */
    case G_EMBLEM_ORIGIN_LIVEMETADATA: return caml_hash_variant("LIVEMETADATA"); /* `LIVEMETADATA */
    case G_EMBLEM_ORIGIN_TAG: return caml_hash_variant("TAG"); /* `TAG */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GEmblemOrigin value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GEmblemOrigin */
GEmblemOrigin GioEmblemOrigin_val(value val) {
  if (val == caml_hash_variant("UNKNOWN")) return G_EMBLEM_ORIGIN_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("DEVICE")) return G_EMBLEM_ORIGIN_DEVICE; /* `DEVICE */
  else if (val == caml_hash_variant("LIVEMETADATA")) return G_EMBLEM_ORIGIN_LIVEMETADATA; /* `LIVEMETADATA */
  else if (val == caml_hash_variant("TAG")) return G_EMBLEM_ORIGIN_TAG; /* `TAG */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GEmblemOrigin tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GFileAttributeStatus to OCaml value */
value Val_GioFileAttributeStatus(GFileAttributeStatus val) {
  switch (val) {
    case G_FILE_ATTRIBUTE_STATUS_UNSET: return caml_hash_variant("UNSET"); /* `UNSET */
    case G_FILE_ATTRIBUTE_STATUS_SET: return caml_hash_variant("SET"); /* `SET */
    case G_FILE_ATTRIBUTE_STATUS_ERROR_SETTING: return caml_hash_variant("ERROR_SETTING"); /* `ERROR_SETTING */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GFileAttributeStatus value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GFileAttributeStatus */
GFileAttributeStatus GioFileAttributeStatus_val(value val) {
  if (val == caml_hash_variant("UNSET")) return G_FILE_ATTRIBUTE_STATUS_UNSET; /* `UNSET */
  else if (val == caml_hash_variant("SET")) return G_FILE_ATTRIBUTE_STATUS_SET; /* `SET */
  else if (val == caml_hash_variant("ERROR_SETTING")) return G_FILE_ATTRIBUTE_STATUS_ERROR_SETTING; /* `ERROR_SETTING */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GFileAttributeStatus tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GFileAttributeType to OCaml value */
value Val_GioFileAttributeType(GFileAttributeType val) {
  switch (val) {
    case G_FILE_ATTRIBUTE_TYPE_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case G_FILE_ATTRIBUTE_TYPE_STRING: return caml_hash_variant("STRING"); /* `STRING */
    case G_FILE_ATTRIBUTE_TYPE_BYTE_STRING: return caml_hash_variant("BYTE_STRING"); /* `BYTE_STRING */
    case G_FILE_ATTRIBUTE_TYPE_BOOLEAN: return caml_hash_variant("BOOLEAN"); /* `BOOLEAN */
    case G_FILE_ATTRIBUTE_TYPE_UINT32: return caml_hash_variant("UINT32"); /* `UINT32 */
    case G_FILE_ATTRIBUTE_TYPE_INT32: return caml_hash_variant("INT32"); /* `INT32 */
    case G_FILE_ATTRIBUTE_TYPE_UINT64: return caml_hash_variant("UINT64"); /* `UINT64 */
    case G_FILE_ATTRIBUTE_TYPE_INT64: return caml_hash_variant("INT64"); /* `INT64 */
    case G_FILE_ATTRIBUTE_TYPE_OBJECT: return caml_hash_variant("OBJECT"); /* `OBJECT */
    case G_FILE_ATTRIBUTE_TYPE_STRINGV: return caml_hash_variant("STRINGV"); /* `STRINGV */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GFileAttributeType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GFileAttributeType */
GFileAttributeType GioFileAttributeType_val(value val) {
  if (val == caml_hash_variant("INVALID")) return G_FILE_ATTRIBUTE_TYPE_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("STRING")) return G_FILE_ATTRIBUTE_TYPE_STRING; /* `STRING */
  else if (val == caml_hash_variant("BYTE_STRING")) return G_FILE_ATTRIBUTE_TYPE_BYTE_STRING; /* `BYTE_STRING */
  else if (val == caml_hash_variant("BOOLEAN")) return G_FILE_ATTRIBUTE_TYPE_BOOLEAN; /* `BOOLEAN */
  else if (val == caml_hash_variant("UINT32")) return G_FILE_ATTRIBUTE_TYPE_UINT32; /* `UINT32 */
  else if (val == caml_hash_variant("INT32")) return G_FILE_ATTRIBUTE_TYPE_INT32; /* `INT32 */
  else if (val == caml_hash_variant("UINT64")) return G_FILE_ATTRIBUTE_TYPE_UINT64; /* `UINT64 */
  else if (val == caml_hash_variant("INT64")) return G_FILE_ATTRIBUTE_TYPE_INT64; /* `INT64 */
  else if (val == caml_hash_variant("OBJECT")) return G_FILE_ATTRIBUTE_TYPE_OBJECT; /* `OBJECT */
  else if (val == caml_hash_variant("STRINGV")) return G_FILE_ATTRIBUTE_TYPE_STRINGV; /* `STRINGV */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GFileAttributeType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GFileMonitorEvent to OCaml value */
value Val_GioFileMonitorEvent(GFileMonitorEvent val) {
  switch (val) {
    case G_FILE_MONITOR_EVENT_CHANGED: return caml_hash_variant("CHANGED"); /* `CHANGED */
    case G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT: return caml_hash_variant("CHANGES_DONE_HINT"); /* `CHANGES_DONE_HINT */
    case G_FILE_MONITOR_EVENT_DELETED: return caml_hash_variant("DELETED"); /* `DELETED */
    case G_FILE_MONITOR_EVENT_CREATED: return caml_hash_variant("CREATED"); /* `CREATED */
    case G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED: return caml_hash_variant("ATTRIBUTE_CHANGED"); /* `ATTRIBUTE_CHANGED */
    case G_FILE_MONITOR_EVENT_PRE_UNMOUNT: return caml_hash_variant("PRE_UNMOUNT"); /* `PRE_UNMOUNT */
    case G_FILE_MONITOR_EVENT_UNMOUNTED: return caml_hash_variant("UNMOUNTED"); /* `UNMOUNTED */
    case G_FILE_MONITOR_EVENT_MOVED: return caml_hash_variant("MOVED"); /* `MOVED */
    case G_FILE_MONITOR_EVENT_RENAMED: return caml_hash_variant("RENAMED"); /* `RENAMED */
    case G_FILE_MONITOR_EVENT_MOVED_IN: return caml_hash_variant("MOVED_IN"); /* `MOVED_IN */
    case G_FILE_MONITOR_EVENT_MOVED_OUT: return caml_hash_variant("MOVED_OUT"); /* `MOVED_OUT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GFileMonitorEvent value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GFileMonitorEvent */
GFileMonitorEvent GioFileMonitorEvent_val(value val) {
  if (val == caml_hash_variant("CHANGED")) return G_FILE_MONITOR_EVENT_CHANGED; /* `CHANGED */
  else if (val == caml_hash_variant("CHANGES_DONE_HINT")) return G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT; /* `CHANGES_DONE_HINT */
  else if (val == caml_hash_variant("DELETED")) return G_FILE_MONITOR_EVENT_DELETED; /* `DELETED */
  else if (val == caml_hash_variant("CREATED")) return G_FILE_MONITOR_EVENT_CREATED; /* `CREATED */
  else if (val == caml_hash_variant("ATTRIBUTE_CHANGED")) return G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED; /* `ATTRIBUTE_CHANGED */
  else if (val == caml_hash_variant("PRE_UNMOUNT")) return G_FILE_MONITOR_EVENT_PRE_UNMOUNT; /* `PRE_UNMOUNT */
  else if (val == caml_hash_variant("UNMOUNTED")) return G_FILE_MONITOR_EVENT_UNMOUNTED; /* `UNMOUNTED */
  else if (val == caml_hash_variant("MOVED")) return G_FILE_MONITOR_EVENT_MOVED; /* `MOVED */
  else if (val == caml_hash_variant("RENAMED")) return G_FILE_MONITOR_EVENT_RENAMED; /* `RENAMED */
  else if (val == caml_hash_variant("MOVED_IN")) return G_FILE_MONITOR_EVENT_MOVED_IN; /* `MOVED_IN */
  else if (val == caml_hash_variant("MOVED_OUT")) return G_FILE_MONITOR_EVENT_MOVED_OUT; /* `MOVED_OUT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GFileMonitorEvent tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GFileType to OCaml value */
value Val_GioFileType(GFileType val) {
  switch (val) {
    case G_FILE_TYPE_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case G_FILE_TYPE_REGULAR: return caml_hash_variant("REGULAR"); /* `REGULAR */
    case G_FILE_TYPE_DIRECTORY: return caml_hash_variant("DIRECTORY"); /* `DIRECTORY */
    case G_FILE_TYPE_SYMBOLIC_LINK: return caml_hash_variant("SYMBOLIC_LINK"); /* `SYMBOLIC_LINK */
    case G_FILE_TYPE_SPECIAL: return caml_hash_variant("SPECIAL"); /* `SPECIAL */
    case G_FILE_TYPE_SHORTCUT: return caml_hash_variant("SHORTCUT"); /* `SHORTCUT */
    case G_FILE_TYPE_MOUNTABLE: return caml_hash_variant("MOUNTABLE"); /* `MOUNTABLE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GFileType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GFileType */
GFileType GioFileType_val(value val) {
  if (val == caml_hash_variant("UNKNOWN")) return G_FILE_TYPE_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("REGULAR")) return G_FILE_TYPE_REGULAR; /* `REGULAR */
  else if (val == caml_hash_variant("DIRECTORY")) return G_FILE_TYPE_DIRECTORY; /* `DIRECTORY */
  else if (val == caml_hash_variant("SYMBOLIC_LINK")) return G_FILE_TYPE_SYMBOLIC_LINK; /* `SYMBOLIC_LINK */
  else if (val == caml_hash_variant("SPECIAL")) return G_FILE_TYPE_SPECIAL; /* `SPECIAL */
  else if (val == caml_hash_variant("SHORTCUT")) return G_FILE_TYPE_SHORTCUT; /* `SHORTCUT */
  else if (val == caml_hash_variant("MOUNTABLE")) return G_FILE_TYPE_MOUNTABLE; /* `MOUNTABLE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GFileType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GFilesystemPreviewType to OCaml value */
value Val_GioFilesystemPreviewType(GFilesystemPreviewType val) {
  switch (val) {
    case G_FILESYSTEM_PREVIEW_TYPE_IF_ALWAYS: return caml_hash_variant("IF_ALWAYS"); /* `IF_ALWAYS */
    case G_FILESYSTEM_PREVIEW_TYPE_IF_LOCAL: return caml_hash_variant("IF_LOCAL"); /* `IF_LOCAL */
    case G_FILESYSTEM_PREVIEW_TYPE_NEVER: return caml_hash_variant("NEVER"); /* `NEVER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GFilesystemPreviewType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GFilesystemPreviewType */
GFilesystemPreviewType GioFilesystemPreviewType_val(value val) {
  if (val == caml_hash_variant("IF_ALWAYS")) return G_FILESYSTEM_PREVIEW_TYPE_IF_ALWAYS; /* `IF_ALWAYS */
  else if (val == caml_hash_variant("IF_LOCAL")) return G_FILESYSTEM_PREVIEW_TYPE_IF_LOCAL; /* `IF_LOCAL */
  else if (val == caml_hash_variant("NEVER")) return G_FILESYSTEM_PREVIEW_TYPE_NEVER; /* `NEVER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GFilesystemPreviewType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GIOErrorEnum to OCaml value */
value Val_GioIOErrorEnum(GIOErrorEnum val) {
  switch (val) {
    case G_IO_ERROR_FAILED: return caml_hash_variant("FAILED"); /* `FAILED */
    case G_IO_ERROR_NOT_FOUND: return caml_hash_variant("NOT_FOUND"); /* `NOT_FOUND */
    case G_IO_ERROR_EXISTS: return caml_hash_variant("EXISTS"); /* `EXISTS */
    case G_IO_ERROR_IS_DIRECTORY: return caml_hash_variant("IS_DIRECTORY"); /* `IS_DIRECTORY */
    case G_IO_ERROR_NOT_DIRECTORY: return caml_hash_variant("NOT_DIRECTORY"); /* `NOT_DIRECTORY */
    case G_IO_ERROR_NOT_EMPTY: return caml_hash_variant("NOT_EMPTY"); /* `NOT_EMPTY */
    case G_IO_ERROR_NOT_REGULAR_FILE: return caml_hash_variant("NOT_REGULAR_FILE"); /* `NOT_REGULAR_FILE */
    case G_IO_ERROR_NOT_SYMBOLIC_LINK: return caml_hash_variant("NOT_SYMBOLIC_LINK"); /* `NOT_SYMBOLIC_LINK */
    case G_IO_ERROR_NOT_MOUNTABLE_FILE: return caml_hash_variant("NOT_MOUNTABLE_FILE"); /* `NOT_MOUNTABLE_FILE */
    case G_IO_ERROR_FILENAME_TOO_LONG: return caml_hash_variant("FILENAME_TOO_LONG"); /* `FILENAME_TOO_LONG */
    case G_IO_ERROR_INVALID_FILENAME: return caml_hash_variant("INVALID_FILENAME"); /* `INVALID_FILENAME */
    case G_IO_ERROR_TOO_MANY_LINKS: return caml_hash_variant("TOO_MANY_LINKS"); /* `TOO_MANY_LINKS */
    case G_IO_ERROR_NO_SPACE: return caml_hash_variant("NO_SPACE"); /* `NO_SPACE */
    case G_IO_ERROR_INVALID_ARGUMENT: return caml_hash_variant("INVALID_ARGUMENT"); /* `INVALID_ARGUMENT */
    case G_IO_ERROR_PERMISSION_DENIED: return caml_hash_variant("PERMISSION_DENIED"); /* `PERMISSION_DENIED */
    case G_IO_ERROR_NOT_SUPPORTED: return caml_hash_variant("NOT_SUPPORTED"); /* `NOT_SUPPORTED */
    case G_IO_ERROR_NOT_MOUNTED: return caml_hash_variant("NOT_MOUNTED"); /* `NOT_MOUNTED */
    case G_IO_ERROR_ALREADY_MOUNTED: return caml_hash_variant("ALREADY_MOUNTED"); /* `ALREADY_MOUNTED */
    case G_IO_ERROR_CLOSED: return caml_hash_variant("CLOSED"); /* `CLOSED */
    case G_IO_ERROR_CANCELLED: return caml_hash_variant("CANCELLED"); /* `CANCELLED */
    case G_IO_ERROR_PENDING: return caml_hash_variant("PENDING"); /* `PENDING */
    case G_IO_ERROR_READ_ONLY: return caml_hash_variant("READ_ONLY"); /* `READ_ONLY */
    case G_IO_ERROR_CANT_CREATE_BACKUP: return caml_hash_variant("CANT_CREATE_BACKUP"); /* `CANT_CREATE_BACKUP */
    case G_IO_ERROR_WRONG_ETAG: return caml_hash_variant("WRONG_ETAG"); /* `WRONG_ETAG */
    case G_IO_ERROR_TIMED_OUT: return caml_hash_variant("TIMED_OUT"); /* `TIMED_OUT */
    case G_IO_ERROR_WOULD_RECURSE: return caml_hash_variant("WOULD_RECURSE"); /* `WOULD_RECURSE */
    case G_IO_ERROR_BUSY: return caml_hash_variant("BUSY"); /* `BUSY */
    case G_IO_ERROR_WOULD_BLOCK: return caml_hash_variant("WOULD_BLOCK"); /* `WOULD_BLOCK */
    case G_IO_ERROR_HOST_NOT_FOUND: return caml_hash_variant("HOST_NOT_FOUND"); /* `HOST_NOT_FOUND */
    case G_IO_ERROR_WOULD_MERGE: return caml_hash_variant("WOULD_MERGE"); /* `WOULD_MERGE */
    case G_IO_ERROR_FAILED_HANDLED: return caml_hash_variant("FAILED_HANDLED"); /* `FAILED_HANDLED */
    case G_IO_ERROR_TOO_MANY_OPEN_FILES: return caml_hash_variant("TOO_MANY_OPEN_FILES"); /* `TOO_MANY_OPEN_FILES */
    case G_IO_ERROR_NOT_INITIALIZED: return caml_hash_variant("NOT_INITIALIZED"); /* `NOT_INITIALIZED */
    case G_IO_ERROR_ADDRESS_IN_USE: return caml_hash_variant("ADDRESS_IN_USE"); /* `ADDRESS_IN_USE */
    case G_IO_ERROR_PARTIAL_INPUT: return caml_hash_variant("PARTIAL_INPUT"); /* `PARTIAL_INPUT */
    case G_IO_ERROR_INVALID_DATA: return caml_hash_variant("INVALID_DATA"); /* `INVALID_DATA */
    case G_IO_ERROR_DBUS_ERROR: return caml_hash_variant("DBUS_ERROR"); /* `DBUS_ERROR */
    case G_IO_ERROR_HOST_UNREACHABLE: return caml_hash_variant("HOST_UNREACHABLE"); /* `HOST_UNREACHABLE */
    case G_IO_ERROR_NETWORK_UNREACHABLE: return caml_hash_variant("NETWORK_UNREACHABLE"); /* `NETWORK_UNREACHABLE */
    case G_IO_ERROR_CONNECTION_REFUSED: return caml_hash_variant("CONNECTION_REFUSED"); /* `CONNECTION_REFUSED */
    case G_IO_ERROR_PROXY_FAILED: return caml_hash_variant("PROXY_FAILED"); /* `PROXY_FAILED */
    case G_IO_ERROR_PROXY_AUTH_FAILED: return caml_hash_variant("PROXY_AUTH_FAILED"); /* `PROXY_AUTH_FAILED */
    case G_IO_ERROR_PROXY_NEED_AUTH: return caml_hash_variant("PROXY_NEED_AUTH"); /* `PROXY_NEED_AUTH */
    case G_IO_ERROR_PROXY_NOT_ALLOWED: return caml_hash_variant("PROXY_NOT_ALLOWED"); /* `PROXY_NOT_ALLOWED */
    case G_IO_ERROR_BROKEN_PIPE: return caml_hash_variant("BROKEN_PIPE"); /* `BROKEN_PIPE */
    case G_IO_ERROR_NOT_CONNECTED: return caml_hash_variant("NOT_CONNECTED"); /* `NOT_CONNECTED */
    case G_IO_ERROR_MESSAGE_TOO_LARGE: return caml_hash_variant("MESSAGE_TOO_LARGE"); /* `MESSAGE_TOO_LARGE */
    case G_IO_ERROR_NO_SUCH_DEVICE: return caml_hash_variant("NO_SUCH_DEVICE"); /* `NO_SUCH_DEVICE */
    case G_IO_ERROR_DESTINATION_UNSET: return caml_hash_variant("DESTINATION_UNSET"); /* `DESTINATION_UNSET */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GIOErrorEnum value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GIOErrorEnum */
GIOErrorEnum GioIOErrorEnum_val(value val) {
  if (val == caml_hash_variant("FAILED")) return G_IO_ERROR_FAILED; /* `FAILED */
  else if (val == caml_hash_variant("NOT_FOUND")) return G_IO_ERROR_NOT_FOUND; /* `NOT_FOUND */
  else if (val == caml_hash_variant("EXISTS")) return G_IO_ERROR_EXISTS; /* `EXISTS */
  else if (val == caml_hash_variant("IS_DIRECTORY")) return G_IO_ERROR_IS_DIRECTORY; /* `IS_DIRECTORY */
  else if (val == caml_hash_variant("NOT_DIRECTORY")) return G_IO_ERROR_NOT_DIRECTORY; /* `NOT_DIRECTORY */
  else if (val == caml_hash_variant("NOT_EMPTY")) return G_IO_ERROR_NOT_EMPTY; /* `NOT_EMPTY */
  else if (val == caml_hash_variant("NOT_REGULAR_FILE")) return G_IO_ERROR_NOT_REGULAR_FILE; /* `NOT_REGULAR_FILE */
  else if (val == caml_hash_variant("NOT_SYMBOLIC_LINK")) return G_IO_ERROR_NOT_SYMBOLIC_LINK; /* `NOT_SYMBOLIC_LINK */
  else if (val == caml_hash_variant("NOT_MOUNTABLE_FILE")) return G_IO_ERROR_NOT_MOUNTABLE_FILE; /* `NOT_MOUNTABLE_FILE */
  else if (val == caml_hash_variant("FILENAME_TOO_LONG")) return G_IO_ERROR_FILENAME_TOO_LONG; /* `FILENAME_TOO_LONG */
  else if (val == caml_hash_variant("INVALID_FILENAME")) return G_IO_ERROR_INVALID_FILENAME; /* `INVALID_FILENAME */
  else if (val == caml_hash_variant("TOO_MANY_LINKS")) return G_IO_ERROR_TOO_MANY_LINKS; /* `TOO_MANY_LINKS */
  else if (val == caml_hash_variant("NO_SPACE")) return G_IO_ERROR_NO_SPACE; /* `NO_SPACE */
  else if (val == caml_hash_variant("INVALID_ARGUMENT")) return G_IO_ERROR_INVALID_ARGUMENT; /* `INVALID_ARGUMENT */
  else if (val == caml_hash_variant("PERMISSION_DENIED")) return G_IO_ERROR_PERMISSION_DENIED; /* `PERMISSION_DENIED */
  else if (val == caml_hash_variant("NOT_SUPPORTED")) return G_IO_ERROR_NOT_SUPPORTED; /* `NOT_SUPPORTED */
  else if (val == caml_hash_variant("NOT_MOUNTED")) return G_IO_ERROR_NOT_MOUNTED; /* `NOT_MOUNTED */
  else if (val == caml_hash_variant("ALREADY_MOUNTED")) return G_IO_ERROR_ALREADY_MOUNTED; /* `ALREADY_MOUNTED */
  else if (val == caml_hash_variant("CLOSED")) return G_IO_ERROR_CLOSED; /* `CLOSED */
  else if (val == caml_hash_variant("CANCELLED")) return G_IO_ERROR_CANCELLED; /* `CANCELLED */
  else if (val == caml_hash_variant("PENDING")) return G_IO_ERROR_PENDING; /* `PENDING */
  else if (val == caml_hash_variant("READ_ONLY")) return G_IO_ERROR_READ_ONLY; /* `READ_ONLY */
  else if (val == caml_hash_variant("CANT_CREATE_BACKUP")) return G_IO_ERROR_CANT_CREATE_BACKUP; /* `CANT_CREATE_BACKUP */
  else if (val == caml_hash_variant("WRONG_ETAG")) return G_IO_ERROR_WRONG_ETAG; /* `WRONG_ETAG */
  else if (val == caml_hash_variant("TIMED_OUT")) return G_IO_ERROR_TIMED_OUT; /* `TIMED_OUT */
  else if (val == caml_hash_variant("WOULD_RECURSE")) return G_IO_ERROR_WOULD_RECURSE; /* `WOULD_RECURSE */
  else if (val == caml_hash_variant("BUSY")) return G_IO_ERROR_BUSY; /* `BUSY */
  else if (val == caml_hash_variant("WOULD_BLOCK")) return G_IO_ERROR_WOULD_BLOCK; /* `WOULD_BLOCK */
  else if (val == caml_hash_variant("HOST_NOT_FOUND")) return G_IO_ERROR_HOST_NOT_FOUND; /* `HOST_NOT_FOUND */
  else if (val == caml_hash_variant("WOULD_MERGE")) return G_IO_ERROR_WOULD_MERGE; /* `WOULD_MERGE */
  else if (val == caml_hash_variant("FAILED_HANDLED")) return G_IO_ERROR_FAILED_HANDLED; /* `FAILED_HANDLED */
  else if (val == caml_hash_variant("TOO_MANY_OPEN_FILES")) return G_IO_ERROR_TOO_MANY_OPEN_FILES; /* `TOO_MANY_OPEN_FILES */
  else if (val == caml_hash_variant("NOT_INITIALIZED")) return G_IO_ERROR_NOT_INITIALIZED; /* `NOT_INITIALIZED */
  else if (val == caml_hash_variant("ADDRESS_IN_USE")) return G_IO_ERROR_ADDRESS_IN_USE; /* `ADDRESS_IN_USE */
  else if (val == caml_hash_variant("PARTIAL_INPUT")) return G_IO_ERROR_PARTIAL_INPUT; /* `PARTIAL_INPUT */
  else if (val == caml_hash_variant("INVALID_DATA")) return G_IO_ERROR_INVALID_DATA; /* `INVALID_DATA */
  else if (val == caml_hash_variant("DBUS_ERROR")) return G_IO_ERROR_DBUS_ERROR; /* `DBUS_ERROR */
  else if (val == caml_hash_variant("HOST_UNREACHABLE")) return G_IO_ERROR_HOST_UNREACHABLE; /* `HOST_UNREACHABLE */
  else if (val == caml_hash_variant("NETWORK_UNREACHABLE")) return G_IO_ERROR_NETWORK_UNREACHABLE; /* `NETWORK_UNREACHABLE */
  else if (val == caml_hash_variant("CONNECTION_REFUSED")) return G_IO_ERROR_CONNECTION_REFUSED; /* `CONNECTION_REFUSED */
  else if (val == caml_hash_variant("PROXY_FAILED")) return G_IO_ERROR_PROXY_FAILED; /* `PROXY_FAILED */
  else if (val == caml_hash_variant("PROXY_AUTH_FAILED")) return G_IO_ERROR_PROXY_AUTH_FAILED; /* `PROXY_AUTH_FAILED */
  else if (val == caml_hash_variant("PROXY_NEED_AUTH")) return G_IO_ERROR_PROXY_NEED_AUTH; /* `PROXY_NEED_AUTH */
  else if (val == caml_hash_variant("PROXY_NOT_ALLOWED")) return G_IO_ERROR_PROXY_NOT_ALLOWED; /* `PROXY_NOT_ALLOWED */
  else if (val == caml_hash_variant("BROKEN_PIPE")) return G_IO_ERROR_BROKEN_PIPE; /* `BROKEN_PIPE */
  else if (val == caml_hash_variant("CONNECTION_CLOSED")) return G_IO_ERROR_CONNECTION_CLOSED; /* `CONNECTION_CLOSED */
  else if (val == caml_hash_variant("NOT_CONNECTED")) return G_IO_ERROR_NOT_CONNECTED; /* `NOT_CONNECTED */
  else if (val == caml_hash_variant("MESSAGE_TOO_LARGE")) return G_IO_ERROR_MESSAGE_TOO_LARGE; /* `MESSAGE_TOO_LARGE */
  else if (val == caml_hash_variant("NO_SUCH_DEVICE")) return G_IO_ERROR_NO_SUCH_DEVICE; /* `NO_SUCH_DEVICE */
  else if (val == caml_hash_variant("DESTINATION_UNSET")) return G_IO_ERROR_DESTINATION_UNSET; /* `DESTINATION_UNSET */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GIOErrorEnum tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GIOModuleScopeFlags to OCaml value */
value Val_GioIOModuleScopeFlags(GIOModuleScopeFlags val) {
  switch (val) {
    case G_IO_MODULE_SCOPE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case G_IO_MODULE_SCOPE_BLOCK_DUPLICATES: return caml_hash_variant("BLOCK_DUPLICATES"); /* `BLOCK_DUPLICATES */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GIOModuleScopeFlags value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GIOModuleScopeFlags */
GIOModuleScopeFlags GioIOModuleScopeFlags_val(value val) {
  if (val == caml_hash_variant("NONE")) return G_IO_MODULE_SCOPE_NONE; /* `NONE */
  else if (val == caml_hash_variant("BLOCK_DUPLICATES")) return G_IO_MODULE_SCOPE_BLOCK_DUPLICATES; /* `BLOCK_DUPLICATES */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GIOModuleScopeFlags tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GMemoryMonitorWarningLevel to OCaml value */
value Val_GioMemoryMonitorWarningLevel(GMemoryMonitorWarningLevel val) {
  switch (val) {
    case G_MEMORY_MONITOR_WARNING_LEVEL_LOW: return caml_hash_variant("LOW"); /* `LOW */
    case G_MEMORY_MONITOR_WARNING_LEVEL_MEDIUM: return caml_hash_variant("MEDIUM"); /* `MEDIUM */
    case G_MEMORY_MONITOR_WARNING_LEVEL_CRITICAL: return caml_hash_variant("CRITICAL"); /* `CRITICAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GMemoryMonitorWarningLevel value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GMemoryMonitorWarningLevel */
GMemoryMonitorWarningLevel GioMemoryMonitorWarningLevel_val(value val) {
  if (val == caml_hash_variant("LOW")) return G_MEMORY_MONITOR_WARNING_LEVEL_LOW; /* `LOW */
  else if (val == caml_hash_variant("MEDIUM")) return G_MEMORY_MONITOR_WARNING_LEVEL_MEDIUM; /* `MEDIUM */
  else if (val == caml_hash_variant("CRITICAL")) return G_MEMORY_MONITOR_WARNING_LEVEL_CRITICAL; /* `CRITICAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GMemoryMonitorWarningLevel tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GMountOperationResult to OCaml value */
value Val_GioMountOperationResult(GMountOperationResult val) {
  switch (val) {
    case G_MOUNT_OPERATION_HANDLED: return caml_hash_variant("HANDLED"); /* `HANDLED */
    case G_MOUNT_OPERATION_ABORTED: return caml_hash_variant("ABORTED"); /* `ABORTED */
    case G_MOUNT_OPERATION_UNHANDLED: return caml_hash_variant("UNHANDLED"); /* `UNHANDLED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GMountOperationResult value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GMountOperationResult */
GMountOperationResult GioMountOperationResult_val(value val) {
  if (val == caml_hash_variant("HANDLED")) return G_MOUNT_OPERATION_HANDLED; /* `HANDLED */
  else if (val == caml_hash_variant("ABORTED")) return G_MOUNT_OPERATION_ABORTED; /* `ABORTED */
  else if (val == caml_hash_variant("UNHANDLED")) return G_MOUNT_OPERATION_UNHANDLED; /* `UNHANDLED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GMountOperationResult tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GNetworkConnectivity to OCaml value */
value Val_GioNetworkConnectivity(GNetworkConnectivity val) {
  switch (val) {
    case G_NETWORK_CONNECTIVITY_LOCAL: return caml_hash_variant("LOCAL"); /* `LOCAL */
    case G_NETWORK_CONNECTIVITY_LIMITED: return caml_hash_variant("LIMITED"); /* `LIMITED */
    case G_NETWORK_CONNECTIVITY_PORTAL: return caml_hash_variant("PORTAL"); /* `PORTAL */
    case G_NETWORK_CONNECTIVITY_FULL: return caml_hash_variant("FULL"); /* `FULL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GNetworkConnectivity value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GNetworkConnectivity */
GNetworkConnectivity GioNetworkConnectivity_val(value val) {
  if (val == caml_hash_variant("LOCAL")) return G_NETWORK_CONNECTIVITY_LOCAL; /* `LOCAL */
  else if (val == caml_hash_variant("LIMITED")) return G_NETWORK_CONNECTIVITY_LIMITED; /* `LIMITED */
  else if (val == caml_hash_variant("PORTAL")) return G_NETWORK_CONNECTIVITY_PORTAL; /* `PORTAL */
  else if (val == caml_hash_variant("FULL")) return G_NETWORK_CONNECTIVITY_FULL; /* `FULL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GNetworkConnectivity tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GNotificationPriority to OCaml value */
value Val_GioNotificationPriority(GNotificationPriority val) {
  switch (val) {
    case G_NOTIFICATION_PRIORITY_NORMAL: return caml_hash_variant("NORMAL"); /* `NORMAL */
    case G_NOTIFICATION_PRIORITY_LOW: return caml_hash_variant("LOW"); /* `LOW */
    case G_NOTIFICATION_PRIORITY_HIGH: return caml_hash_variant("HIGH"); /* `HIGH */
    case G_NOTIFICATION_PRIORITY_URGENT: return caml_hash_variant("URGENT"); /* `URGENT */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GNotificationPriority value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GNotificationPriority */
GNotificationPriority GioNotificationPriority_val(value val) {
  if (val == caml_hash_variant("NORMAL")) return G_NOTIFICATION_PRIORITY_NORMAL; /* `NORMAL */
  else if (val == caml_hash_variant("LOW")) return G_NOTIFICATION_PRIORITY_LOW; /* `LOW */
  else if (val == caml_hash_variant("HIGH")) return G_NOTIFICATION_PRIORITY_HIGH; /* `HIGH */
  else if (val == caml_hash_variant("URGENT")) return G_NOTIFICATION_PRIORITY_URGENT; /* `URGENT */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GNotificationPriority tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GPasswordSave to OCaml value */
value Val_GioPasswordSave(GPasswordSave val) {
  switch (val) {
    case G_PASSWORD_SAVE_NEVER: return caml_hash_variant("NEVER"); /* `NEVER */
    case G_PASSWORD_SAVE_FOR_SESSION: return caml_hash_variant("FOR_SESSION"); /* `FOR_SESSION */
    case G_PASSWORD_SAVE_PERMANENTLY: return caml_hash_variant("PERMANENTLY"); /* `PERMANENTLY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GPasswordSave value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GPasswordSave */
GPasswordSave GioPasswordSave_val(value val) {
  if (val == caml_hash_variant("NEVER")) return G_PASSWORD_SAVE_NEVER; /* `NEVER */
  else if (val == caml_hash_variant("FOR_SESSION")) return G_PASSWORD_SAVE_FOR_SESSION; /* `FOR_SESSION */
  else if (val == caml_hash_variant("PERMANENTLY")) return G_PASSWORD_SAVE_PERMANENTLY; /* `PERMANENTLY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GPasswordSave tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GPollableReturn to OCaml value */
value Val_GioPollableReturn(GPollableReturn val) {
  switch (val) {
    case G_POLLABLE_RETURN_FAILED: return caml_hash_variant("FAILED"); /* `FAILED */
    case G_POLLABLE_RETURN_OK: return caml_hash_variant("OK"); /* `OK */
    case G_POLLABLE_RETURN_WOULD_BLOCK: return caml_hash_variant("WOULD_BLOCK"); /* `WOULD_BLOCK */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GPollableReturn value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GPollableReturn */
GPollableReturn GioPollableReturn_val(value val) {
  if (val == caml_hash_variant("FAILED")) return G_POLLABLE_RETURN_FAILED; /* `FAILED */
  else if (val == caml_hash_variant("OK")) return G_POLLABLE_RETURN_OK; /* `OK */
  else if (val == caml_hash_variant("WOULD_BLOCK")) return G_POLLABLE_RETURN_WOULD_BLOCK; /* `WOULD_BLOCK */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GPollableReturn tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GResolverError to OCaml value */
value Val_GioResolverError(GResolverError val) {
  switch (val) {
    case G_RESOLVER_ERROR_NOT_FOUND: return caml_hash_variant("NOT_FOUND"); /* `NOT_FOUND */
    case G_RESOLVER_ERROR_TEMPORARY_FAILURE: return caml_hash_variant("TEMPORARY_FAILURE"); /* `TEMPORARY_FAILURE */
    case G_RESOLVER_ERROR_INTERNAL: return caml_hash_variant("INTERNAL"); /* `INTERNAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GResolverError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GResolverError */
GResolverError GioResolverError_val(value val) {
  if (val == caml_hash_variant("NOT_FOUND")) return G_RESOLVER_ERROR_NOT_FOUND; /* `NOT_FOUND */
  else if (val == caml_hash_variant("TEMPORARY_FAILURE")) return G_RESOLVER_ERROR_TEMPORARY_FAILURE; /* `TEMPORARY_FAILURE */
  else if (val == caml_hash_variant("INTERNAL")) return G_RESOLVER_ERROR_INTERNAL; /* `INTERNAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GResolverError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GResolverRecordType to OCaml value */
value Val_GioResolverRecordType(GResolverRecordType val) {
  switch (val) {
    case G_RESOLVER_RECORD_SRV: return caml_hash_variant("SRV"); /* `SRV */
    case G_RESOLVER_RECORD_MX: return caml_hash_variant("MX"); /* `MX */
    case G_RESOLVER_RECORD_TXT: return caml_hash_variant("TXT"); /* `TXT */
    case G_RESOLVER_RECORD_SOA: return caml_hash_variant("SOA"); /* `SOA */
    case G_RESOLVER_RECORD_NS: return caml_hash_variant("NS"); /* `NS */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GResolverRecordType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GResolverRecordType */
GResolverRecordType GioResolverRecordType_val(value val) {
  if (val == caml_hash_variant("SRV")) return G_RESOLVER_RECORD_SRV; /* `SRV */
  else if (val == caml_hash_variant("MX")) return G_RESOLVER_RECORD_MX; /* `MX */
  else if (val == caml_hash_variant("TXT")) return G_RESOLVER_RECORD_TXT; /* `TXT */
  else if (val == caml_hash_variant("SOA")) return G_RESOLVER_RECORD_SOA; /* `SOA */
  else if (val == caml_hash_variant("NS")) return G_RESOLVER_RECORD_NS; /* `NS */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GResolverRecordType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GResourceError to OCaml value */
value Val_GioResourceError(GResourceError val) {
  switch (val) {
    case G_RESOURCE_ERROR_NOT_FOUND: return caml_hash_variant("NOT_FOUND"); /* `NOT_FOUND */
    case G_RESOURCE_ERROR_INTERNAL: return caml_hash_variant("INTERNAL"); /* `INTERNAL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GResourceError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GResourceError */
GResourceError GioResourceError_val(value val) {
  if (val == caml_hash_variant("NOT_FOUND")) return G_RESOURCE_ERROR_NOT_FOUND; /* `NOT_FOUND */
  else if (val == caml_hash_variant("INTERNAL")) return G_RESOURCE_ERROR_INTERNAL; /* `INTERNAL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GResourceError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GSocketClientEvent to OCaml value */
value Val_GioSocketClientEvent(GSocketClientEvent val) {
  switch (val) {
    case G_SOCKET_CLIENT_RESOLVING: return caml_hash_variant("RESOLVING"); /* `RESOLVING */
    case G_SOCKET_CLIENT_RESOLVED: return caml_hash_variant("RESOLVED"); /* `RESOLVED */
    case G_SOCKET_CLIENT_CONNECTING: return caml_hash_variant("CONNECTING"); /* `CONNECTING */
    case G_SOCKET_CLIENT_CONNECTED: return caml_hash_variant("CONNECTED"); /* `CONNECTED */
    case G_SOCKET_CLIENT_PROXY_NEGOTIATING: return caml_hash_variant("PROXY_NEGOTIATING"); /* `PROXY_NEGOTIATING */
    case G_SOCKET_CLIENT_PROXY_NEGOTIATED: return caml_hash_variant("PROXY_NEGOTIATED"); /* `PROXY_NEGOTIATED */
    case G_SOCKET_CLIENT_TLS_HANDSHAKING: return caml_hash_variant("TLS_HANDSHAKING"); /* `TLS_HANDSHAKING */
    case G_SOCKET_CLIENT_TLS_HANDSHAKED: return caml_hash_variant("TLS_HANDSHAKED"); /* `TLS_HANDSHAKED */
    case G_SOCKET_CLIENT_COMPLETE: return caml_hash_variant("COMPLETE"); /* `COMPLETE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GSocketClientEvent value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GSocketClientEvent */
GSocketClientEvent GioSocketClientEvent_val(value val) {
  if (val == caml_hash_variant("RESOLVING")) return G_SOCKET_CLIENT_RESOLVING; /* `RESOLVING */
  else if (val == caml_hash_variant("RESOLVED")) return G_SOCKET_CLIENT_RESOLVED; /* `RESOLVED */
  else if (val == caml_hash_variant("CONNECTING")) return G_SOCKET_CLIENT_CONNECTING; /* `CONNECTING */
  else if (val == caml_hash_variant("CONNECTED")) return G_SOCKET_CLIENT_CONNECTED; /* `CONNECTED */
  else if (val == caml_hash_variant("PROXY_NEGOTIATING")) return G_SOCKET_CLIENT_PROXY_NEGOTIATING; /* `PROXY_NEGOTIATING */
  else if (val == caml_hash_variant("PROXY_NEGOTIATED")) return G_SOCKET_CLIENT_PROXY_NEGOTIATED; /* `PROXY_NEGOTIATED */
  else if (val == caml_hash_variant("TLS_HANDSHAKING")) return G_SOCKET_CLIENT_TLS_HANDSHAKING; /* `TLS_HANDSHAKING */
  else if (val == caml_hash_variant("TLS_HANDSHAKED")) return G_SOCKET_CLIENT_TLS_HANDSHAKED; /* `TLS_HANDSHAKED */
  else if (val == caml_hash_variant("COMPLETE")) return G_SOCKET_CLIENT_COMPLETE; /* `COMPLETE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GSocketClientEvent tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GSocketFamily to OCaml value */
value Val_GioSocketFamily(GSocketFamily val) {
  switch (val) {
    case G_SOCKET_FAMILY_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case G_SOCKET_FAMILY_UNIX: return caml_hash_variant("UNIX"); /* `UNIX */
    case G_SOCKET_FAMILY_IPV4: return caml_hash_variant("IPV4"); /* `IPV4 */
    case G_SOCKET_FAMILY_IPV6: return caml_hash_variant("IPV6"); /* `IPV6 */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GSocketFamily value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GSocketFamily */
GSocketFamily GioSocketFamily_val(value val) {
  if (val == caml_hash_variant("INVALID")) return G_SOCKET_FAMILY_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("UNIX")) return G_SOCKET_FAMILY_UNIX; /* `UNIX */
  else if (val == caml_hash_variant("IPV4")) return G_SOCKET_FAMILY_IPV4; /* `IPV4 */
  else if (val == caml_hash_variant("IPV6")) return G_SOCKET_FAMILY_IPV6; /* `IPV6 */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GSocketFamily tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GSocketListenerEvent to OCaml value */
value Val_GioSocketListenerEvent(GSocketListenerEvent val) {
  switch (val) {
    case G_SOCKET_LISTENER_BINDING: return caml_hash_variant("BINDING"); /* `BINDING */
    case G_SOCKET_LISTENER_BOUND: return caml_hash_variant("BOUND"); /* `BOUND */
    case G_SOCKET_LISTENER_LISTENING: return caml_hash_variant("LISTENING"); /* `LISTENING */
    case G_SOCKET_LISTENER_LISTENED: return caml_hash_variant("LISTENED"); /* `LISTENED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GSocketListenerEvent value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GSocketListenerEvent */
GSocketListenerEvent GioSocketListenerEvent_val(value val) {
  if (val == caml_hash_variant("BINDING")) return G_SOCKET_LISTENER_BINDING; /* `BINDING */
  else if (val == caml_hash_variant("BOUND")) return G_SOCKET_LISTENER_BOUND; /* `BOUND */
  else if (val == caml_hash_variant("LISTENING")) return G_SOCKET_LISTENER_LISTENING; /* `LISTENING */
  else if (val == caml_hash_variant("LISTENED")) return G_SOCKET_LISTENER_LISTENED; /* `LISTENED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GSocketListenerEvent tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GSocketProtocol to OCaml value */
value Val_GioSocketProtocol(GSocketProtocol val) {
  switch (val) {
    case G_SOCKET_PROTOCOL_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case G_SOCKET_PROTOCOL_DEFAULT: return caml_hash_variant("DEFAULT"); /* `DEFAULT */
    case G_SOCKET_PROTOCOL_TCP: return caml_hash_variant("TCP"); /* `TCP */
    case G_SOCKET_PROTOCOL_UDP: return caml_hash_variant("UDP"); /* `UDP */
    case G_SOCKET_PROTOCOL_SCTP: return caml_hash_variant("SCTP"); /* `SCTP */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GSocketProtocol value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GSocketProtocol */
GSocketProtocol GioSocketProtocol_val(value val) {
  if (val == caml_hash_variant("UNKNOWN")) return G_SOCKET_PROTOCOL_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("DEFAULT")) return G_SOCKET_PROTOCOL_DEFAULT; /* `DEFAULT */
  else if (val == caml_hash_variant("TCP")) return G_SOCKET_PROTOCOL_TCP; /* `TCP */
  else if (val == caml_hash_variant("UDP")) return G_SOCKET_PROTOCOL_UDP; /* `UDP */
  else if (val == caml_hash_variant("SCTP")) return G_SOCKET_PROTOCOL_SCTP; /* `SCTP */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GSocketProtocol tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GSocketType to OCaml value */
value Val_GioSocketType(GSocketType val) {
  switch (val) {
    case G_SOCKET_TYPE_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case G_SOCKET_TYPE_STREAM: return caml_hash_variant("STREAM"); /* `STREAM */
    case G_SOCKET_TYPE_DATAGRAM: return caml_hash_variant("DATAGRAM"); /* `DATAGRAM */
    case G_SOCKET_TYPE_SEQPACKET: return caml_hash_variant("SEQPACKET"); /* `SEQPACKET */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GSocketType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GSocketType */
GSocketType GioSocketType_val(value val) {
  if (val == caml_hash_variant("INVALID")) return G_SOCKET_TYPE_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("STREAM")) return G_SOCKET_TYPE_STREAM; /* `STREAM */
  else if (val == caml_hash_variant("DATAGRAM")) return G_SOCKET_TYPE_DATAGRAM; /* `DATAGRAM */
  else if (val == caml_hash_variant("SEQPACKET")) return G_SOCKET_TYPE_SEQPACKET; /* `SEQPACKET */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GSocketType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsAuthenticationMode to OCaml value */
value Val_GioTlsAuthenticationMode(GTlsAuthenticationMode val) {
  switch (val) {
    case G_TLS_AUTHENTICATION_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case G_TLS_AUTHENTICATION_REQUESTED: return caml_hash_variant("REQUESTED"); /* `REQUESTED */
    case G_TLS_AUTHENTICATION_REQUIRED: return caml_hash_variant("REQUIRED"); /* `REQUIRED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsAuthenticationMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsAuthenticationMode */
GTlsAuthenticationMode GioTlsAuthenticationMode_val(value val) {
  if (val == caml_hash_variant("NONE")) return G_TLS_AUTHENTICATION_NONE; /* `NONE */
  else if (val == caml_hash_variant("REQUESTED")) return G_TLS_AUTHENTICATION_REQUESTED; /* `REQUESTED */
  else if (val == caml_hash_variant("REQUIRED")) return G_TLS_AUTHENTICATION_REQUIRED; /* `REQUIRED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsAuthenticationMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsCertificateRequestFlags to OCaml value */
value Val_GioTlsCertificateRequestFlags(GTlsCertificateRequestFlags val) {
  switch (val) {
    case G_TLS_CERTIFICATE_REQUEST_NONE: return caml_hash_variant("NONE"); /* `NONE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsCertificateRequestFlags value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsCertificateRequestFlags */
GTlsCertificateRequestFlags GioTlsCertificateRequestFlags_val(value val) {
  if (val == caml_hash_variant("NONE")) return G_TLS_CERTIFICATE_REQUEST_NONE; /* `NONE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsCertificateRequestFlags tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsChannelBindingError to OCaml value */
value Val_GioTlsChannelBindingError(GTlsChannelBindingError val) {
  switch (val) {
    case G_TLS_CHANNEL_BINDING_ERROR_NOT_IMPLEMENTED: return caml_hash_variant("NOT_IMPLEMENTED"); /* `NOT_IMPLEMENTED */
    case G_TLS_CHANNEL_BINDING_ERROR_INVALID_STATE: return caml_hash_variant("INVALID_STATE"); /* `INVALID_STATE */
    case G_TLS_CHANNEL_BINDING_ERROR_NOT_AVAILABLE: return caml_hash_variant("NOT_AVAILABLE"); /* `NOT_AVAILABLE */
    case G_TLS_CHANNEL_BINDING_ERROR_NOT_SUPPORTED: return caml_hash_variant("NOT_SUPPORTED"); /* `NOT_SUPPORTED */
    case G_TLS_CHANNEL_BINDING_ERROR_GENERAL_ERROR: return caml_hash_variant("GENERAL_ERROR"); /* `GENERAL_ERROR */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsChannelBindingError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsChannelBindingError */
GTlsChannelBindingError GioTlsChannelBindingError_val(value val) {
  if (val == caml_hash_variant("NOT_IMPLEMENTED")) return G_TLS_CHANNEL_BINDING_ERROR_NOT_IMPLEMENTED; /* `NOT_IMPLEMENTED */
  else if (val == caml_hash_variant("INVALID_STATE")) return G_TLS_CHANNEL_BINDING_ERROR_INVALID_STATE; /* `INVALID_STATE */
  else if (val == caml_hash_variant("NOT_AVAILABLE")) return G_TLS_CHANNEL_BINDING_ERROR_NOT_AVAILABLE; /* `NOT_AVAILABLE */
  else if (val == caml_hash_variant("NOT_SUPPORTED")) return G_TLS_CHANNEL_BINDING_ERROR_NOT_SUPPORTED; /* `NOT_SUPPORTED */
  else if (val == caml_hash_variant("GENERAL_ERROR")) return G_TLS_CHANNEL_BINDING_ERROR_GENERAL_ERROR; /* `GENERAL_ERROR */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsChannelBindingError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsChannelBindingType to OCaml value */
value Val_GioTlsChannelBindingType(GTlsChannelBindingType val) {
  switch (val) {
    case G_TLS_CHANNEL_BINDING_TLS_UNIQUE: return caml_hash_variant("UNIQUE"); /* `UNIQUE */
    case G_TLS_CHANNEL_BINDING_TLS_SERVER_END_POINT: return caml_hash_variant("SERVER_END_POINT"); /* `SERVER_END_POINT */
    case G_TLS_CHANNEL_BINDING_TLS_EXPORTER: return caml_hash_variant("EXPORTER"); /* `EXPORTER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsChannelBindingType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsChannelBindingType */
GTlsChannelBindingType GioTlsChannelBindingType_val(value val) {
  if (val == caml_hash_variant("UNIQUE")) return G_TLS_CHANNEL_BINDING_TLS_UNIQUE; /* `UNIQUE */
  else if (val == caml_hash_variant("SERVER_END_POINT")) return G_TLS_CHANNEL_BINDING_TLS_SERVER_END_POINT; /* `SERVER_END_POINT */
  else if (val == caml_hash_variant("EXPORTER")) return G_TLS_CHANNEL_BINDING_TLS_EXPORTER; /* `EXPORTER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsChannelBindingType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsDatabaseLookupFlags to OCaml value */
value Val_GioTlsDatabaseLookupFlags(GTlsDatabaseLookupFlags val) {
  switch (val) {
    case G_TLS_DATABASE_LOOKUP_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case G_TLS_DATABASE_LOOKUP_KEYPAIR: return caml_hash_variant("KEYPAIR"); /* `KEYPAIR */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsDatabaseLookupFlags value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsDatabaseLookupFlags */
GTlsDatabaseLookupFlags GioTlsDatabaseLookupFlags_val(value val) {
  if (val == caml_hash_variant("NONE")) return G_TLS_DATABASE_LOOKUP_NONE; /* `NONE */
  else if (val == caml_hash_variant("KEYPAIR")) return G_TLS_DATABASE_LOOKUP_KEYPAIR; /* `KEYPAIR */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsDatabaseLookupFlags tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsError to OCaml value */
value Val_GioTlsError(GTlsError val) {
  switch (val) {
    case G_TLS_ERROR_UNAVAILABLE: return caml_hash_variant("UNAVAILABLE"); /* `UNAVAILABLE */
    case G_TLS_ERROR_MISC: return caml_hash_variant("MISC"); /* `MISC */
    case G_TLS_ERROR_BAD_CERTIFICATE: return caml_hash_variant("BAD_CERTIFICATE"); /* `BAD_CERTIFICATE */
    case G_TLS_ERROR_NOT_TLS: return caml_hash_variant("NOT_TLS"); /* `NOT_TLS */
    case G_TLS_ERROR_HANDSHAKE: return caml_hash_variant("HANDSHAKE"); /* `HANDSHAKE */
    case G_TLS_ERROR_CERTIFICATE_REQUIRED: return caml_hash_variant("CERTIFICATE_REQUIRED"); /* `CERTIFICATE_REQUIRED */
    case G_TLS_ERROR_EOF: return caml_hash_variant("EOF"); /* `EOF */
    case G_TLS_ERROR_INAPPROPRIATE_FALLBACK: return caml_hash_variant("INAPPROPRIATE_FALLBACK"); /* `INAPPROPRIATE_FALLBACK */
    case G_TLS_ERROR_BAD_CERTIFICATE_PASSWORD: return caml_hash_variant("BAD_CERTIFICATE_PASSWORD"); /* `BAD_CERTIFICATE_PASSWORD */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsError */
GTlsError GioTlsError_val(value val) {
  if (val == caml_hash_variant("UNAVAILABLE")) return G_TLS_ERROR_UNAVAILABLE; /* `UNAVAILABLE */
  else if (val == caml_hash_variant("MISC")) return G_TLS_ERROR_MISC; /* `MISC */
  else if (val == caml_hash_variant("BAD_CERTIFICATE")) return G_TLS_ERROR_BAD_CERTIFICATE; /* `BAD_CERTIFICATE */
  else if (val == caml_hash_variant("NOT_TLS")) return G_TLS_ERROR_NOT_TLS; /* `NOT_TLS */
  else if (val == caml_hash_variant("HANDSHAKE")) return G_TLS_ERROR_HANDSHAKE; /* `HANDSHAKE */
  else if (val == caml_hash_variant("CERTIFICATE_REQUIRED")) return G_TLS_ERROR_CERTIFICATE_REQUIRED; /* `CERTIFICATE_REQUIRED */
  else if (val == caml_hash_variant("EOF")) return G_TLS_ERROR_EOF; /* `EOF */
  else if (val == caml_hash_variant("INAPPROPRIATE_FALLBACK")) return G_TLS_ERROR_INAPPROPRIATE_FALLBACK; /* `INAPPROPRIATE_FALLBACK */
  else if (val == caml_hash_variant("BAD_CERTIFICATE_PASSWORD")) return G_TLS_ERROR_BAD_CERTIFICATE_PASSWORD; /* `BAD_CERTIFICATE_PASSWORD */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsInteractionResult to OCaml value */
value Val_GioTlsInteractionResult(GTlsInteractionResult val) {
  switch (val) {
    case G_TLS_INTERACTION_UNHANDLED: return caml_hash_variant("UNHANDLED"); /* `UNHANDLED */
    case G_TLS_INTERACTION_HANDLED: return caml_hash_variant("HANDLED"); /* `HANDLED */
    case G_TLS_INTERACTION_FAILED: return caml_hash_variant("FAILED"); /* `FAILED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsInteractionResult value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsInteractionResult */
GTlsInteractionResult GioTlsInteractionResult_val(value val) {
  if (val == caml_hash_variant("UNHANDLED")) return G_TLS_INTERACTION_UNHANDLED; /* `UNHANDLED */
  else if (val == caml_hash_variant("HANDLED")) return G_TLS_INTERACTION_HANDLED; /* `HANDLED */
  else if (val == caml_hash_variant("FAILED")) return G_TLS_INTERACTION_FAILED; /* `FAILED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsInteractionResult tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsProtocolVersion to OCaml value */
value Val_GioTlsProtocolVersion(GTlsProtocolVersion val) {
  switch (val) {
    case G_TLS_PROTOCOL_VERSION_UNKNOWN: return caml_hash_variant("UNKNOWN"); /* `UNKNOWN */
    case G_TLS_PROTOCOL_VERSION_SSL_3_0: return caml_hash_variant("SSL_3_0"); /* `SSL_3_0 */
    case G_TLS_PROTOCOL_VERSION_TLS_1_0: return caml_hash_variant("TLS_1_0"); /* `TLS_1_0 */
    case G_TLS_PROTOCOL_VERSION_TLS_1_1: return caml_hash_variant("TLS_1_1"); /* `TLS_1_1 */
    case G_TLS_PROTOCOL_VERSION_TLS_1_2: return caml_hash_variant("TLS_1_2"); /* `TLS_1_2 */
    case G_TLS_PROTOCOL_VERSION_TLS_1_3: return caml_hash_variant("TLS_1_3"); /* `TLS_1_3 */
    case G_TLS_PROTOCOL_VERSION_DTLS_1_0: return caml_hash_variant("DTLS_1_0"); /* `DTLS_1_0 */
    case G_TLS_PROTOCOL_VERSION_DTLS_1_2: return caml_hash_variant("DTLS_1_2"); /* `DTLS_1_2 */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsProtocolVersion value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsProtocolVersion */
GTlsProtocolVersion GioTlsProtocolVersion_val(value val) {
  if (val == caml_hash_variant("UNKNOWN")) return G_TLS_PROTOCOL_VERSION_UNKNOWN; /* `UNKNOWN */
  else if (val == caml_hash_variant("SSL_3_0")) return G_TLS_PROTOCOL_VERSION_SSL_3_0; /* `SSL_3_0 */
  else if (val == caml_hash_variant("TLS_1_0")) return G_TLS_PROTOCOL_VERSION_TLS_1_0; /* `TLS_1_0 */
  else if (val == caml_hash_variant("TLS_1_1")) return G_TLS_PROTOCOL_VERSION_TLS_1_1; /* `TLS_1_1 */
  else if (val == caml_hash_variant("TLS_1_2")) return G_TLS_PROTOCOL_VERSION_TLS_1_2; /* `TLS_1_2 */
  else if (val == caml_hash_variant("TLS_1_3")) return G_TLS_PROTOCOL_VERSION_TLS_1_3; /* `TLS_1_3 */
  else if (val == caml_hash_variant("DTLS_1_0")) return G_TLS_PROTOCOL_VERSION_DTLS_1_0; /* `DTLS_1_0 */
  else if (val == caml_hash_variant("DTLS_1_2")) return G_TLS_PROTOCOL_VERSION_DTLS_1_2; /* `DTLS_1_2 */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsProtocolVersion tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GTlsRehandshakeMode to OCaml value */
value Val_GioTlsRehandshakeMode(GTlsRehandshakeMode val) {
  switch (val) {
    case G_TLS_REHANDSHAKE_NEVER: return caml_hash_variant("NEVER"); /* `NEVER */
    case G_TLS_REHANDSHAKE_SAFELY: return caml_hash_variant("SAFELY"); /* `SAFELY */
    case G_TLS_REHANDSHAKE_UNSAFELY: return caml_hash_variant("UNSAFELY"); /* `UNSAFELY */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GTlsRehandshakeMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GTlsRehandshakeMode */
GTlsRehandshakeMode GioTlsRehandshakeMode_val(value val) {
  if (val == caml_hash_variant("NEVER")) return G_TLS_REHANDSHAKE_NEVER; /* `NEVER */
  else if (val == caml_hash_variant("SAFELY")) return G_TLS_REHANDSHAKE_SAFELY; /* `SAFELY */
  else if (val == caml_hash_variant("UNSAFELY")) return G_TLS_REHANDSHAKE_UNSAFELY; /* `UNSAFELY */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GTlsRehandshakeMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GUnixSocketAddressType to OCaml value */
value Val_GioUnixSocketAddressType(GUnixSocketAddressType val) {
  switch (val) {
    case G_UNIX_SOCKET_ADDRESS_INVALID: return caml_hash_variant("INVALID"); /* `INVALID */
    case G_UNIX_SOCKET_ADDRESS_ANONYMOUS: return caml_hash_variant("ANONYMOUS"); /* `ANONYMOUS */
    case G_UNIX_SOCKET_ADDRESS_PATH: return caml_hash_variant("PATH"); /* `PATH */
    case G_UNIX_SOCKET_ADDRESS_ABSTRACT: return caml_hash_variant("ABSTRACT"); /* `ABSTRACT */
    case G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED: return caml_hash_variant("ABSTRACT_PADDED"); /* `ABSTRACT_PADDED */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GUnixSocketAddressType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GUnixSocketAddressType */
GUnixSocketAddressType GioUnixSocketAddressType_val(value val) {
  if (val == caml_hash_variant("INVALID")) return G_UNIX_SOCKET_ADDRESS_INVALID; /* `INVALID */
  else if (val == caml_hash_variant("ANONYMOUS")) return G_UNIX_SOCKET_ADDRESS_ANONYMOUS; /* `ANONYMOUS */
  else if (val == caml_hash_variant("PATH")) return G_UNIX_SOCKET_ADDRESS_PATH; /* `PATH */
  else if (val == caml_hash_variant("ABSTRACT")) return G_UNIX_SOCKET_ADDRESS_ABSTRACT; /* `ABSTRACT */
  else if (val == caml_hash_variant("ABSTRACT_PADDED")) return G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED; /* `ABSTRACT_PADDED */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GUnixSocketAddressType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GZlibCompressorFormat to OCaml value */
value Val_GioZlibCompressorFormat(GZlibCompressorFormat val) {
  switch (val) {
    case G_ZLIB_COMPRESSOR_FORMAT_ZLIB: return caml_hash_variant("ZLIB"); /* `ZLIB */
    case G_ZLIB_COMPRESSOR_FORMAT_GZIP: return caml_hash_variant("GZIP"); /* `GZIP */
    case G_ZLIB_COMPRESSOR_FORMAT_RAW: return caml_hash_variant("RAW"); /* `RAW */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GZlibCompressorFormat value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GZlibCompressorFormat */
GZlibCompressorFormat GioZlibCompressorFormat_val(value val) {
  if (val == caml_hash_variant("ZLIB")) return G_ZLIB_COMPRESSOR_FORMAT_ZLIB; /* `ZLIB */
  else if (val == caml_hash_variant("GZIP")) return G_ZLIB_COMPRESSOR_FORMAT_GZIP; /* `GZIP */
  else if (val == caml_hash_variant("RAW")) return G_ZLIB_COMPRESSOR_FORMAT_RAW; /* `RAW */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GZlibCompressorFormat tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GAppInfoCreateFlags to OCaml flag list */
value Val_GioAppInfoCreateFlags(GAppInfoCreateFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_APP_INFO_CREATE_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APP_INFO_CREATE_NEEDS_TERMINAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NEEDS_TERMINAL"))); /* `NEEDS_TERMINAL */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APP_INFO_CREATE_SUPPORTS_URIS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SUPPORTS_URIS"))); /* `SUPPORTS_URIS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APP_INFO_CREATE_SUPPORTS_STARTUP_NOTIFICATION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SUPPORTS_STARTUP_NOTIFICATION"))); /* `SUPPORTS_STARTUP_NOTIFICATION */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GAppInfoCreateFlags */
GAppInfoCreateFlags GioAppInfoCreateFlags_val(value list) {
  GAppInfoCreateFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_APP_INFO_CREATE_NONE; /* `NONE */
    else if (tag == caml_hash_variant("NEEDS_TERMINAL")) result |= G_APP_INFO_CREATE_NEEDS_TERMINAL; /* `NEEDS_TERMINAL */
    else if (tag == caml_hash_variant("SUPPORTS_URIS")) result |= G_APP_INFO_CREATE_SUPPORTS_URIS; /* `SUPPORTS_URIS */
    else if (tag == caml_hash_variant("SUPPORTS_STARTUP_NOTIFICATION")) result |= G_APP_INFO_CREATE_SUPPORTS_STARTUP_NOTIFICATION; /* `SUPPORTS_STARTUP_NOTIFICATION */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GApplicationFlags to OCaml flag list */
value Val_GioApplicationFlags(GApplicationFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_APPLICATION_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FLAGS_NONE"))); /* `FLAGS_NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_DEFAULT_FLAGS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEFAULT_FLAGS"))); /* `DEFAULT_FLAGS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_IS_SERVICE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("IS_SERVICE"))); /* `IS_SERVICE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_IS_LAUNCHER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("IS_LAUNCHER"))); /* `IS_LAUNCHER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_HANDLES_OPEN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("HANDLES_OPEN"))); /* `HANDLES_OPEN */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_HANDLES_COMMAND_LINE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("HANDLES_COMMAND_LINE"))); /* `HANDLES_COMMAND_LINE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_SEND_ENVIRONMENT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SEND_ENVIRONMENT"))); /* `SEND_ENVIRONMENT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_NON_UNIQUE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NON_UNIQUE"))); /* `NON_UNIQUE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_CAN_OVERRIDE_APP_ID) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CAN_OVERRIDE_APP_ID"))); /* `CAN_OVERRIDE_APP_ID */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_ALLOW_REPLACEMENT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ALLOW_REPLACEMENT"))); /* `ALLOW_REPLACEMENT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_APPLICATION_REPLACE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("REPLACE"))); /* `REPLACE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GApplicationFlags */
GApplicationFlags GioApplicationFlags_val(value list) {
  GApplicationFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("FLAGS_NONE")) result |= G_APPLICATION_FLAGS_NONE; /* `FLAGS_NONE */
    else if (tag == caml_hash_variant("DEFAULT_FLAGS")) result |= G_APPLICATION_DEFAULT_FLAGS; /* `DEFAULT_FLAGS */
    else if (tag == caml_hash_variant("IS_SERVICE")) result |= G_APPLICATION_IS_SERVICE; /* `IS_SERVICE */
    else if (tag == caml_hash_variant("IS_LAUNCHER")) result |= G_APPLICATION_IS_LAUNCHER; /* `IS_LAUNCHER */
    else if (tag == caml_hash_variant("HANDLES_OPEN")) result |= G_APPLICATION_HANDLES_OPEN; /* `HANDLES_OPEN */
    else if (tag == caml_hash_variant("HANDLES_COMMAND_LINE")) result |= G_APPLICATION_HANDLES_COMMAND_LINE; /* `HANDLES_COMMAND_LINE */
    else if (tag == caml_hash_variant("SEND_ENVIRONMENT")) result |= G_APPLICATION_SEND_ENVIRONMENT; /* `SEND_ENVIRONMENT */
    else if (tag == caml_hash_variant("NON_UNIQUE")) result |= G_APPLICATION_NON_UNIQUE; /* `NON_UNIQUE */
    else if (tag == caml_hash_variant("CAN_OVERRIDE_APP_ID")) result |= G_APPLICATION_CAN_OVERRIDE_APP_ID; /* `CAN_OVERRIDE_APP_ID */
    else if (tag == caml_hash_variant("ALLOW_REPLACEMENT")) result |= G_APPLICATION_ALLOW_REPLACEMENT; /* `ALLOW_REPLACEMENT */
    else if (tag == caml_hash_variant("REPLACE")) result |= G_APPLICATION_REPLACE; /* `REPLACE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GAskPasswordFlags to OCaml flag list */
value Val_GioAskPasswordFlags(GAskPasswordFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_ASK_PASSWORD_NEED_PASSWORD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NEED_PASSWORD"))); /* `NEED_PASSWORD */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_ASK_PASSWORD_NEED_USERNAME) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NEED_USERNAME"))); /* `NEED_USERNAME */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_ASK_PASSWORD_NEED_DOMAIN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NEED_DOMAIN"))); /* `NEED_DOMAIN */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_ASK_PASSWORD_SAVING_SUPPORTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SAVING_SUPPORTED"))); /* `SAVING_SUPPORTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_ASK_PASSWORD_ANONYMOUS_SUPPORTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ANONYMOUS_SUPPORTED"))); /* `ANONYMOUS_SUPPORTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_ASK_PASSWORD_TCRYPT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TCRYPT"))); /* `TCRYPT */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GAskPasswordFlags */
GAskPasswordFlags GioAskPasswordFlags_val(value list) {
  GAskPasswordFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NEED_PASSWORD")) result |= G_ASK_PASSWORD_NEED_PASSWORD; /* `NEED_PASSWORD */
    else if (tag == caml_hash_variant("NEED_USERNAME")) result |= G_ASK_PASSWORD_NEED_USERNAME; /* `NEED_USERNAME */
    else if (tag == caml_hash_variant("NEED_DOMAIN")) result |= G_ASK_PASSWORD_NEED_DOMAIN; /* `NEED_DOMAIN */
    else if (tag == caml_hash_variant("SAVING_SUPPORTED")) result |= G_ASK_PASSWORD_SAVING_SUPPORTED; /* `SAVING_SUPPORTED */
    else if (tag == caml_hash_variant("ANONYMOUS_SUPPORTED")) result |= G_ASK_PASSWORD_ANONYMOUS_SUPPORTED; /* `ANONYMOUS_SUPPORTED */
    else if (tag == caml_hash_variant("TCRYPT")) result |= G_ASK_PASSWORD_TCRYPT; /* `TCRYPT */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GBusNameOwnerFlags to OCaml flag list */
value Val_GioBusNameOwnerFlags(GBusNameOwnerFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_BUS_NAME_OWNER_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ALLOW_REPLACEMENT"))); /* `ALLOW_REPLACEMENT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_BUS_NAME_OWNER_FLAGS_REPLACE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("REPLACE"))); /* `REPLACE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_BUS_NAME_OWNER_FLAGS_DO_NOT_QUEUE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DO_NOT_QUEUE"))); /* `DO_NOT_QUEUE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GBusNameOwnerFlags */
GBusNameOwnerFlags GioBusNameOwnerFlags_val(value list) {
  GBusNameOwnerFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_BUS_NAME_OWNER_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("ALLOW_REPLACEMENT")) result |= G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT; /* `ALLOW_REPLACEMENT */
    else if (tag == caml_hash_variant("REPLACE")) result |= G_BUS_NAME_OWNER_FLAGS_REPLACE; /* `REPLACE */
    else if (tag == caml_hash_variant("DO_NOT_QUEUE")) result |= G_BUS_NAME_OWNER_FLAGS_DO_NOT_QUEUE; /* `DO_NOT_QUEUE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GBusNameWatcherFlags to OCaml flag list */
value Val_GioBusNameWatcherFlags(GBusNameWatcherFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_BUS_NAME_WATCHER_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_BUS_NAME_WATCHER_FLAGS_AUTO_START) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AUTO_START"))); /* `AUTO_START */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GBusNameWatcherFlags */
GBusNameWatcherFlags GioBusNameWatcherFlags_val(value list) {
  GBusNameWatcherFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_BUS_NAME_WATCHER_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("AUTO_START")) result |= G_BUS_NAME_WATCHER_FLAGS_AUTO_START; /* `AUTO_START */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GConverterFlags to OCaml flag list */
value Val_GioConverterFlags(GConverterFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_CONVERTER_NO_FLAGS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_CONVERTER_INPUT_AT_END) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INPUT_AT_END"))); /* `INPUT_AT_END */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_CONVERTER_FLUSH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FLUSH"))); /* `FLUSH */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GConverterFlags */
GConverterFlags GioConverterFlags_val(value list) {
  GConverterFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_CONVERTER_NO_FLAGS; /* `NONE */
    else if (tag == caml_hash_variant("INPUT_AT_END")) result |= G_CONVERTER_INPUT_AT_END; /* `INPUT_AT_END */
    else if (tag == caml_hash_variant("FLUSH")) result |= G_CONVERTER_FLUSH; /* `FLUSH */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusCallFlags to OCaml flag list */
value Val_GioDBusCallFlags(GDBusCallFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_CALL_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CALL_FLAGS_NO_AUTO_START) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_AUTO_START"))); /* `NO_AUTO_START */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CALL_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ALLOW_INTERACTIVE_AUTHORIZATION"))); /* `ALLOW_INTERACTIVE_AUTHORIZATION */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusCallFlags */
GDBusCallFlags GioDBusCallFlags_val(value list) {
  GDBusCallFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_CALL_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("NO_AUTO_START")) result |= G_DBUS_CALL_FLAGS_NO_AUTO_START; /* `NO_AUTO_START */
    else if (tag == caml_hash_variant("ALLOW_INTERACTIVE_AUTHORIZATION")) result |= G_DBUS_CALL_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION; /* `ALLOW_INTERACTIVE_AUTHORIZATION */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusCapabilityFlags to OCaml flag list */
value Val_GioDBusCapabilityFlags(GDBusCapabilityFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_CAPABILITY_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CAPABILITY_FLAGS_UNIX_FD_PASSING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("UNIX_FD_PASSING"))); /* `UNIX_FD_PASSING */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusCapabilityFlags */
GDBusCapabilityFlags GioDBusCapabilityFlags_val(value list) {
  GDBusCapabilityFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_CAPABILITY_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("UNIX_FD_PASSING")) result |= G_DBUS_CAPABILITY_FLAGS_UNIX_FD_PASSING; /* `UNIX_FD_PASSING */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusConnectionFlags to OCaml flag list */
value Val_GioDBusConnectionFlags(GDBusConnectionFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_CONNECTION_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AUTHENTICATION_CLIENT"))); /* `AUTHENTICATION_CLIENT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AUTHENTICATION_SERVER"))); /* `AUTHENTICATION_SERVER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AUTHENTICATION_ALLOW_ANONYMOUS"))); /* `AUTHENTICATION_ALLOW_ANONYMOUS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MESSAGE_BUS_CONNECTION"))); /* `MESSAGE_BUS_CONNECTION */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DELAY_MESSAGE_PROCESSING"))); /* `DELAY_MESSAGE_PROCESSING */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AUTHENTICATION_REQUIRE_SAME_USER"))); /* `AUTHENTICATION_REQUIRE_SAME_USER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_CONNECTION_FLAGS_CROSS_NAMESPACE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CROSS_NAMESPACE"))); /* `CROSS_NAMESPACE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusConnectionFlags */
GDBusConnectionFlags GioDBusConnectionFlags_val(value list) {
  GDBusConnectionFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_CONNECTION_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("AUTHENTICATION_CLIENT")) result |= G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT; /* `AUTHENTICATION_CLIENT */
    else if (tag == caml_hash_variant("AUTHENTICATION_SERVER")) result |= G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER; /* `AUTHENTICATION_SERVER */
    else if (tag == caml_hash_variant("AUTHENTICATION_ALLOW_ANONYMOUS")) result |= G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS; /* `AUTHENTICATION_ALLOW_ANONYMOUS */
    else if (tag == caml_hash_variant("MESSAGE_BUS_CONNECTION")) result |= G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION; /* `MESSAGE_BUS_CONNECTION */
    else if (tag == caml_hash_variant("DELAY_MESSAGE_PROCESSING")) result |= G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING; /* `DELAY_MESSAGE_PROCESSING */
    else if (tag == caml_hash_variant("AUTHENTICATION_REQUIRE_SAME_USER")) result |= G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER; /* `AUTHENTICATION_REQUIRE_SAME_USER */
    else if (tag == caml_hash_variant("CROSS_NAMESPACE")) result |= G_DBUS_CONNECTION_FLAGS_CROSS_NAMESPACE; /* `CROSS_NAMESPACE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusInterfaceSkeletonFlags to OCaml flag list */
value Val_GioDBusInterfaceSkeletonFlags(GDBusInterfaceSkeletonFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_INTERFACE_SKELETON_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_INTERFACE_SKELETON_FLAGS_HANDLE_METHOD_INVOCATIONS_IN_THREAD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("HANDLE_METHOD_INVOCATIONS_IN_THREAD"))); /* `HANDLE_METHOD_INVOCATIONS_IN_THREAD */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusInterfaceSkeletonFlags */
GDBusInterfaceSkeletonFlags GioDBusInterfaceSkeletonFlags_val(value list) {
  GDBusInterfaceSkeletonFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_INTERFACE_SKELETON_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("HANDLE_METHOD_INVOCATIONS_IN_THREAD")) result |= G_DBUS_INTERFACE_SKELETON_FLAGS_HANDLE_METHOD_INVOCATIONS_IN_THREAD; /* `HANDLE_METHOD_INVOCATIONS_IN_THREAD */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusMessageFlags to OCaml flag list */
value Val_GioDBusMessageFlags(GDBusMessageFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_MESSAGE_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_MESSAGE_FLAGS_NO_REPLY_EXPECTED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_REPLY_EXPECTED"))); /* `NO_REPLY_EXPECTED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_MESSAGE_FLAGS_NO_AUTO_START) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_AUTO_START"))); /* `NO_AUTO_START */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_MESSAGE_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ALLOW_INTERACTIVE_AUTHORIZATION"))); /* `ALLOW_INTERACTIVE_AUTHORIZATION */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusMessageFlags */
GDBusMessageFlags GioDBusMessageFlags_val(value list) {
  GDBusMessageFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_MESSAGE_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("NO_REPLY_EXPECTED")) result |= G_DBUS_MESSAGE_FLAGS_NO_REPLY_EXPECTED; /* `NO_REPLY_EXPECTED */
    else if (tag == caml_hash_variant("NO_AUTO_START")) result |= G_DBUS_MESSAGE_FLAGS_NO_AUTO_START; /* `NO_AUTO_START */
    else if (tag == caml_hash_variant("ALLOW_INTERACTIVE_AUTHORIZATION")) result |= G_DBUS_MESSAGE_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION; /* `ALLOW_INTERACTIVE_AUTHORIZATION */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusObjectManagerClientFlags to OCaml flag list */
value Val_GioDBusObjectManagerClientFlags(GDBusObjectManagerClientFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_DO_NOT_AUTO_START) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DO_NOT_AUTO_START"))); /* `DO_NOT_AUTO_START */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusObjectManagerClientFlags */
GDBusObjectManagerClientFlags GioDBusObjectManagerClientFlags_val(value list) {
  GDBusObjectManagerClientFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("DO_NOT_AUTO_START")) result |= G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_DO_NOT_AUTO_START; /* `DO_NOT_AUTO_START */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusPropertyInfoFlags to OCaml flag list */
value Val_GioDBusPropertyInfoFlags(GDBusPropertyInfoFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_PROPERTY_INFO_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_PROPERTY_INFO_FLAGS_READABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("READABLE"))); /* `READABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_PROPERTY_INFO_FLAGS_WRITABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WRITABLE"))); /* `WRITABLE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusPropertyInfoFlags */
GDBusPropertyInfoFlags GioDBusPropertyInfoFlags_val(value list) {
  GDBusPropertyInfoFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_PROPERTY_INFO_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("READABLE")) result |= G_DBUS_PROPERTY_INFO_FLAGS_READABLE; /* `READABLE */
    else if (tag == caml_hash_variant("WRITABLE")) result |= G_DBUS_PROPERTY_INFO_FLAGS_WRITABLE; /* `WRITABLE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusProxyFlags to OCaml flag list */
value Val_GioDBusProxyFlags(GDBusProxyFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_PROXY_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DO_NOT_LOAD_PROPERTIES"))); /* `DO_NOT_LOAD_PROPERTIES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DO_NOT_CONNECT_SIGNALS"))); /* `DO_NOT_CONNECT_SIGNALS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DO_NOT_AUTO_START"))); /* `DO_NOT_AUTO_START */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_PROXY_FLAGS_GET_INVALIDATED_PROPERTIES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("GET_INVALIDATED_PROPERTIES"))); /* `GET_INVALIDATED_PROPERTIES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START_AT_CONSTRUCTION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DO_NOT_AUTO_START_AT_CONSTRUCTION"))); /* `DO_NOT_AUTO_START_AT_CONSTRUCTION */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_PROXY_FLAGS_NO_MATCH_RULE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_MATCH_RULE"))); /* `NO_MATCH_RULE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusProxyFlags */
GDBusProxyFlags GioDBusProxyFlags_val(value list) {
  GDBusProxyFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_PROXY_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("DO_NOT_LOAD_PROPERTIES")) result |= G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES; /* `DO_NOT_LOAD_PROPERTIES */
    else if (tag == caml_hash_variant("DO_NOT_CONNECT_SIGNALS")) result |= G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS; /* `DO_NOT_CONNECT_SIGNALS */
    else if (tag == caml_hash_variant("DO_NOT_AUTO_START")) result |= G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START; /* `DO_NOT_AUTO_START */
    else if (tag == caml_hash_variant("GET_INVALIDATED_PROPERTIES")) result |= G_DBUS_PROXY_FLAGS_GET_INVALIDATED_PROPERTIES; /* `GET_INVALIDATED_PROPERTIES */
    else if (tag == caml_hash_variant("DO_NOT_AUTO_START_AT_CONSTRUCTION")) result |= G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START_AT_CONSTRUCTION; /* `DO_NOT_AUTO_START_AT_CONSTRUCTION */
    else if (tag == caml_hash_variant("NO_MATCH_RULE")) result |= G_DBUS_PROXY_FLAGS_NO_MATCH_RULE; /* `NO_MATCH_RULE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusSendMessageFlags to OCaml flag list */
value Val_GioDBusSendMessageFlags(GDBusSendMessageFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_SEND_MESSAGE_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRESERVE_SERIAL"))); /* `PRESERVE_SERIAL */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusSendMessageFlags */
GDBusSendMessageFlags GioDBusSendMessageFlags_val(value list) {
  GDBusSendMessageFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_SEND_MESSAGE_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("PRESERVE_SERIAL")) result |= G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL; /* `PRESERVE_SERIAL */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusServerFlags to OCaml flag list */
value Val_GioDBusServerFlags(GDBusServerFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_SERVER_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_SERVER_FLAGS_RUN_IN_THREAD) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RUN_IN_THREAD"))); /* `RUN_IN_THREAD */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_SERVER_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AUTHENTICATION_ALLOW_ANONYMOUS"))); /* `AUTHENTICATION_ALLOW_ANONYMOUS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("AUTHENTICATION_REQUIRE_SAME_USER"))); /* `AUTHENTICATION_REQUIRE_SAME_USER */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusServerFlags */
GDBusServerFlags GioDBusServerFlags_val(value list) {
  GDBusServerFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_SERVER_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("RUN_IN_THREAD")) result |= G_DBUS_SERVER_FLAGS_RUN_IN_THREAD; /* `RUN_IN_THREAD */
    else if (tag == caml_hash_variant("AUTHENTICATION_ALLOW_ANONYMOUS")) result |= G_DBUS_SERVER_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS; /* `AUTHENTICATION_ALLOW_ANONYMOUS */
    else if (tag == caml_hash_variant("AUTHENTICATION_REQUIRE_SAME_USER")) result |= G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER; /* `AUTHENTICATION_REQUIRE_SAME_USER */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusSignalFlags to OCaml flag list */
value Val_GioDBusSignalFlags(GDBusSignalFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_SIGNAL_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_SIGNAL_FLAGS_NO_MATCH_RULE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_MATCH_RULE"))); /* `NO_MATCH_RULE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_SIGNAL_FLAGS_MATCH_ARG0_NAMESPACE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MATCH_ARG0_NAMESPACE"))); /* `MATCH_ARG0_NAMESPACE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_SIGNAL_FLAGS_MATCH_ARG0_PATH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MATCH_ARG0_PATH"))); /* `MATCH_ARG0_PATH */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusSignalFlags */
GDBusSignalFlags GioDBusSignalFlags_val(value list) {
  GDBusSignalFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_SIGNAL_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("NO_MATCH_RULE")) result |= G_DBUS_SIGNAL_FLAGS_NO_MATCH_RULE; /* `NO_MATCH_RULE */
    else if (tag == caml_hash_variant("MATCH_ARG0_NAMESPACE")) result |= G_DBUS_SIGNAL_FLAGS_MATCH_ARG0_NAMESPACE; /* `MATCH_ARG0_NAMESPACE */
    else if (tag == caml_hash_variant("MATCH_ARG0_PATH")) result |= G_DBUS_SIGNAL_FLAGS_MATCH_ARG0_PATH; /* `MATCH_ARG0_PATH */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDBusSubtreeFlags to OCaml flag list */
value Val_GioDBusSubtreeFlags(GDBusSubtreeFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DBUS_SUBTREE_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_DBUS_SUBTREE_FLAGS_DISPATCH_TO_UNENUMERATED_NODES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DISPATCH_TO_UNENUMERATED_NODES"))); /* `DISPATCH_TO_UNENUMERATED_NODES */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDBusSubtreeFlags */
GDBusSubtreeFlags GioDBusSubtreeFlags_val(value list) {
  GDBusSubtreeFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DBUS_SUBTREE_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("DISPATCH_TO_UNENUMERATED_NODES")) result |= G_DBUS_SUBTREE_FLAGS_DISPATCH_TO_UNENUMERATED_NODES; /* `DISPATCH_TO_UNENUMERATED_NODES */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GDriveStartFlags to OCaml flag list */
value Val_GioDriveStartFlags(GDriveStartFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_DRIVE_START_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GDriveStartFlags */
GDriveStartFlags GioDriveStartFlags_val(value list) {
  GDriveStartFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_DRIVE_START_NONE; /* `NONE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GFileAttributeInfoFlags to OCaml flag list */
value Val_GioFileAttributeInfoFlags(GFileAttributeInfoFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_FILE_ATTRIBUTE_INFO_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_ATTRIBUTE_INFO_COPY_WITH_FILE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("COPY_WITH_FILE"))); /* `COPY_WITH_FILE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_ATTRIBUTE_INFO_COPY_WHEN_MOVED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("COPY_WHEN_MOVED"))); /* `COPY_WHEN_MOVED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GFileAttributeInfoFlags */
GFileAttributeInfoFlags GioFileAttributeInfoFlags_val(value list) {
  GFileAttributeInfoFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_FILE_ATTRIBUTE_INFO_NONE; /* `NONE */
    else if (tag == caml_hash_variant("COPY_WITH_FILE")) result |= G_FILE_ATTRIBUTE_INFO_COPY_WITH_FILE; /* `COPY_WITH_FILE */
    else if (tag == caml_hash_variant("COPY_WHEN_MOVED")) result |= G_FILE_ATTRIBUTE_INFO_COPY_WHEN_MOVED; /* `COPY_WHEN_MOVED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GFileCopyFlags to OCaml flag list */
value Val_GioFileCopyFlags(GFileCopyFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_FILE_COPY_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_COPY_OVERWRITE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("OVERWRITE"))); /* `OVERWRITE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_COPY_BACKUP) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BACKUP"))); /* `BACKUP */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_COPY_NOFOLLOW_SYMLINKS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NOFOLLOW_SYMLINKS"))); /* `NOFOLLOW_SYMLINKS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_COPY_ALL_METADATA) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("ALL_METADATA"))); /* `ALL_METADATA */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_COPY_NO_FALLBACK_FOR_MOVE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_FALLBACK_FOR_MOVE"))); /* `NO_FALLBACK_FOR_MOVE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_COPY_TARGET_DEFAULT_PERMS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TARGET_DEFAULT_PERMS"))); /* `TARGET_DEFAULT_PERMS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_COPY_TARGET_DEFAULT_MODIFIED_TIME) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("TARGET_DEFAULT_MODIFIED_TIME"))); /* `TARGET_DEFAULT_MODIFIED_TIME */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GFileCopyFlags */
GFileCopyFlags GioFileCopyFlags_val(value list) {
  GFileCopyFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_FILE_COPY_NONE; /* `NONE */
    else if (tag == caml_hash_variant("OVERWRITE")) result |= G_FILE_COPY_OVERWRITE; /* `OVERWRITE */
    else if (tag == caml_hash_variant("BACKUP")) result |= G_FILE_COPY_BACKUP; /* `BACKUP */
    else if (tag == caml_hash_variant("NOFOLLOW_SYMLINKS")) result |= G_FILE_COPY_NOFOLLOW_SYMLINKS; /* `NOFOLLOW_SYMLINKS */
    else if (tag == caml_hash_variant("ALL_METADATA")) result |= G_FILE_COPY_ALL_METADATA; /* `ALL_METADATA */
    else if (tag == caml_hash_variant("NO_FALLBACK_FOR_MOVE")) result |= G_FILE_COPY_NO_FALLBACK_FOR_MOVE; /* `NO_FALLBACK_FOR_MOVE */
    else if (tag == caml_hash_variant("TARGET_DEFAULT_PERMS")) result |= G_FILE_COPY_TARGET_DEFAULT_PERMS; /* `TARGET_DEFAULT_PERMS */
    else if (tag == caml_hash_variant("TARGET_DEFAULT_MODIFIED_TIME")) result |= G_FILE_COPY_TARGET_DEFAULT_MODIFIED_TIME; /* `TARGET_DEFAULT_MODIFIED_TIME */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GFileCreateFlags to OCaml flag list */
value Val_GioFileCreateFlags(GFileCreateFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_FILE_CREATE_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_CREATE_PRIVATE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PRIVATE"))); /* `PRIVATE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_CREATE_REPLACE_DESTINATION) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("REPLACE_DESTINATION"))); /* `REPLACE_DESTINATION */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GFileCreateFlags */
GFileCreateFlags GioFileCreateFlags_val(value list) {
  GFileCreateFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_FILE_CREATE_NONE; /* `NONE */
    else if (tag == caml_hash_variant("PRIVATE")) result |= G_FILE_CREATE_PRIVATE; /* `PRIVATE */
    else if (tag == caml_hash_variant("REPLACE_DESTINATION")) result |= G_FILE_CREATE_REPLACE_DESTINATION; /* `REPLACE_DESTINATION */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GFileMeasureFlags to OCaml flag list */
value Val_GioFileMeasureFlags(GFileMeasureFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_FILE_MEASURE_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_MEASURE_REPORT_ANY_ERROR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("REPORT_ANY_ERROR"))); /* `REPORT_ANY_ERROR */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_MEASURE_APPARENT_SIZE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("APPARENT_SIZE"))); /* `APPARENT_SIZE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_MEASURE_NO_XDEV) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_XDEV"))); /* `NO_XDEV */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GFileMeasureFlags */
GFileMeasureFlags GioFileMeasureFlags_val(value list) {
  GFileMeasureFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_FILE_MEASURE_NONE; /* `NONE */
    else if (tag == caml_hash_variant("REPORT_ANY_ERROR")) result |= G_FILE_MEASURE_REPORT_ANY_ERROR; /* `REPORT_ANY_ERROR */
    else if (tag == caml_hash_variant("APPARENT_SIZE")) result |= G_FILE_MEASURE_APPARENT_SIZE; /* `APPARENT_SIZE */
    else if (tag == caml_hash_variant("NO_XDEV")) result |= G_FILE_MEASURE_NO_XDEV; /* `NO_XDEV */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GFileMonitorFlags to OCaml flag list */
value Val_GioFileMonitorFlags(GFileMonitorFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_FILE_MONITOR_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_MONITOR_WATCH_MOUNTS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WATCH_MOUNTS"))); /* `WATCH_MOUNTS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_MONITOR_SEND_MOVED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SEND_MOVED"))); /* `SEND_MOVED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_MONITOR_WATCH_HARD_LINKS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WATCH_HARD_LINKS"))); /* `WATCH_HARD_LINKS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_MONITOR_WATCH_MOVES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WATCH_MOVES"))); /* `WATCH_MOVES */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GFileMonitorFlags */
GFileMonitorFlags GioFileMonitorFlags_val(value list) {
  GFileMonitorFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_FILE_MONITOR_NONE; /* `NONE */
    else if (tag == caml_hash_variant("WATCH_MOUNTS")) result |= G_FILE_MONITOR_WATCH_MOUNTS; /* `WATCH_MOUNTS */
    else if (tag == caml_hash_variant("SEND_MOVED")) result |= G_FILE_MONITOR_SEND_MOVED; /* `SEND_MOVED */
    else if (tag == caml_hash_variant("WATCH_HARD_LINKS")) result |= G_FILE_MONITOR_WATCH_HARD_LINKS; /* `WATCH_HARD_LINKS */
    else if (tag == caml_hash_variant("WATCH_MOVES")) result |= G_FILE_MONITOR_WATCH_MOVES; /* `WATCH_MOVES */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GFileQueryInfoFlags to OCaml flag list */
value Val_GioFileQueryInfoFlags(GFileQueryInfoFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_FILE_QUERY_INFO_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NOFOLLOW_SYMLINKS"))); /* `NOFOLLOW_SYMLINKS */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GFileQueryInfoFlags */
GFileQueryInfoFlags GioFileQueryInfoFlags_val(value list) {
  GFileQueryInfoFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_FILE_QUERY_INFO_NONE; /* `NONE */
    else if (tag == caml_hash_variant("NOFOLLOW_SYMLINKS")) result |= G_FILE_QUERY_INFO_NOFOLLOW_SYMLINKS; /* `NOFOLLOW_SYMLINKS */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GIOStreamSpliceFlags to OCaml flag list */
value Val_GioIOStreamSpliceFlags(GIOStreamSpliceFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_IO_STREAM_SPLICE_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_IO_STREAM_SPLICE_CLOSE_STREAM1) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CLOSE_STREAM1"))); /* `CLOSE_STREAM1 */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_IO_STREAM_SPLICE_CLOSE_STREAM2) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CLOSE_STREAM2"))); /* `CLOSE_STREAM2 */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_IO_STREAM_SPLICE_WAIT_FOR_BOTH) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WAIT_FOR_BOTH"))); /* `WAIT_FOR_BOTH */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GIOStreamSpliceFlags */
GIOStreamSpliceFlags GioIOStreamSpliceFlags_val(value list) {
  GIOStreamSpliceFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_IO_STREAM_SPLICE_NONE; /* `NONE */
    else if (tag == caml_hash_variant("CLOSE_STREAM1")) result |= G_IO_STREAM_SPLICE_CLOSE_STREAM1; /* `CLOSE_STREAM1 */
    else if (tag == caml_hash_variant("CLOSE_STREAM2")) result |= G_IO_STREAM_SPLICE_CLOSE_STREAM2; /* `CLOSE_STREAM2 */
    else if (tag == caml_hash_variant("WAIT_FOR_BOTH")) result |= G_IO_STREAM_SPLICE_WAIT_FOR_BOTH; /* `WAIT_FOR_BOTH */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GMountMountFlags to OCaml flag list */
value Val_GioMountMountFlags(GMountMountFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_MOUNT_MOUNT_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GMountMountFlags */
GMountMountFlags GioMountMountFlags_val(value list) {
  GMountMountFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_MOUNT_MOUNT_NONE; /* `NONE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GMountUnmountFlags to OCaml flag list */
value Val_GioMountUnmountFlags(GMountUnmountFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_MOUNT_UNMOUNT_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_MOUNT_UNMOUNT_FORCE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FORCE"))); /* `FORCE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GMountUnmountFlags */
GMountUnmountFlags GioMountUnmountFlags_val(value list) {
  GMountUnmountFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_MOUNT_UNMOUNT_NONE; /* `NONE */
    else if (tag == caml_hash_variant("FORCE")) result |= G_MOUNT_UNMOUNT_FORCE; /* `FORCE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GOutputStreamSpliceFlags to OCaml flag list */
value Val_GioOutputStreamSpliceFlags(GOutputStreamSpliceFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_OUTPUT_STREAM_SPLICE_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_OUTPUT_STREAM_SPLICE_CLOSE_SOURCE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CLOSE_SOURCE"))); /* `CLOSE_SOURCE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_OUTPUT_STREAM_SPLICE_CLOSE_TARGET) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("CLOSE_TARGET"))); /* `CLOSE_TARGET */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GOutputStreamSpliceFlags */
GOutputStreamSpliceFlags GioOutputStreamSpliceFlags_val(value list) {
  GOutputStreamSpliceFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_OUTPUT_STREAM_SPLICE_NONE; /* `NONE */
    else if (tag == caml_hash_variant("CLOSE_SOURCE")) result |= G_OUTPUT_STREAM_SPLICE_CLOSE_SOURCE; /* `CLOSE_SOURCE */
    else if (tag == caml_hash_variant("CLOSE_TARGET")) result |= G_OUTPUT_STREAM_SPLICE_CLOSE_TARGET; /* `CLOSE_TARGET */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GResolverNameLookupFlags to OCaml flag list */
value Val_GioResolverNameLookupFlags(GResolverNameLookupFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_RESOLVER_NAME_LOOKUP_FLAGS_DEFAULT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEFAULT"))); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_RESOLVER_NAME_LOOKUP_FLAGS_IPV4_ONLY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("IPV4_ONLY"))); /* `IPV4_ONLY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_RESOLVER_NAME_LOOKUP_FLAGS_IPV6_ONLY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("IPV6_ONLY"))); /* `IPV6_ONLY */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GResolverNameLookupFlags */
GResolverNameLookupFlags GioResolverNameLookupFlags_val(value list) {
  GResolverNameLookupFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("DEFAULT")) result |= G_RESOLVER_NAME_LOOKUP_FLAGS_DEFAULT; /* `DEFAULT */
    else if (tag == caml_hash_variant("IPV4_ONLY")) result |= G_RESOLVER_NAME_LOOKUP_FLAGS_IPV4_ONLY; /* `IPV4_ONLY */
    else if (tag == caml_hash_variant("IPV6_ONLY")) result |= G_RESOLVER_NAME_LOOKUP_FLAGS_IPV6_ONLY; /* `IPV6_ONLY */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GResourceFlags to OCaml flag list */
value Val_GioResourceFlags(GResourceFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_RESOURCE_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_RESOURCE_FLAGS_COMPRESSED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("COMPRESSED"))); /* `COMPRESSED */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GResourceFlags */
GResourceFlags GioResourceFlags_val(value list) {
  GResourceFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_RESOURCE_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("COMPRESSED")) result |= G_RESOURCE_FLAGS_COMPRESSED; /* `COMPRESSED */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GResourceLookupFlags to OCaml flag list */
value Val_GioResourceLookupFlags(GResourceLookupFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_RESOURCE_LOOKUP_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GResourceLookupFlags */
GResourceLookupFlags GioResourceLookupFlags_val(value list) {
  GResourceLookupFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_RESOURCE_LOOKUP_FLAGS_NONE; /* `NONE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GSettingsBindFlags to OCaml flag list */
value Val_GioSettingsBindFlags(GSettingsBindFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_SETTINGS_BIND_DEFAULT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DEFAULT"))); /* `DEFAULT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SETTINGS_BIND_GET) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("GET"))); /* `GET */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SETTINGS_BIND_SET) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SET"))); /* `SET */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SETTINGS_BIND_NO_SENSITIVITY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_SENSITIVITY"))); /* `NO_SENSITIVITY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SETTINGS_BIND_GET_NO_CHANGES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("GET_NO_CHANGES"))); /* `GET_NO_CHANGES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SETTINGS_BIND_INVERT_BOOLEAN) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INVERT_BOOLEAN"))); /* `INVERT_BOOLEAN */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GSettingsBindFlags */
GSettingsBindFlags GioSettingsBindFlags_val(value list) {
  GSettingsBindFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("DEFAULT")) result |= G_SETTINGS_BIND_DEFAULT; /* `DEFAULT */
    else if (tag == caml_hash_variant("GET")) result |= G_SETTINGS_BIND_GET; /* `GET */
    else if (tag == caml_hash_variant("SET")) result |= G_SETTINGS_BIND_SET; /* `SET */
    else if (tag == caml_hash_variant("NO_SENSITIVITY")) result |= G_SETTINGS_BIND_NO_SENSITIVITY; /* `NO_SENSITIVITY */
    else if (tag == caml_hash_variant("GET_NO_CHANGES")) result |= G_SETTINGS_BIND_GET_NO_CHANGES; /* `GET_NO_CHANGES */
    else if (tag == caml_hash_variant("INVERT_BOOLEAN")) result |= G_SETTINGS_BIND_INVERT_BOOLEAN; /* `INVERT_BOOLEAN */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GSocketMsgFlags to OCaml flag list */
value Val_GioSocketMsgFlags(GSocketMsgFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_SOCKET_MSG_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SOCKET_MSG_OOB) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("OOB"))); /* `OOB */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SOCKET_MSG_PEEK) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PEEK"))); /* `PEEK */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SOCKET_MSG_DONTROUTE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("DONTROUTE"))); /* `DONTROUTE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GSocketMsgFlags */
GSocketMsgFlags GioSocketMsgFlags_val(value list) {
  GSocketMsgFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_SOCKET_MSG_NONE; /* `NONE */
    else if (tag == caml_hash_variant("OOB")) result |= G_SOCKET_MSG_OOB; /* `OOB */
    else if (tag == caml_hash_variant("PEEK")) result |= G_SOCKET_MSG_PEEK; /* `PEEK */
    else if (tag == caml_hash_variant("DONTROUTE")) result |= G_SOCKET_MSG_DONTROUTE; /* `DONTROUTE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GSubprocessFlags to OCaml flag list */
value Val_GioSubprocessFlags(GSubprocessFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_SUBPROCESS_FLAGS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_STDIN_PIPE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STDIN_PIPE"))); /* `STDIN_PIPE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_STDIN_INHERIT) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STDIN_INHERIT"))); /* `STDIN_INHERIT */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_STDOUT_PIPE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STDOUT_PIPE"))); /* `STDOUT_PIPE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_STDOUT_SILENCE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STDOUT_SILENCE"))); /* `STDOUT_SILENCE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_STDERR_PIPE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STDERR_PIPE"))); /* `STDERR_PIPE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_STDERR_SILENCE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STDERR_SILENCE"))); /* `STDERR_SILENCE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_STDERR_MERGE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("STDERR_MERGE"))); /* `STDERR_MERGE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_INHERIT_FDS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INHERIT_FDS"))); /* `INHERIT_FDS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_SUBPROCESS_FLAGS_SEARCH_PATH_FROM_ENVP) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SEARCH_PATH_FROM_ENVP"))); /* `SEARCH_PATH_FROM_ENVP */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GSubprocessFlags */
GSubprocessFlags GioSubprocessFlags_val(value list) {
  GSubprocessFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_SUBPROCESS_FLAGS_NONE; /* `NONE */
    else if (tag == caml_hash_variant("STDIN_PIPE")) result |= G_SUBPROCESS_FLAGS_STDIN_PIPE; /* `STDIN_PIPE */
    else if (tag == caml_hash_variant("STDIN_INHERIT")) result |= G_SUBPROCESS_FLAGS_STDIN_INHERIT; /* `STDIN_INHERIT */
    else if (tag == caml_hash_variant("STDOUT_PIPE")) result |= G_SUBPROCESS_FLAGS_STDOUT_PIPE; /* `STDOUT_PIPE */
    else if (tag == caml_hash_variant("STDOUT_SILENCE")) result |= G_SUBPROCESS_FLAGS_STDOUT_SILENCE; /* `STDOUT_SILENCE */
    else if (tag == caml_hash_variant("STDERR_PIPE")) result |= G_SUBPROCESS_FLAGS_STDERR_PIPE; /* `STDERR_PIPE */
    else if (tag == caml_hash_variant("STDERR_SILENCE")) result |= G_SUBPROCESS_FLAGS_STDERR_SILENCE; /* `STDERR_SILENCE */
    else if (tag == caml_hash_variant("STDERR_MERGE")) result |= G_SUBPROCESS_FLAGS_STDERR_MERGE; /* `STDERR_MERGE */
    else if (tag == caml_hash_variant("INHERIT_FDS")) result |= G_SUBPROCESS_FLAGS_INHERIT_FDS; /* `INHERIT_FDS */
    else if (tag == caml_hash_variant("SEARCH_PATH_FROM_ENVP")) result |= G_SUBPROCESS_FLAGS_SEARCH_PATH_FROM_ENVP; /* `SEARCH_PATH_FROM_ENVP */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GTestDBusFlags to OCaml flag list */
value Val_GioTestDBusFlags(GTestDBusFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_TEST_DBUS_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GTestDBusFlags */
GTestDBusFlags GioTestDBusFlags_val(value list) {
  GTestDBusFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_TEST_DBUS_NONE; /* `NONE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GTlsCertificateFlags to OCaml flag list */
value Val_GioTlsCertificateFlags(GTlsCertificateFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_TLS_CERTIFICATE_NO_FLAGS) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NO_FLAGS"))); /* `NO_FLAGS */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_CERTIFICATE_UNKNOWN_CA) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("UNKNOWN_CA"))); /* `UNKNOWN_CA */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_CERTIFICATE_BAD_IDENTITY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("BAD_IDENTITY"))); /* `BAD_IDENTITY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_CERTIFICATE_NOT_ACTIVATED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NOT_ACTIVATED"))); /* `NOT_ACTIVATED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_CERTIFICATE_EXPIRED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("EXPIRED"))); /* `EXPIRED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_CERTIFICATE_REVOKED) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("REVOKED"))); /* `REVOKED */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_CERTIFICATE_INSECURE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("INSECURE"))); /* `INSECURE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_CERTIFICATE_GENERIC_ERROR) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("GENERIC_ERROR"))); /* `GENERIC_ERROR */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_CERTIFICATE_VALIDATE_ALL) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("VALIDATE_ALL"))); /* `VALIDATE_ALL */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GTlsCertificateFlags */
GTlsCertificateFlags GioTlsCertificateFlags_val(value list) {
  GTlsCertificateFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NO_FLAGS")) result |= G_TLS_CERTIFICATE_NO_FLAGS; /* `NO_FLAGS */
    else if (tag == caml_hash_variant("UNKNOWN_CA")) result |= G_TLS_CERTIFICATE_UNKNOWN_CA; /* `UNKNOWN_CA */
    else if (tag == caml_hash_variant("BAD_IDENTITY")) result |= G_TLS_CERTIFICATE_BAD_IDENTITY; /* `BAD_IDENTITY */
    else if (tag == caml_hash_variant("NOT_ACTIVATED")) result |= G_TLS_CERTIFICATE_NOT_ACTIVATED; /* `NOT_ACTIVATED */
    else if (tag == caml_hash_variant("EXPIRED")) result |= G_TLS_CERTIFICATE_EXPIRED; /* `EXPIRED */
    else if (tag == caml_hash_variant("REVOKED")) result |= G_TLS_CERTIFICATE_REVOKED; /* `REVOKED */
    else if (tag == caml_hash_variant("INSECURE")) result |= G_TLS_CERTIFICATE_INSECURE; /* `INSECURE */
    else if (tag == caml_hash_variant("GENERIC_ERROR")) result |= G_TLS_CERTIFICATE_GENERIC_ERROR; /* `GENERIC_ERROR */
    else if (tag == caml_hash_variant("VALIDATE_ALL")) result |= G_TLS_CERTIFICATE_VALIDATE_ALL; /* `VALIDATE_ALL */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GTlsDatabaseVerifyFlags to OCaml flag list */
value Val_GioTlsDatabaseVerifyFlags(GTlsDatabaseVerifyFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_TLS_DATABASE_VERIFY_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GTlsDatabaseVerifyFlags */
GTlsDatabaseVerifyFlags GioTlsDatabaseVerifyFlags_val(value list) {
  GTlsDatabaseVerifyFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_TLS_DATABASE_VERIFY_NONE; /* `NONE */
    list = Field(list, 1);
  }
  return result;
}

/* Convert GTlsPasswordFlags to OCaml flag list */
value Val_GioTlsPasswordFlags(GTlsPasswordFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & G_TLS_PASSWORD_NONE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("NONE"))); /* `NONE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_PASSWORD_RETRY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("RETRY"))); /* `RETRY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_PASSWORD_MANY_TRIES) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("MANY_TRIES"))); /* `MANY_TRIES */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_PASSWORD_FINAL_TRY) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("FINAL_TRY"))); /* `FINAL_TRY */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_PASSWORD_PKCS11_USER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PKCS11_USER"))); /* `PKCS11_USER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_PASSWORD_PKCS11_SECURITY_OFFICER) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PKCS11_SECURITY_OFFICER"))); /* `PKCS11_SECURITY_OFFICER */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & G_TLS_PASSWORD_PKCS11_CONTEXT_SPECIFIC) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("PKCS11_CONTEXT_SPECIFIC"))); /* `PKCS11_CONTEXT_SPECIFIC */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GTlsPasswordFlags */
GTlsPasswordFlags GioTlsPasswordFlags_val(value list) {
  GTlsPasswordFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("NONE")) result |= G_TLS_PASSWORD_NONE; /* `NONE */
    else if (tag == caml_hash_variant("RETRY")) result |= G_TLS_PASSWORD_RETRY; /* `RETRY */
    else if (tag == caml_hash_variant("MANY_TRIES")) result |= G_TLS_PASSWORD_MANY_TRIES; /* `MANY_TRIES */
    else if (tag == caml_hash_variant("FINAL_TRY")) result |= G_TLS_PASSWORD_FINAL_TRY; /* `FINAL_TRY */
    else if (tag == caml_hash_variant("PKCS11_USER")) result |= G_TLS_PASSWORD_PKCS11_USER; /* `PKCS11_USER */
    else if (tag == caml_hash_variant("PKCS11_SECURITY_OFFICER")) result |= G_TLS_PASSWORD_PKCS11_SECURITY_OFFICER; /* `PKCS11_SECURITY_OFFICER */
    else if (tag == caml_hash_variant("PKCS11_CONTEXT_SPECIFIC")) result |= G_TLS_PASSWORD_PKCS11_CONTEXT_SPECIFIC; /* `PKCS11_CONTEXT_SPECIFIC */
    list = Field(list, 1);
  }
  return result;
}

