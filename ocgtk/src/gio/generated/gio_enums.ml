(* GENERATED CODE - DO NOT EDIT *)
(* Gio Enumeration and Bitfield Converters *)

type bustype = [ `STARTER | `NONE | `SYSTEM | `SESSION ]

let bustype_of_int n =
  match n with
  | -1 -> `STARTER
  | 0 -> `NONE
  | 1 -> `SYSTEM
  | 2 -> `SESSION
  | n -> failwith (Printf.sprintf "BusType: unknown int %d" n)

let bustype_to_int v =
  match v with `STARTER -> -1 | `NONE -> 0 | `SYSTEM -> 1 | `SESSION -> 2

type converterresult = [ `ERROR | `CONVERTED | `FINISHED | `FLUSHED ]

let converterresult_of_int n =
  match n with
  | 0 -> `ERROR
  | 1 -> `CONVERTED
  | 2 -> `FINISHED
  | 3 -> `FLUSHED
  | n -> failwith (Printf.sprintf "ConverterResult: unknown int %d" n)

let converterresult_to_int v =
  match v with `ERROR -> 0 | `CONVERTED -> 1 | `FINISHED -> 2 | `FLUSHED -> 3

type credentialstype =
  [ `INVALID
  | `LINUX_UCRED
  | `FREEBSD_CMSGCRED
  | `OPENBSD_SOCKPEERCRED
  | `SOLARIS_UCRED
  | `NETBSD_UNPCBID
  | `APPLE_XUCRED
  | `WIN32_PID ]

let credentialstype_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `LINUX_UCRED
  | 2 -> `FREEBSD_CMSGCRED
  | 3 -> `OPENBSD_SOCKPEERCRED
  | 4 -> `SOLARIS_UCRED
  | 5 -> `NETBSD_UNPCBID
  | 6 -> `APPLE_XUCRED
  | 7 -> `WIN32_PID
  | n -> failwith (Printf.sprintf "CredentialsType: unknown int %d" n)

let credentialstype_to_int v =
  match v with
  | `INVALID -> 0
  | `LINUX_UCRED -> 1
  | `FREEBSD_CMSGCRED -> 2
  | `OPENBSD_SOCKPEERCRED -> 3
  | `SOLARIS_UCRED -> 4
  | `NETBSD_UNPCBID -> 5
  | `APPLE_XUCRED -> 6
  | `WIN32_PID -> 7

type dbuserror =
  [ `FAILED
  | `NO_MEMORY
  | `SERVICE_UNKNOWN
  | `NAME_HAS_NO_OWNER
  | `NO_REPLY
  | `IO_ERROR
  | `BAD_ADDRESS
  | `NOT_SUPPORTED
  | `LIMITS_EXCEEDED
  | `ACCESS_DENIED
  | `AUTH_FAILED
  | `NO_SERVER
  | `TIMEOUT
  | `NO_NETWORK
  | `ADDRESS_IN_USE
  | `DISCONNECTED
  | `INVALID_ARGS
  | `FILE_NOT_FOUND
  | `FILE_EXISTS
  | `UNKNOWN_METHOD
  | `TIMED_OUT
  | `MATCH_RULE_NOT_FOUND
  | `MATCH_RULE_INVALID
  | `SPAWN_EXEC_FAILED
  | `SPAWN_FORK_FAILED
  | `SPAWN_CHILD_EXITED
  | `SPAWN_CHILD_SIGNALED
  | `SPAWN_FAILED
  | `SPAWN_SETUP_FAILED
  | `SPAWN_CONFIG_INVALID
  | `SPAWN_SERVICE_INVALID
  | `SPAWN_SERVICE_NOT_FOUND
  | `SPAWN_PERMISSIONS_INVALID
  | `SPAWN_FILE_INVALID
  | `SPAWN_NO_MEMORY
  | `UNIX_PROCESS_ID_UNKNOWN
  | `INVALID_SIGNATURE
  | `INVALID_FILE_CONTENT
  | `SELINUX_SECURITY_CONTEXT_UNKNOWN
  | `ADT_AUDIT_DATA_UNKNOWN
  | `OBJECT_PATH_IN_USE
  | `UNKNOWN_OBJECT
  | `UNKNOWN_INTERFACE
  | `UNKNOWN_PROPERTY
  | `PROPERTY_READ_ONLY ]

let dbuserror_of_int n =
  match n with
  | 0 -> `FAILED
  | 1 -> `NO_MEMORY
  | 2 -> `SERVICE_UNKNOWN
  | 3 -> `NAME_HAS_NO_OWNER
  | 4 -> `NO_REPLY
  | 5 -> `IO_ERROR
  | 6 -> `BAD_ADDRESS
  | 7 -> `NOT_SUPPORTED
  | 8 -> `LIMITS_EXCEEDED
  | 9 -> `ACCESS_DENIED
  | 10 -> `AUTH_FAILED
  | 11 -> `NO_SERVER
  | 12 -> `TIMEOUT
  | 13 -> `NO_NETWORK
  | 14 -> `ADDRESS_IN_USE
  | 15 -> `DISCONNECTED
  | 16 -> `INVALID_ARGS
  | 17 -> `FILE_NOT_FOUND
  | 18 -> `FILE_EXISTS
  | 19 -> `UNKNOWN_METHOD
  | 20 -> `TIMED_OUT
  | 21 -> `MATCH_RULE_NOT_FOUND
  | 22 -> `MATCH_RULE_INVALID
  | 23 -> `SPAWN_EXEC_FAILED
  | 24 -> `SPAWN_FORK_FAILED
  | 25 -> `SPAWN_CHILD_EXITED
  | 26 -> `SPAWN_CHILD_SIGNALED
  | 27 -> `SPAWN_FAILED
  | 28 -> `SPAWN_SETUP_FAILED
  | 29 -> `SPAWN_CONFIG_INVALID
  | 30 -> `SPAWN_SERVICE_INVALID
  | 31 -> `SPAWN_SERVICE_NOT_FOUND
  | 32 -> `SPAWN_PERMISSIONS_INVALID
  | 33 -> `SPAWN_FILE_INVALID
  | 34 -> `SPAWN_NO_MEMORY
  | 35 -> `UNIX_PROCESS_ID_UNKNOWN
  | 36 -> `INVALID_SIGNATURE
  | 37 -> `INVALID_FILE_CONTENT
  | 38 -> `SELINUX_SECURITY_CONTEXT_UNKNOWN
  | 39 -> `ADT_AUDIT_DATA_UNKNOWN
  | 40 -> `OBJECT_PATH_IN_USE
  | 41 -> `UNKNOWN_OBJECT
  | 42 -> `UNKNOWN_INTERFACE
  | 43 -> `UNKNOWN_PROPERTY
  | 44 -> `PROPERTY_READ_ONLY
  | n -> failwith (Printf.sprintf "DBusError: unknown int %d" n)

let dbuserror_to_int v =
  match v with
  | `FAILED -> 0
  | `NO_MEMORY -> 1
  | `SERVICE_UNKNOWN -> 2
  | `NAME_HAS_NO_OWNER -> 3
  | `NO_REPLY -> 4
  | `IO_ERROR -> 5
  | `BAD_ADDRESS -> 6
  | `NOT_SUPPORTED -> 7
  | `LIMITS_EXCEEDED -> 8
  | `ACCESS_DENIED -> 9
  | `AUTH_FAILED -> 10
  | `NO_SERVER -> 11
  | `TIMEOUT -> 12
  | `NO_NETWORK -> 13
  | `ADDRESS_IN_USE -> 14
  | `DISCONNECTED -> 15
  | `INVALID_ARGS -> 16
  | `FILE_NOT_FOUND -> 17
  | `FILE_EXISTS -> 18
  | `UNKNOWN_METHOD -> 19
  | `TIMED_OUT -> 20
  | `MATCH_RULE_NOT_FOUND -> 21
  | `MATCH_RULE_INVALID -> 22
  | `SPAWN_EXEC_FAILED -> 23
  | `SPAWN_FORK_FAILED -> 24
  | `SPAWN_CHILD_EXITED -> 25
  | `SPAWN_CHILD_SIGNALED -> 26
  | `SPAWN_FAILED -> 27
  | `SPAWN_SETUP_FAILED -> 28
  | `SPAWN_CONFIG_INVALID -> 29
  | `SPAWN_SERVICE_INVALID -> 30
  | `SPAWN_SERVICE_NOT_FOUND -> 31
  | `SPAWN_PERMISSIONS_INVALID -> 32
  | `SPAWN_FILE_INVALID -> 33
  | `SPAWN_NO_MEMORY -> 34
  | `UNIX_PROCESS_ID_UNKNOWN -> 35
  | `INVALID_SIGNATURE -> 36
  | `INVALID_FILE_CONTENT -> 37
  | `SELINUX_SECURITY_CONTEXT_UNKNOWN -> 38
  | `ADT_AUDIT_DATA_UNKNOWN -> 39
  | `OBJECT_PATH_IN_USE -> 40
  | `UNKNOWN_OBJECT -> 41
  | `UNKNOWN_INTERFACE -> 42
  | `UNKNOWN_PROPERTY -> 43
  | `PROPERTY_READ_ONLY -> 44

