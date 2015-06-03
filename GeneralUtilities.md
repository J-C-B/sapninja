This is a general index of utilities that may be useful for SAP systems.


# Utilities #

  * **Making a system message pop up every time, regardless if read or not**. Report [ZDELETE\_SYSMSG\_HISTORY](http://code.google.com/p/sapninja/source/browse/trunk/tools/programs/zdelete_sysmsg_history.txt) to delete the history of whether users have read an SM02 message.  This means the system message will pop up each time  a user logs on, regardless of whether they have seen it before or not.  Handy for reminding users they are on production, etc.  Schedule this to run every 5 minutes or so.

  * **Function to convert seconds since 1970**.  Some log files, like ALALERTS write a timestamp in seconds since 01-01-1970 (epoch).  In UNIX this is returned by "date +'%s'".  Function [ZCONV\_SECS\_SINCE\_EPOCH\_TO\_TS](http://code.google.com/p/sapninja/source/browse/trunk/tools/functionmodules/zconv_secs_since_epoch_to_ts.txt) will allow you convert such a string into a timestamp.

  * **Binary/Decimal Conversion**.  Here are a couple of function modules that will convert binary to decimal and vice versa. [ZBIN2DEC](http://code.google.com/p/sapninja/source/browse/trunk/tools/functionmodules/zbin2dec.txt) and [ZDEC2BIN](http://code.google.com/p/sapninja/source/browse/trunk/tools/functionmodules/zdec2bin.txt).