type dbusmessagebyteorder = [ `BIG_ENDIAN | `LITTLE_ENDIAN ]

let dbusmessagebyteorder_of_int n =
  match n with
  | 66 -> `BIG_ENDIAN
  | 108 -> `LITTLE_ENDIAN
  | n -> failwith (Printf.sprintf "DBusMessageByteOrder: unknown int %d" n)

let dbusmessagebyteorder_to_int v =
  match v with `BIG_ENDIAN -> 66 | `LITTLE_ENDIAN -> 108

type dbusmessageheaderfield =
  [ `INVALID
  | `PATH
  | `INTERFACE
  | `MEMBER
  | `ERROR_NAME
  | `REPLY_SERIAL
  | `DESTINATION
  | `SENDER
  | `SIGNATURE
  | `NUM_UNIX_FDS ]

let dbusmessageheaderfield_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `PATH
  | 2 -> `INTERFACE
  | 3 -> `MEMBER
  | 4 -> `ERROR_NAME
  | 5 -> `REPLY_SERIAL
  | 6 -> `DESTINATION
  | 7 -> `SENDER
  | 8 -> `SIGNATURE
  | 9 -> `NUM_UNIX_FDS
  | n -> failwith (Printf.sprintf "DBusMessageHeaderField: unknown int %d" n)

let dbusmessageheaderfield_to_int v =
  match v with
  | `INVALID -> 0
  | `PATH -> 1
  | `INTERFACE -> 2
  | `MEMBER -> 3
  | `ERROR_NAME -> 4
  | `REPLY_SERIAL -> 5
  | `DESTINATION -> 6
  | `SENDER -> 7
  | `SIGNATURE -> 8
  | `NUM_UNIX_FDS -> 9

type dbusmessagetype =
  [ `INVALID | `METHOD_CALL | `METHOD_RETURN | `ERROR | `SIGNAL ]

let dbusmessagetype_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `METHOD_CALL
  | 2 -> `METHOD_RETURN
  | 3 -> `ERROR
  | 4 -> `SIGNAL
  | n -> failwith (Printf.sprintf "DBusMessageType: unknown int %d" n)

let dbusmessagetype_to_int v =
  match v with
  | `INVALID -> 0
  | `METHOD_CALL -> 1
  | `METHOD_RETURN -> 2
  | `ERROR -> 3
  | `SIGNAL -> 4

type datastreambyteorder = [ `BIG_ENDIAN | `LITTLE_ENDIAN | `HOST_ENDIAN ]

let datastreambyteorder_of_int n =
  match n with
  | 0 -> `BIG_ENDIAN
  | 1 -> `LITTLE_ENDIAN
  | 2 -> `HOST_ENDIAN
  | n -> failwith (Printf.sprintf "DataStreamByteOrder: unknown int %d" n)

let datastreambyteorder_to_int v =
  match v with `BIG_ENDIAN -> 0 | `LITTLE_ENDIAN -> 1 | `HOST_ENDIAN -> 2

type datastreamnewlinetype = [ `LF | `CR | `CR_LF | `ANY ]

let datastreamnewlinetype_of_int n =
  match n with
  | 0 -> `LF
  | 1 -> `CR
  | 2 -> `CR_LF
  | 3 -> `ANY
  | n -> failwith (Printf.sprintf "DataStreamNewlineType: unknown int %d" n)

let datastreamnewlinetype_to_int v =
  match v with `LF -> 0 | `CR -> 1 | `CR_LF -> 2 | `ANY -> 3

type drivestartstoptype =
  [ `UNKNOWN | `SHUTDOWN | `NETWORK | `MULTIDISK | `PASSWORD ]

let drivestartstoptype_of_int n =
  match n with
  | 0 -> `UNKNOWN
  | 1 -> `SHUTDOWN
  | 2 -> `NETWORK
  | 3 -> `MULTIDISK
  | 4 -> `PASSWORD
  | n -> failwith (Printf.sprintf "DriveStartStopType: unknown int %d" n)

let drivestartstoptype_to_int v =
  match v with
  | `UNKNOWN -> 0
  | `SHUTDOWN -> 1
  | `NETWORK -> 2
  | `MULTIDISK -> 3
  | `PASSWORD -> 4

type emblemorigin = [ `UNKNOWN | `DEVICE | `LIVEMETADATA | `TAG ]

let emblemorigin_of_int n =
  match n with
  | 0 -> `UNKNOWN
  | 1 -> `DEVICE
  | 2 -> `LIVEMETADATA
  | 3 -> `TAG
  | n -> failwith (Printf.sprintf "EmblemOrigin: unknown int %d" n)

let emblemorigin_to_int v =
  match v with `UNKNOWN -> 0 | `DEVICE -> 1 | `LIVEMETADATA -> 2 | `TAG -> 3

type fileattributestatus = [ `UNSET | `SET | `ERROR_SETTING ]

let fileattributestatus_of_int n =
  match n with
  | 0 -> `UNSET
  | 1 -> `SET
  | 2 -> `ERROR_SETTING
  | n -> failwith (Printf.sprintf "FileAttributeStatus: unknown int %d" n)

let fileattributestatus_to_int v =
  match v with `UNSET -> 0 | `SET -> 1 | `ERROR_SETTING -> 2

type fileattributetype =
  [ `INVALID
  | `STRING
  | `BYTE_STRING
  | `BOOLEAN
  | `UINT32
  | `INT32
  | `UINT64
  | `INT64
  | `OBJECT
  | `STRINGV ]

let fileattributetype_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `STRING
  | 2 -> `BYTE_STRING
  | 3 -> `BOOLEAN
  | 4 -> `UINT32
  | 5 -> `INT32
  | 6 -> `UINT64
  | 7 -> `INT64
  | 8 -> `OBJECT
  | 9 -> `STRINGV
  | n -> failwith (Printf.sprintf "FileAttributeType: unknown int %d" n)

let fileattributetype_to_int v =
  match v with
  | `INVALID -> 0
  | `STRING -> 1
  | `BYTE_STRING -> 2
  | `BOOLEAN -> 3
  | `UINT32 -> 4
  | `INT32 -> 5
  | `UINT64 -> 6
  | `INT64 -> 7
  | `OBJECT -> 8
  | `STRINGV -> 9

type filemonitorevent =
  [ `CHANGED
  | `CHANGES_DONE_HINT
  | `DELETED
  | `CREATED
  | `ATTRIBUTE_CHANGED
  | `PRE_UNMOUNT
  | `UNMOUNTED
  | `MOVED
  | `RENAMED
  | `MOVED_IN
  | `MOVED_OUT ]

let filemonitorevent_of_int n =
  match n with
  | 0 -> `CHANGED
  | 1 -> `CHANGES_DONE_HINT
  | 2 -> `DELETED
  | 3 -> `CREATED
  | 4 -> `ATTRIBUTE_CHANGED
  | 5 -> `PRE_UNMOUNT
  | 6 -> `UNMOUNTED
  | 7 -> `MOVED
  | 8 -> `RENAMED
  | 9 -> `MOVED_IN
  | 10 -> `MOVED_OUT
  | n -> failwith (Printf.sprintf "FileMonitorEvent: unknown int %d" n)

let filemonitorevent_to_int v =
  match v with
  | `CHANGED -> 0
  | `CHANGES_DONE_HINT -> 1
  | `DELETED -> 2
  | `CREATED -> 3
  | `ATTRIBUTE_CHANGED -> 4
  | `PRE_UNMOUNT -> 5
  | `UNMOUNTED -> 6
  | `MOVED -> 7
  | `RENAMED -> 8
  | `MOVED_IN -> 9
  | `MOVED_OUT -> 10

type filetype =
  [ `UNKNOWN
  | `REGULAR
  | `DIRECTORY
  | `SYMBOLIC_LINK
  | `SPECIAL
  | `SHORTCUT
  | `MOUNTABLE ]

let filetype_of_int n =
  match n with
  | 0 -> `UNKNOWN
  | 1 -> `REGULAR
  | 2 -> `DIRECTORY
  | 3 -> `SYMBOLIC_LINK
  | 4 -> `SPECIAL
  | 5 -> `SHORTCUT
  | 6 -> `MOUNTABLE
  | n -> failwith (Printf.sprintf "FileType: unknown int %d" n)

let filetype_to_int v =
  match v with
  | `UNKNOWN -> 0
  | `REGULAR -> 1
  | `DIRECTORY -> 2
  | `SYMBOLIC_LINK -> 3
  | `SPECIAL -> 4
  | `SHORTCUT -> 5
  | `MOUNTABLE -> 6

type filesystempreviewtype = [ `IF_ALWAYS | `IF_LOCAL | `NEVER ]

let filesystempreviewtype_of_int n =
  match n with
  | 0 -> `IF_ALWAYS
  | 1 -> `IF_LOCAL
  | 2 -> `NEVER
  | n -> failwith (Printf.sprintf "FilesystemPreviewType: unknown int %d" n)

let filesystempreviewtype_to_int v =
  match v with `IF_ALWAYS -> 0 | `IF_LOCAL -> 1 | `NEVER -> 2

type ioerrorenum =
  [ `FAILED
  | `NOT_FOUND
  | `EXISTS
  | `IS_DIRECTORY
  | `NOT_DIRECTORY
  | `NOT_EMPTY
  | `NOT_REGULAR_FILE
  | `NOT_SYMBOLIC_LINK
  | `NOT_MOUNTABLE_FILE
  | `FILENAME_TOO_LONG
  | `INVALID_FILENAME
  | `TOO_MANY_LINKS
  | `NO_SPACE
  | `INVALID_ARGUMENT
  | `PERMISSION_DENIED
  | `NOT_SUPPORTED
  | `NOT_MOUNTED
  | `ALREADY_MOUNTED
  | `CLOSED
  | `CANCELLED
  | `PENDING
  | `READ_ONLY
  | `CANT_CREATE_BACKUP
  | `WRONG_ETAG
  | `TIMED_OUT
  | `WOULD_RECURSE
  | `BUSY
  | `WOULD_BLOCK
  | `HOST_NOT_FOUND
  | `WOULD_MERGE
  | `FAILED_HANDLED
  | `TOO_MANY_OPEN_FILES
  | `NOT_INITIALIZED
  | `ADDRESS_IN_USE
  | `PARTIAL_INPUT
  | `INVALID_DATA
  | `DBUS_ERROR
  | `HOST_UNREACHABLE
  | `NETWORK_UNREACHABLE
  | `CONNECTION_REFUSED
  | `PROXY_FAILED
  | `PROXY_AUTH_FAILED
  | `PROXY_NEED_AUTH
  | `PROXY_NOT_ALLOWED
  | `BROKEN_PIPE
  | `CONNECTION_CLOSED
  | `NOT_CONNECTED
  | `MESSAGE_TOO_LARGE
  | `NO_SUCH_DEVICE
  | `DESTINATION_UNSET ]

let ioerrorenum_of_int n =
  match n with
  | 0 -> `FAILED
  | 1 -> `NOT_FOUND
  | 2 -> `EXISTS
  | 3 -> `IS_DIRECTORY
  | 4 -> `NOT_DIRECTORY
  | 5 -> `NOT_EMPTY
  | 6 -> `NOT_REGULAR_FILE
  | 7 -> `NOT_SYMBOLIC_LINK
  | 8 -> `NOT_MOUNTABLE_FILE
  | 9 -> `FILENAME_TOO_LONG
  | 10 -> `INVALID_FILENAME
  | 11 -> `TOO_MANY_LINKS
  | 12 -> `NO_SPACE
  | 13 -> `INVALID_ARGUMENT
  | 14 -> `PERMISSION_DENIED
  | 15 -> `NOT_SUPPORTED
  | 16 -> `NOT_MOUNTED
  | 17 -> `ALREADY_MOUNTED
  | 18 -> `CLOSED
  | 19 -> `CANCELLED
  | 20 -> `PENDING
  | 21 -> `READ_ONLY
  | 22 -> `CANT_CREATE_BACKUP
  | 23 -> `WRONG_ETAG
  | 24 -> `TIMED_OUT
  | 25 -> `WOULD_RECURSE
  | 26 -> `BUSY
  | 27 -> `WOULD_BLOCK
  | 28 -> `HOST_NOT_FOUND
  | 29 -> `WOULD_MERGE
  | 30 -> `FAILED_HANDLED
  | 31 -> `TOO_MANY_OPEN_FILES
  | 32 -> `NOT_INITIALIZED
  | 33 -> `ADDRESS_IN_USE
  | 34 -> `PARTIAL_INPUT
  | 35 -> `INVALID_DATA
  | 36 -> `DBUS_ERROR
  | 37 -> `HOST_UNREACHABLE
  | 38 -> `NETWORK_UNREACHABLE
  | 39 -> `CONNECTION_REFUSED
  | 40 -> `PROXY_FAILED
  | 41 -> `PROXY_AUTH_FAILED
  | 42 -> `PROXY_NEED_AUTH
  | 43 -> `PROXY_NOT_ALLOWED
  | 44 -> `BROKEN_PIPE
  | 45 -> `NOT_CONNECTED
  | 46 -> `MESSAGE_TOO_LARGE
  | 47 -> `NO_SUCH_DEVICE
  | 48 -> `DESTINATION_UNSET
  | n -> failwith (Printf.sprintf "IOErrorEnum: unknown int %d" n)

let ioerrorenum_to_int v =
  match v with
  | `FAILED -> 0
  | `NOT_FOUND -> 1
  | `EXISTS -> 2
  | `IS_DIRECTORY -> 3
  | `NOT_DIRECTORY -> 4
  | `NOT_EMPTY -> 5
  | `NOT_REGULAR_FILE -> 6
  | `NOT_SYMBOLIC_LINK -> 7
  | `NOT_MOUNTABLE_FILE -> 8
  | `FILENAME_TOO_LONG -> 9
  | `INVALID_FILENAME -> 10
  | `TOO_MANY_LINKS -> 11
  | `NO_SPACE -> 12
  | `INVALID_ARGUMENT -> 13
  | `PERMISSION_DENIED -> 14
  | `NOT_SUPPORTED -> 15
  | `NOT_MOUNTED -> 16
  | `ALREADY_MOUNTED -> 17
  | `CLOSED -> 18
  | `CANCELLED -> 19
  | `PENDING -> 20
  | `READ_ONLY -> 21
  | `CANT_CREATE_BACKUP -> 22
  | `WRONG_ETAG -> 23
  | `TIMED_OUT -> 24
  | `WOULD_RECURSE -> 25
  | `BUSY -> 26
  | `WOULD_BLOCK -> 27
  | `HOST_NOT_FOUND -> 28
  | `WOULD_MERGE -> 29
  | `FAILED_HANDLED -> 30
  | `TOO_MANY_OPEN_FILES -> 31
  | `NOT_INITIALIZED -> 32
  | `ADDRESS_IN_USE -> 33
  | `PARTIAL_INPUT -> 34
  | `INVALID_DATA -> 35
  | `DBUS_ERROR -> 36
  | `HOST_UNREACHABLE -> 37
  | `NETWORK_UNREACHABLE -> 38
  | `CONNECTION_REFUSED -> 39
  | `PROXY_FAILED -> 40
  | `PROXY_AUTH_FAILED -> 41
  | `PROXY_NEED_AUTH -> 42
  | `PROXY_NOT_ALLOWED -> 43
  | `BROKEN_PIPE -> 44
  | `CONNECTION_CLOSED -> 44
  | `NOT_CONNECTED -> 45
  | `MESSAGE_TOO_LARGE -> 46
  | `NO_SUCH_DEVICE -> 47
  | `DESTINATION_UNSET -> 48

type iomodulescopeflags = [ `NONE | `BLOCK_DUPLICATES ]

let iomodulescopeflags_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `BLOCK_DUPLICATES
  | n -> failwith (Printf.sprintf "IOModuleScopeFlags: unknown int %d" n)

let iomodulescopeflags_to_int v =
  match v with `NONE -> 0 | `BLOCK_DUPLICATES -> 1

type memorymonitorwarninglevel = [ `LOW | `MEDIUM | `CRITICAL ]

let memorymonitorwarninglevel_of_int n =
  match n with
  | 50 -> `LOW
  | 100 -> `MEDIUM
  | 255 -> `CRITICAL
  | n -> failwith (Printf.sprintf "MemoryMonitorWarningLevel: unknown int %d" n)

let memorymonitorwarninglevel_to_int v =
  match v with `LOW -> 50 | `MEDIUM -> 100 | `CRITICAL -> 255

type mountoperationresult = [ `HANDLED | `ABORTED | `UNHANDLED ]

let mountoperationresult_of_int n =
  match n with
  | 0 -> `HANDLED
  | 1 -> `ABORTED
  | 2 -> `UNHANDLED
  | n -> failwith (Printf.sprintf "MountOperationResult: unknown int %d" n)

let mountoperationresult_to_int v =
  match v with `HANDLED -> 0 | `ABORTED -> 1 | `UNHANDLED -> 2

type networkconnectivity = [ `LOCAL | `LIMITED | `PORTAL | `FULL ]

let networkconnectivity_of_int n =
  match n with
  | 1 -> `LOCAL
  | 2 -> `LIMITED
  | 3 -> `PORTAL
  | 4 -> `FULL
  | n -> failwith (Printf.sprintf "NetworkConnectivity: unknown int %d" n)

let networkconnectivity_to_int v =
  match v with `LOCAL -> 1 | `LIMITED -> 2 | `PORTAL -> 3 | `FULL -> 4

type notificationpriority = [ `NORMAL | `LOW | `HIGH | `URGENT ]

let notificationpriority_of_int n =
  match n with
  | 0 -> `NORMAL
  | 1 -> `LOW
  | 2 -> `HIGH
  | 3 -> `URGENT
  | n -> failwith (Printf.sprintf "NotificationPriority: unknown int %d" n)

let notificationpriority_to_int v =
  match v with `NORMAL -> 0 | `LOW -> 1 | `HIGH -> 2 | `URGENT -> 3

type passwordsave = [ `NEVER | `FOR_SESSION | `PERMANENTLY ]

let passwordsave_of_int n =
  match n with
  | 0 -> `NEVER
  | 1 -> `FOR_SESSION
  | 2 -> `PERMANENTLY
  | n -> failwith (Printf.sprintf "PasswordSave: unknown int %d" n)

let passwordsave_to_int v =
  match v with `NEVER -> 0 | `FOR_SESSION -> 1 | `PERMANENTLY -> 2

type pollablereturn = [ `FAILED | `OK | `WOULD_BLOCK ]

let pollablereturn_of_int n =
  match n with
  | 0 -> `FAILED
  | 1 -> `OK
  | -27 -> `WOULD_BLOCK
  | n -> failwith (Printf.sprintf "PollableReturn: unknown int %d" n)

let pollablereturn_to_int v =
  match v with `FAILED -> 0 | `OK -> 1 | `WOULD_BLOCK -> -27

type resolvererror = [ `NOT_FOUND | `TEMPORARY_FAILURE | `INTERNAL ]

let resolvererror_of_int n =
  match n with
  | 0 -> `NOT_FOUND
  | 1 -> `TEMPORARY_FAILURE
  | 2 -> `INTERNAL
  | n -> failwith (Printf.sprintf "ResolverError: unknown int %d" n)

let resolvererror_to_int v =
  match v with `NOT_FOUND -> 0 | `TEMPORARY_FAILURE -> 1 | `INTERNAL -> 2

type resolverrecordtype = [ `SRV | `MX | `TXT | `SOA | `NS ]

let resolverrecordtype_of_int n =
  match n with
  | 1 -> `SRV
  | 2 -> `MX
  | 3 -> `TXT
  | 4 -> `SOA
  | 5 -> `NS
  | n -> failwith (Printf.sprintf "ResolverRecordType: unknown int %d" n)

let resolverrecordtype_to_int v =
  match v with `SRV -> 1 | `MX -> 2 | `TXT -> 3 | `SOA -> 4 | `NS -> 5

type resourceerror = [ `NOT_FOUND | `INTERNAL ]

let resourceerror_of_int n =
  match n with
  | 0 -> `NOT_FOUND
  | 1 -> `INTERNAL
  | n -> failwith (Printf.sprintf "ResourceError: unknown int %d" n)

let resourceerror_to_int v = match v with `NOT_FOUND -> 0 | `INTERNAL -> 1

type socketclientevent =
  [ `RESOLVING
  | `RESOLVED
  | `CONNECTING
  | `CONNECTED
  | `PROXY_NEGOTIATING
  | `PROXY_NEGOTIATED
  | `TLS_HANDSHAKING
  | `TLS_HANDSHAKED
  | `COMPLETE ]

let socketclientevent_of_int n =
  match n with
  | 0 -> `RESOLVING
  | 1 -> `RESOLVED
  | 2 -> `CONNECTING
  | 3 -> `CONNECTED
  | 4 -> `PROXY_NEGOTIATING
  | 5 -> `PROXY_NEGOTIATED
  | 6 -> `TLS_HANDSHAKING
  | 7 -> `TLS_HANDSHAKED
  | 8 -> `COMPLETE
  | n -> failwith (Printf.sprintf "SocketClientEvent: unknown int %d" n)

let socketclientevent_to_int v =
  match v with
  | `RESOLVING -> 0
  | `RESOLVED -> 1
  | `CONNECTING -> 2
  | `CONNECTED -> 3
  | `PROXY_NEGOTIATING -> 4
  | `PROXY_NEGOTIATED -> 5
  | `TLS_HANDSHAKING -> 6
  | `TLS_HANDSHAKED -> 7
  | `COMPLETE -> 8

type socketfamily = [ `INVALID | `UNIX | `IPV4 | `IPV6 ]

let socketfamily_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `UNIX
  | 2 -> `IPV4
  | 10 -> `IPV6
  | n -> failwith (Printf.sprintf "SocketFamily: unknown int %d" n)

let socketfamily_to_int v =
  match v with `INVALID -> 0 | `UNIX -> 1 | `IPV4 -> 2 | `IPV6 -> 10

type socketlistenerevent = [ `BINDING | `BOUND | `LISTENING | `LISTENED ]

let socketlistenerevent_of_int n =
  match n with
  | 0 -> `BINDING
  | 1 -> `BOUND
  | 2 -> `LISTENING
  | 3 -> `LISTENED
  | n -> failwith (Printf.sprintf "SocketListenerEvent: unknown int %d" n)

let socketlistenerevent_to_int v =
  match v with `BINDING -> 0 | `BOUND -> 1 | `LISTENING -> 2 | `LISTENED -> 3

type socketprotocol = [ `UNKNOWN | `DEFAULT | `TCP | `UDP | `SCTP ]

let socketprotocol_of_int n =
  match n with
  | -1 -> `UNKNOWN
  | 0 -> `DEFAULT
  | 6 -> `TCP
  | 17 -> `UDP
  | 132 -> `SCTP
  | n -> failwith (Printf.sprintf "SocketProtocol: unknown int %d" n)

let socketprotocol_to_int v =
  match v with
  | `UNKNOWN -> -1
  | `DEFAULT -> 0
  | `TCP -> 6
  | `UDP -> 17
  | `SCTP -> 132

type sockettype = [ `INVALID | `STREAM | `DATAGRAM | `SEQPACKET ]

let sockettype_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `STREAM
  | 2 -> `DATAGRAM
  | 3 -> `SEQPACKET
  | n -> failwith (Printf.sprintf "SocketType: unknown int %d" n)

let sockettype_to_int v =
  match v with `INVALID -> 0 | `STREAM -> 1 | `DATAGRAM -> 2 | `SEQPACKET -> 3

type tlsauthenticationmode = [ `NONE | `REQUESTED | `REQUIRED ]

let tlsauthenticationmode_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `REQUESTED
  | 2 -> `REQUIRED
  | n -> failwith (Printf.sprintf "TlsAuthenticationMode: unknown int %d" n)

let tlsauthenticationmode_to_int v =
  match v with `NONE -> 0 | `REQUESTED -> 1 | `REQUIRED -> 2

type tlscertificaterequestflags = [ `NONE ]

let tlscertificaterequestflags_of_int n =
  match n with
  | 0 -> `NONE
  | n ->
      failwith (Printf.sprintf "TlsCertificateRequestFlags: unknown int %d" n)

let tlscertificaterequestflags_to_int v = match v with `NONE -> 0

type tlschannelbindingerror =
  [ `NOT_IMPLEMENTED
  | `INVALID_STATE
  | `NOT_AVAILABLE
  | `NOT_SUPPORTED
  | `GENERAL_ERROR ]

let tlschannelbindingerror_of_int n =
  match n with
  | 0 -> `NOT_IMPLEMENTED
  | 1 -> `INVALID_STATE
  | 2 -> `NOT_AVAILABLE
  | 3 -> `NOT_SUPPORTED
  | 4 -> `GENERAL_ERROR
  | n -> failwith (Printf.sprintf "TlsChannelBindingError: unknown int %d" n)

let tlschannelbindingerror_to_int v =
  match v with
  | `NOT_IMPLEMENTED -> 0
  | `INVALID_STATE -> 1
  | `NOT_AVAILABLE -> 2
  | `NOT_SUPPORTED -> 3
  | `GENERAL_ERROR -> 4

type tlschannelbindingtype = [ `UNIQUE | `SERVER_END_POINT | `EXPORTER ]

let tlschannelbindingtype_of_int n =
  match n with
  | 0 -> `UNIQUE
  | 1 -> `SERVER_END_POINT
  | 2 -> `EXPORTER
  | n -> failwith (Printf.sprintf "TlsChannelBindingType: unknown int %d" n)

let tlschannelbindingtype_to_int v =
  match v with `UNIQUE -> 0 | `SERVER_END_POINT -> 1 | `EXPORTER -> 2

type tlsdatabaselookupflags = [ `NONE | `KEYPAIR ]

let tlsdatabaselookupflags_of_int n =
  match n with
  | 0 -> `NONE
  | 1 -> `KEYPAIR
  | n -> failwith (Printf.sprintf "TlsDatabaseLookupFlags: unknown int %d" n)

let tlsdatabaselookupflags_to_int v = match v with `NONE -> 0 | `KEYPAIR -> 1

type tlserror =
  [ `UNAVAILABLE
  | `MISC
  | `BAD_CERTIFICATE
  | `NOT_TLS
  | `HANDSHAKE
  | `CERTIFICATE_REQUIRED
  | `EOF
  | `INAPPROPRIATE_FALLBACK
  | `BAD_CERTIFICATE_PASSWORD ]

let tlserror_of_int n =
  match n with
  | 0 -> `UNAVAILABLE
  | 1 -> `MISC
  | 2 -> `BAD_CERTIFICATE
  | 3 -> `NOT_TLS
  | 4 -> `HANDSHAKE
  | 5 -> `CERTIFICATE_REQUIRED
  | 6 -> `EOF
  | 7 -> `INAPPROPRIATE_FALLBACK
  | 8 -> `BAD_CERTIFICATE_PASSWORD
  | n -> failwith (Printf.sprintf "TlsError: unknown int %d" n)

let tlserror_to_int v =
  match v with
  | `UNAVAILABLE -> 0
  | `MISC -> 1
  | `BAD_CERTIFICATE -> 2
  | `NOT_TLS -> 3
  | `HANDSHAKE -> 4
  | `CERTIFICATE_REQUIRED -> 5
  | `EOF -> 6
  | `INAPPROPRIATE_FALLBACK -> 7
  | `BAD_CERTIFICATE_PASSWORD -> 8

type tlsinteractionresult = [ `UNHANDLED | `HANDLED | `FAILED ]

let tlsinteractionresult_of_int n =
  match n with
  | 0 -> `UNHANDLED
  | 1 -> `HANDLED
  | 2 -> `FAILED
  | n -> failwith (Printf.sprintf "TlsInteractionResult: unknown int %d" n)

let tlsinteractionresult_to_int v =
  match v with `UNHANDLED -> 0 | `HANDLED -> 1 | `FAILED -> 2

type tlsprotocolversion =
  [ `UNKNOWN
  | `SSL_3_0
  | `TLS_1_0
  | `TLS_1_1
  | `TLS_1_2
  | `TLS_1_3
  | `DTLS_1_0
  | `DTLS_1_2 ]

let tlsprotocolversion_of_int n =
  match n with
  | 0 -> `UNKNOWN
  | 1 -> `SSL_3_0
  | 2 -> `TLS_1_0
  | 3 -> `TLS_1_1
  | 4 -> `TLS_1_2
  | 5 -> `TLS_1_3
  | 201 -> `DTLS_1_0
  | 202 -> `DTLS_1_2
  | n -> failwith (Printf.sprintf "TlsProtocolVersion: unknown int %d" n)

let tlsprotocolversion_to_int v =
  match v with
  | `UNKNOWN -> 0
  | `SSL_3_0 -> 1
  | `TLS_1_0 -> 2
  | `TLS_1_1 -> 3
  | `TLS_1_2 -> 4
  | `TLS_1_3 -> 5
  | `DTLS_1_0 -> 201
  | `DTLS_1_2 -> 202

type tlsrehandshakemode = [ `NEVER | `SAFELY | `UNSAFELY ]

let tlsrehandshakemode_of_int n =
  match n with
  | 0 -> `NEVER
  | 1 -> `SAFELY
  | 2 -> `UNSAFELY
  | n -> failwith (Printf.sprintf "TlsRehandshakeMode: unknown int %d" n)

let tlsrehandshakemode_to_int v =
  match v with `NEVER -> 0 | `SAFELY -> 1 | `UNSAFELY -> 2

type unixsocketaddresstype =
  [ `INVALID | `ANONYMOUS | `PATH | `ABSTRACT | `ABSTRACT_PADDED ]

let unixsocketaddresstype_of_int n =
  match n with
  | 0 -> `INVALID
  | 1 -> `ANONYMOUS
  | 2 -> `PATH
  | 3 -> `ABSTRACT
  | 4 -> `ABSTRACT_PADDED
  | n -> failwith (Printf.sprintf "UnixSocketAddressType: unknown int %d" n)

let unixsocketaddresstype_to_int v =
  match v with
  | `INVALID -> 0
  | `ANONYMOUS -> 1
  | `PATH -> 2
  | `ABSTRACT -> 3
  | `ABSTRACT_PADDED -> 4

type zlibcompressorformat = [ `ZLIB | `GZIP | `RAW ]

let zlibcompressorformat_of_int n =
  match n with
  | 0 -> `ZLIB
  | 1 -> `GZIP
  | 2 -> `RAW
  | n -> failwith (Printf.sprintf "ZlibCompressorFormat: unknown int %d" n)

let zlibcompressorformat_to_int v =
  match v with `ZLIB -> 0 | `GZIP -> 1 | `RAW -> 2

type appinfocreateflags_flag =
  [ `NONE | `NEEDS_TERMINAL | `SUPPORTS_URIS | `SUPPORTS_STARTUP_NOTIFICATION ]

type appinfocreateflags = appinfocreateflags_flag list

let appinfocreateflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `NEEDS_TERMINAL :: acc else acc in
  let acc = if flags land 2 <> 0 then `SUPPORTS_URIS :: acc else acc in
  let acc =
    if flags land 4 <> 0 then `SUPPORTS_STARTUP_NOTIFICATION :: acc else acc
  in
  acc

let appinfocreateflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `NEEDS_TERMINAL -> acc lor 1
      | `SUPPORTS_URIS -> acc lor 2
      | `SUPPORTS_STARTUP_NOTIFICATION -> acc lor 4)
    0 flags

type applicationflags_flag =
  [ `FLAGS_NONE
  | `DEFAULT_FLAGS
  | `IS_SERVICE
  | `IS_LAUNCHER
  | `HANDLES_OPEN
  | `HANDLES_COMMAND_LINE
  | `SEND_ENVIRONMENT
  | `NON_UNIQUE
  | `CAN_OVERRIDE_APP_ID
  | `ALLOW_REPLACEMENT
  | `REPLACE ]

type applicationflags = applicationflags_flag list

let applicationflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `FLAGS_NONE :: acc else acc in
  let acc = if flags land 0 <> 0 then `DEFAULT_FLAGS :: acc else acc in
  let acc = if flags land 1 <> 0 then `IS_SERVICE :: acc else acc in
  let acc = if flags land 2 <> 0 then `IS_LAUNCHER :: acc else acc in
  let acc = if flags land 4 <> 0 then `HANDLES_OPEN :: acc else acc in
  let acc = if flags land 8 <> 0 then `HANDLES_COMMAND_LINE :: acc else acc in
  let acc = if flags land 16 <> 0 then `SEND_ENVIRONMENT :: acc else acc in
  let acc = if flags land 32 <> 0 then `NON_UNIQUE :: acc else acc in
  let acc = if flags land 64 <> 0 then `CAN_OVERRIDE_APP_ID :: acc else acc in
  let acc = if flags land 128 <> 0 then `ALLOW_REPLACEMENT :: acc else acc in
  let acc = if flags land 256 <> 0 then `REPLACE :: acc else acc in
  acc

let applicationflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `FLAGS_NONE -> acc lor 0
      | `DEFAULT_FLAGS -> acc lor 0
      | `IS_SERVICE -> acc lor 1
      | `IS_LAUNCHER -> acc lor 2
      | `HANDLES_OPEN -> acc lor 4
      | `HANDLES_COMMAND_LINE -> acc lor 8
      | `SEND_ENVIRONMENT -> acc lor 16
      | `NON_UNIQUE -> acc lor 32
      | `CAN_OVERRIDE_APP_ID -> acc lor 64
      | `ALLOW_REPLACEMENT -> acc lor 128
      | `REPLACE -> acc lor 256)
    0 flags

type askpasswordflags_flag =
  [ `NEED_PASSWORD
  | `NEED_USERNAME
  | `NEED_DOMAIN
  | `SAVING_SUPPORTED
  | `ANONYMOUS_SUPPORTED
  | `TCRYPT ]

type askpasswordflags = askpasswordflags_flag list

let askpasswordflags_of_int flags =
  let acc = [] in
  let acc = if flags land 1 <> 0 then `NEED_PASSWORD :: acc else acc in
  let acc = if flags land 2 <> 0 then `NEED_USERNAME :: acc else acc in
  let acc = if flags land 4 <> 0 then `NEED_DOMAIN :: acc else acc in
  let acc = if flags land 8 <> 0 then `SAVING_SUPPORTED :: acc else acc in
  let acc = if flags land 16 <> 0 then `ANONYMOUS_SUPPORTED :: acc else acc in
  let acc = if flags land 32 <> 0 then `TCRYPT :: acc else acc in
  acc

let askpasswordflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NEED_PASSWORD -> acc lor 1
      | `NEED_USERNAME -> acc lor 2
      | `NEED_DOMAIN -> acc lor 4
      | `SAVING_SUPPORTED -> acc lor 8
      | `ANONYMOUS_SUPPORTED -> acc lor 16
      | `TCRYPT -> acc lor 32)
    0 flags

type busnameownerflags_flag =
  [ `NONE | `ALLOW_REPLACEMENT | `REPLACE | `DO_NOT_QUEUE ]

type busnameownerflags = busnameownerflags_flag list

let busnameownerflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `ALLOW_REPLACEMENT :: acc else acc in
  let acc = if flags land 2 <> 0 then `REPLACE :: acc else acc in
  let acc = if flags land 4 <> 0 then `DO_NOT_QUEUE :: acc else acc in
  acc

let busnameownerflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `ALLOW_REPLACEMENT -> acc lor 1
      | `REPLACE -> acc lor 2
      | `DO_NOT_QUEUE -> acc lor 4)
    0 flags

type busnamewatcherflags_flag = [ `NONE | `AUTO_START ]
type busnamewatcherflags = busnamewatcherflags_flag list

let busnamewatcherflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `AUTO_START :: acc else acc in
  acc

let busnamewatcherflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `NONE -> acc lor 0 | `AUTO_START -> acc lor 1)
    0 flags

type converterflags_flag = [ `NONE | `INPUT_AT_END | `FLUSH ]
type converterflags = converterflags_flag list

let converterflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `INPUT_AT_END :: acc else acc in
  let acc = if flags land 2 <> 0 then `FLUSH :: acc else acc in
  acc

let converterflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `INPUT_AT_END -> acc lor 1
      | `FLUSH -> acc lor 2)
    0 flags

type dbuscallflags_flag =
  [ `NONE | `NO_AUTO_START | `ALLOW_INTERACTIVE_AUTHORIZATION ]

type dbuscallflags = dbuscallflags_flag list

let dbuscallflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `NO_AUTO_START :: acc else acc in
  let acc =
    if flags land 2 <> 0 then `ALLOW_INTERACTIVE_AUTHORIZATION :: acc else acc
  in
  acc

let dbuscallflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `NO_AUTO_START -> acc lor 1
      | `ALLOW_INTERACTIVE_AUTHORIZATION -> acc lor 2)
    0 flags

type dbuscapabilityflags_flag = [ `NONE | `UNIX_FD_PASSING ]
type dbuscapabilityflags = dbuscapabilityflags_flag list

let dbuscapabilityflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `UNIX_FD_PASSING :: acc else acc in
  acc

let dbuscapabilityflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `NONE -> acc lor 0 | `UNIX_FD_PASSING -> acc lor 1)
    0 flags

type dbusconnectionflags_flag =
  [ `NONE
  | `AUTHENTICATION_CLIENT
  | `AUTHENTICATION_SERVER
  | `AUTHENTICATION_ALLOW_ANONYMOUS
  | `MESSAGE_BUS_CONNECTION
  | `DELAY_MESSAGE_PROCESSING
  | `AUTHENTICATION_REQUIRE_SAME_USER
  | `CROSS_NAMESPACE ]

type dbusconnectionflags = dbusconnectionflags_flag list

let dbusconnectionflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `AUTHENTICATION_CLIENT :: acc else acc in
  let acc = if flags land 2 <> 0 then `AUTHENTICATION_SERVER :: acc else acc in
  let acc =
    if flags land 4 <> 0 then `AUTHENTICATION_ALLOW_ANONYMOUS :: acc else acc
  in
  let acc = if flags land 8 <> 0 then `MESSAGE_BUS_CONNECTION :: acc else acc in
  let acc =
    if flags land 16 <> 0 then `DELAY_MESSAGE_PROCESSING :: acc else acc
  in
  let acc =
    if flags land 32 <> 0 then `AUTHENTICATION_REQUIRE_SAME_USER :: acc else acc
  in
  let acc = if flags land 64 <> 0 then `CROSS_NAMESPACE :: acc else acc in
  acc

let dbusconnectionflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `AUTHENTICATION_CLIENT -> acc lor 1
      | `AUTHENTICATION_SERVER -> acc lor 2
      | `AUTHENTICATION_ALLOW_ANONYMOUS -> acc lor 4
      | `MESSAGE_BUS_CONNECTION -> acc lor 8
      | `DELAY_MESSAGE_PROCESSING -> acc lor 16
      | `AUTHENTICATION_REQUIRE_SAME_USER -> acc lor 32
      | `CROSS_NAMESPACE -> acc lor 64)
    0 flags

type dbusinterfaceskeletonflags_flag =
  [ `NONE | `HANDLE_METHOD_INVOCATIONS_IN_THREAD ]

type dbusinterfaceskeletonflags = dbusinterfaceskeletonflags_flag list

let dbusinterfaceskeletonflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc =
    if flags land 1 <> 0 then `HANDLE_METHOD_INVOCATIONS_IN_THREAD :: acc
    else acc
  in
  acc

let dbusinterfaceskeletonflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `HANDLE_METHOD_INVOCATIONS_IN_THREAD -> acc lor 1)
    0 flags

type dbusmessageflags_flag =
  [ `NONE
  | `NO_REPLY_EXPECTED
  | `NO_AUTO_START
  | `ALLOW_INTERACTIVE_AUTHORIZATION ]

type dbusmessageflags = dbusmessageflags_flag list

let dbusmessageflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `NO_REPLY_EXPECTED :: acc else acc in
  let acc = if flags land 2 <> 0 then `NO_AUTO_START :: acc else acc in
  let acc =
    if flags land 4 <> 0 then `ALLOW_INTERACTIVE_AUTHORIZATION :: acc else acc
  in
  acc

let dbusmessageflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `NO_REPLY_EXPECTED -> acc lor 1
      | `NO_AUTO_START -> acc lor 2
      | `ALLOW_INTERACTIVE_AUTHORIZATION -> acc lor 4)
    0 flags

type dbusobjectmanagerclientflags_flag = [ `NONE | `DO_NOT_AUTO_START ]
type dbusobjectmanagerclientflags = dbusobjectmanagerclientflags_flag list

let dbusobjectmanagerclientflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `DO_NOT_AUTO_START :: acc else acc in
  acc

let dbusobjectmanagerclientflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `NONE -> acc lor 0 | `DO_NOT_AUTO_START -> acc lor 1)
    0 flags

type dbuspropertyinfoflags_flag = [ `NONE | `READABLE | `WRITABLE ]
type dbuspropertyinfoflags = dbuspropertyinfoflags_flag list

let dbuspropertyinfoflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `READABLE :: acc else acc in
  let acc = if flags land 2 <> 0 then `WRITABLE :: acc else acc in
  acc

let dbuspropertyinfoflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `READABLE -> acc lor 1
      | `WRITABLE -> acc lor 2)
    0 flags

type dbusproxyflags_flag =
  [ `NONE
  | `DO_NOT_LOAD_PROPERTIES
  | `DO_NOT_CONNECT_SIGNALS
  | `DO_NOT_AUTO_START
  | `GET_INVALIDATED_PROPERTIES
  | `DO_NOT_AUTO_START_AT_CONSTRUCTION
  | `NO_MATCH_RULE ]

type dbusproxyflags = dbusproxyflags_flag list

let dbusproxyflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `DO_NOT_LOAD_PROPERTIES :: acc else acc in
  let acc = if flags land 2 <> 0 then `DO_NOT_CONNECT_SIGNALS :: acc else acc in
  let acc = if flags land 4 <> 0 then `DO_NOT_AUTO_START :: acc else acc in
  let acc =
    if flags land 8 <> 0 then `GET_INVALIDATED_PROPERTIES :: acc else acc
  in
  let acc =
    if flags land 16 <> 0 then `DO_NOT_AUTO_START_AT_CONSTRUCTION :: acc
    else acc
  in
  let acc = if flags land 32 <> 0 then `NO_MATCH_RULE :: acc else acc in
  acc

let dbusproxyflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `DO_NOT_LOAD_PROPERTIES -> acc lor 1
      | `DO_NOT_CONNECT_SIGNALS -> acc lor 2
      | `DO_NOT_AUTO_START -> acc lor 4
      | `GET_INVALIDATED_PROPERTIES -> acc lor 8
      | `DO_NOT_AUTO_START_AT_CONSTRUCTION -> acc lor 16
      | `NO_MATCH_RULE -> acc lor 32)
    0 flags

type dbussendmessageflags_flag = [ `NONE | `PRESERVE_SERIAL ]
type dbussendmessageflags = dbussendmessageflags_flag list

let dbussendmessageflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `PRESERVE_SERIAL :: acc else acc in
  acc

let dbussendmessageflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `NONE -> acc lor 0 | `PRESERVE_SERIAL -> acc lor 1)
    0 flags

type dbusserverflags_flag =
  [ `NONE
  | `RUN_IN_THREAD
  | `AUTHENTICATION_ALLOW_ANONYMOUS
  | `AUTHENTICATION_REQUIRE_SAME_USER ]

type dbusserverflags = dbusserverflags_flag list

let dbusserverflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `RUN_IN_THREAD :: acc else acc in
  let acc =
    if flags land 2 <> 0 then `AUTHENTICATION_ALLOW_ANONYMOUS :: acc else acc
  in
  let acc =
    if flags land 4 <> 0 then `AUTHENTICATION_REQUIRE_SAME_USER :: acc else acc
  in
  acc

let dbusserverflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `RUN_IN_THREAD -> acc lor 1
      | `AUTHENTICATION_ALLOW_ANONYMOUS -> acc lor 2
      | `AUTHENTICATION_REQUIRE_SAME_USER -> acc lor 4)
    0 flags

type dbussignalflags_flag =
  [ `NONE | `NO_MATCH_RULE | `MATCH_ARG0_NAMESPACE | `MATCH_ARG0_PATH ]

type dbussignalflags = dbussignalflags_flag list

let dbussignalflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `NO_MATCH_RULE :: acc else acc in
  let acc = if flags land 2 <> 0 then `MATCH_ARG0_NAMESPACE :: acc else acc in
  let acc = if flags land 4 <> 0 then `MATCH_ARG0_PATH :: acc else acc in
  acc

let dbussignalflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `NO_MATCH_RULE -> acc lor 1
      | `MATCH_ARG0_NAMESPACE -> acc lor 2
      | `MATCH_ARG0_PATH -> acc lor 4)
    0 flags

type dbussubtreeflags_flag = [ `NONE | `DISPATCH_TO_UNENUMERATED_NODES ]
type dbussubtreeflags = dbussubtreeflags_flag list

let dbussubtreeflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc =
    if flags land 1 <> 0 then `DISPATCH_TO_UNENUMERATED_NODES :: acc else acc
  in
  acc

let dbussubtreeflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `DISPATCH_TO_UNENUMERATED_NODES -> acc lor 1)
    0 flags

type drivestartflags_flag = [ `NONE ]
type drivestartflags = drivestartflags_flag list

let drivestartflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  acc

let drivestartflags_to_int flags =
  List.fold_left (fun acc flag -> match flag with `NONE -> acc lor 0) 0 flags

type fileattributeinfoflags_flag = [ `NONE | `COPY_WITH_FILE | `COPY_WHEN_MOVED ]
type fileattributeinfoflags = fileattributeinfoflags_flag list

let fileattributeinfoflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `COPY_WITH_FILE :: acc else acc in
  let acc = if flags land 2 <> 0 then `COPY_WHEN_MOVED :: acc else acc in
  acc

let fileattributeinfoflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `COPY_WITH_FILE -> acc lor 1
      | `COPY_WHEN_MOVED -> acc lor 2)
    0 flags

type filecopyflags_flag =
  [ `NONE
  | `OVERWRITE
  | `BACKUP
  | `NOFOLLOW_SYMLINKS
  | `ALL_METADATA
  | `NO_FALLBACK_FOR_MOVE
  | `TARGET_DEFAULT_PERMS
  | `TARGET_DEFAULT_MODIFIED_TIME ]

type filecopyflags = filecopyflags_flag list

let filecopyflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `OVERWRITE :: acc else acc in
  let acc = if flags land 2 <> 0 then `BACKUP :: acc else acc in
  let acc = if flags land 4 <> 0 then `NOFOLLOW_SYMLINKS :: acc else acc in
  let acc = if flags land 8 <> 0 then `ALL_METADATA :: acc else acc in
  let acc = if flags land 16 <> 0 then `NO_FALLBACK_FOR_MOVE :: acc else acc in
  let acc = if flags land 32 <> 0 then `TARGET_DEFAULT_PERMS :: acc else acc in
  let acc =
    if flags land 64 <> 0 then `TARGET_DEFAULT_MODIFIED_TIME :: acc else acc
  in
  acc

let filecopyflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `OVERWRITE -> acc lor 1
      | `BACKUP -> acc lor 2
      | `NOFOLLOW_SYMLINKS -> acc lor 4
      | `ALL_METADATA -> acc lor 8
      | `NO_FALLBACK_FOR_MOVE -> acc lor 16
      | `TARGET_DEFAULT_PERMS -> acc lor 32
      | `TARGET_DEFAULT_MODIFIED_TIME -> acc lor 64)
    0 flags

type filecreateflags_flag = [ `NONE | `PRIVATE | `REPLACE_DESTINATION ]
type filecreateflags = filecreateflags_flag list

let filecreateflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `PRIVATE :: acc else acc in
  let acc = if flags land 2 <> 0 then `REPLACE_DESTINATION :: acc else acc in
  acc

let filecreateflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `PRIVATE -> acc lor 1
      | `REPLACE_DESTINATION -> acc lor 2)
    0 flags

type filemeasureflags_flag =
  [ `NONE | `REPORT_ANY_ERROR | `APPARENT_SIZE | `NO_XDEV ]

type filemeasureflags = filemeasureflags_flag list

let filemeasureflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 2 <> 0 then `REPORT_ANY_ERROR :: acc else acc in
  let acc = if flags land 4 <> 0 then `APPARENT_SIZE :: acc else acc in
  let acc = if flags land 8 <> 0 then `NO_XDEV :: acc else acc in
  acc

let filemeasureflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `REPORT_ANY_ERROR -> acc lor 2
      | `APPARENT_SIZE -> acc lor 4
      | `NO_XDEV -> acc lor 8)
    0 flags

type filemonitorflags_flag =
  [ `NONE | `WATCH_MOUNTS | `SEND_MOVED | `WATCH_HARD_LINKS | `WATCH_MOVES ]

type filemonitorflags = filemonitorflags_flag list

let filemonitorflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `WATCH_MOUNTS :: acc else acc in
  let acc = if flags land 2 <> 0 then `SEND_MOVED :: acc else acc in
  let acc = if flags land 4 <> 0 then `WATCH_HARD_LINKS :: acc else acc in
  let acc = if flags land 8 <> 0 then `WATCH_MOVES :: acc else acc in
  acc

let filemonitorflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `WATCH_MOUNTS -> acc lor 1
      | `SEND_MOVED -> acc lor 2
      | `WATCH_HARD_LINKS -> acc lor 4
      | `WATCH_MOVES -> acc lor 8)
    0 flags

type filequeryinfoflags_flag = [ `NONE | `NOFOLLOW_SYMLINKS ]
type filequeryinfoflags = filequeryinfoflags_flag list

let filequeryinfoflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `NOFOLLOW_SYMLINKS :: acc else acc in
  acc

let filequeryinfoflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `NONE -> acc lor 0 | `NOFOLLOW_SYMLINKS -> acc lor 1)
    0 flags

type iostreamspliceflags_flag =
  [ `NONE | `CLOSE_STREAM1 | `CLOSE_STREAM2 | `WAIT_FOR_BOTH ]

type iostreamspliceflags = iostreamspliceflags_flag list

let iostreamspliceflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `CLOSE_STREAM1 :: acc else acc in
  let acc = if flags land 2 <> 0 then `CLOSE_STREAM2 :: acc else acc in
  let acc = if flags land 4 <> 0 then `WAIT_FOR_BOTH :: acc else acc in
  acc

let iostreamspliceflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `CLOSE_STREAM1 -> acc lor 1
      | `CLOSE_STREAM2 -> acc lor 2
      | `WAIT_FOR_BOTH -> acc lor 4)
    0 flags

type mountmountflags_flag = [ `NONE ]
type mountmountflags = mountmountflags_flag list

let mountmountflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  acc

let mountmountflags_to_int flags =
  List.fold_left (fun acc flag -> match flag with `NONE -> acc lor 0) 0 flags

type mountunmountflags_flag = [ `NONE | `FORCE ]
type mountunmountflags = mountunmountflags_flag list

let mountunmountflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `FORCE :: acc else acc in
  acc

let mountunmountflags_to_int flags =
  List.fold_left
    (fun acc flag -> match flag with `NONE -> acc lor 0 | `FORCE -> acc lor 1)
    0 flags

type outputstreamspliceflags_flag = [ `NONE | `CLOSE_SOURCE | `CLOSE_TARGET ]
type outputstreamspliceflags = outputstreamspliceflags_flag list

let outputstreamspliceflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `CLOSE_SOURCE :: acc else acc in
  let acc = if flags land 2 <> 0 then `CLOSE_TARGET :: acc else acc in
  acc

let outputstreamspliceflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `CLOSE_SOURCE -> acc lor 1
      | `CLOSE_TARGET -> acc lor 2)
    0 flags

type resolvernamelookupflags_flag = [ `DEFAULT | `IPV4_ONLY | `IPV6_ONLY ]
type resolvernamelookupflags = resolvernamelookupflags_flag list

let resolvernamelookupflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `DEFAULT :: acc else acc in
  let acc = if flags land 1 <> 0 then `IPV4_ONLY :: acc else acc in
  let acc = if flags land 2 <> 0 then `IPV6_ONLY :: acc else acc in
  acc

let resolvernamelookupflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `DEFAULT -> acc lor 0
      | `IPV4_ONLY -> acc lor 1
      | `IPV6_ONLY -> acc lor 2)
    0 flags

type resourceflags_flag = [ `NONE | `COMPRESSED ]
type resourceflags = resourceflags_flag list

let resourceflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `COMPRESSED :: acc else acc in
  acc

let resourceflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with `NONE -> acc lor 0 | `COMPRESSED -> acc lor 1)
    0 flags

type resourcelookupflags_flag = [ `NONE ]
type resourcelookupflags = resourcelookupflags_flag list

let resourcelookupflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  acc

let resourcelookupflags_to_int flags =
  List.fold_left (fun acc flag -> match flag with `NONE -> acc lor 0) 0 flags

type settingsbindflags_flag =
  [ `DEFAULT
  | `GET
  | `SET
  | `NO_SENSITIVITY
  | `GET_NO_CHANGES
  | `INVERT_BOOLEAN ]

type settingsbindflags = settingsbindflags_flag list

let settingsbindflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `DEFAULT :: acc else acc in
  let acc = if flags land 1 <> 0 then `GET :: acc else acc in
  let acc = if flags land 2 <> 0 then `SET :: acc else acc in
  let acc = if flags land 4 <> 0 then `NO_SENSITIVITY :: acc else acc in
  let acc = if flags land 8 <> 0 then `GET_NO_CHANGES :: acc else acc in
  let acc = if flags land 16 <> 0 then `INVERT_BOOLEAN :: acc else acc in
  acc

let settingsbindflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `DEFAULT -> acc lor 0
      | `GET -> acc lor 1
      | `SET -> acc lor 2
      | `NO_SENSITIVITY -> acc lor 4
      | `GET_NO_CHANGES -> acc lor 8
      | `INVERT_BOOLEAN -> acc lor 16)
    0 flags

type socketmsgflags_flag = [ `NONE | `OOB | `PEEK | `DONTROUTE ]
type socketmsgflags = socketmsgflags_flag list

let socketmsgflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `OOB :: acc else acc in
  let acc = if flags land 2 <> 0 then `PEEK :: acc else acc in
  let acc = if flags land 4 <> 0 then `DONTROUTE :: acc else acc in
  acc

let socketmsgflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `OOB -> acc lor 1
      | `PEEK -> acc lor 2
      | `DONTROUTE -> acc lor 4)
    0 flags

type subprocessflags_flag =
  [ `NONE
  | `STDIN_PIPE
  | `STDIN_INHERIT
  | `STDOUT_PIPE
  | `STDOUT_SILENCE
  | `STDERR_PIPE
  | `STDERR_SILENCE
  | `STDERR_MERGE
  | `INHERIT_FDS
  | `SEARCH_PATH_FROM_ENVP ]

type subprocessflags = subprocessflags_flag list

let subprocessflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 1 <> 0 then `STDIN_PIPE :: acc else acc in
  let acc = if flags land 2 <> 0 then `STDIN_INHERIT :: acc else acc in
  let acc = if flags land 4 <> 0 then `STDOUT_PIPE :: acc else acc in
  let acc = if flags land 8 <> 0 then `STDOUT_SILENCE :: acc else acc in
  let acc = if flags land 16 <> 0 then `STDERR_PIPE :: acc else acc in
  let acc = if flags land 32 <> 0 then `STDERR_SILENCE :: acc else acc in
  let acc = if flags land 64 <> 0 then `STDERR_MERGE :: acc else acc in
  let acc = if flags land 128 <> 0 then `INHERIT_FDS :: acc else acc in
  let acc =
    if flags land 256 <> 0 then `SEARCH_PATH_FROM_ENVP :: acc else acc
  in
  acc

let subprocessflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `STDIN_PIPE -> acc lor 1
      | `STDIN_INHERIT -> acc lor 2
      | `STDOUT_PIPE -> acc lor 4
      | `STDOUT_SILENCE -> acc lor 8
      | `STDERR_PIPE -> acc lor 16
      | `STDERR_SILENCE -> acc lor 32
      | `STDERR_MERGE -> acc lor 64
      | `INHERIT_FDS -> acc lor 128
      | `SEARCH_PATH_FROM_ENVP -> acc lor 256)
    0 flags

type testdbusflags_flag = [ `NONE ]
type testdbusflags = testdbusflags_flag list

let testdbusflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  acc

let testdbusflags_to_int flags =
  List.fold_left (fun acc flag -> match flag with `NONE -> acc lor 0) 0 flags

type tlscertificateflags_flag =
  [ `NO_FLAGS
  | `UNKNOWN_CA
  | `BAD_IDENTITY
  | `NOT_ACTIVATED
  | `EXPIRED
  | `REVOKED
  | `INSECURE
  | `GENERIC_ERROR
  | `VALIDATE_ALL ]

type tlscertificateflags = tlscertificateflags_flag list

let tlscertificateflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NO_FLAGS :: acc else acc in
  let acc = if flags land 1 <> 0 then `UNKNOWN_CA :: acc else acc in
  let acc = if flags land 2 <> 0 then `BAD_IDENTITY :: acc else acc in
  let acc = if flags land 4 <> 0 then `NOT_ACTIVATED :: acc else acc in
  let acc = if flags land 8 <> 0 then `EXPIRED :: acc else acc in
  let acc = if flags land 16 <> 0 then `REVOKED :: acc else acc in
  let acc = if flags land 32 <> 0 then `INSECURE :: acc else acc in
  let acc = if flags land 64 <> 0 then `GENERIC_ERROR :: acc else acc in
  let acc = if flags land 127 <> 0 then `VALIDATE_ALL :: acc else acc in
  acc

let tlscertificateflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NO_FLAGS -> acc lor 0
      | `UNKNOWN_CA -> acc lor 1
      | `BAD_IDENTITY -> acc lor 2
      | `NOT_ACTIVATED -> acc lor 4
      | `EXPIRED -> acc lor 8
      | `REVOKED -> acc lor 16
      | `INSECURE -> acc lor 32
      | `GENERIC_ERROR -> acc lor 64
      | `VALIDATE_ALL -> acc lor 127)
    0 flags

type tlsdatabaseverifyflags_flag = [ `NONE ]
type tlsdatabaseverifyflags = tlsdatabaseverifyflags_flag list

let tlsdatabaseverifyflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  acc

let tlsdatabaseverifyflags_to_int flags =
  List.fold_left (fun acc flag -> match flag with `NONE -> acc lor 0) 0 flags

type tlspasswordflags_flag =
  [ `NONE
  | `RETRY
  | `MANY_TRIES
  | `FINAL_TRY
  | `PKCS11_USER
  | `PKCS11_SECURITY_OFFICER
  | `PKCS11_CONTEXT_SPECIFIC ]

type tlspasswordflags = tlspasswordflags_flag list

let tlspasswordflags_of_int flags =
  let acc = [] in
  let acc = if flags land 0 <> 0 then `NONE :: acc else acc in
  let acc = if flags land 2 <> 0 then `RETRY :: acc else acc in
  let acc = if flags land 4 <> 0 then `MANY_TRIES :: acc else acc in
  let acc = if flags land 8 <> 0 then `FINAL_TRY :: acc else acc in
  let acc = if flags land 16 <> 0 then `PKCS11_USER :: acc else acc in
  let acc =
    if flags land 32 <> 0 then `PKCS11_SECURITY_OFFICER :: acc else acc
  in
  let acc =
    if flags land 64 <> 0 then `PKCS11_CONTEXT_SPECIFIC :: acc else acc
  in
  acc

let tlspasswordflags_to_int flags =
  List.fold_left
    (fun acc flag ->
      match flag with
      | `NONE -> acc lor 0
      | `RETRY -> acc lor 2
      | `MANY_TRIES -> acc lor 4
      | `FINAL_TRY -> acc lor 8
      | `PKCS11_USER -> acc lor 16
      | `PKCS11_SECURITY_OFFICER -> acc lor 32
      | `PKCS11_CONTEXT_SPECIFIC -> acc lor 64)
    0 flags
