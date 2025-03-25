modulefile skipper.mod
signalfile skipper.signals

sequence Start:
CALL wCloseShutter
CALL SerialReceiving
CALL ParallelTransfer
CALL wReset
GOTO WaitForExpose

sequence WaitForExpose:
Abort--
if Expose CALL DoExpose
CALL Idling
GOTO WaitForExpose

sequence Idling:
CALL ParallelTransfer
CALL SerialReceiving
CALL wReset
RETURN Idling

sequence DoExpose:
Expose--
CALL SetParallelExpose
if ShutterEnable CALL OpenShutter
if exptime CALL MilliSec(exptime)
CALL wCloseShutter
RETURN DoExpose

sequence OpenShutter:
if exptime CALL wOpenShutter
RETURN OpenShutter

sequence MilliSec:
if Abort GOTO DoAbort
RETURN MilliSec

sequence DoAbort:
Abort--
GOTO WaitForExpose

waveform SerialReceiving:
0 4 12 -2.0
0 4 13 1
0 4 4 -2.0
0 4 5 1
0 4 6 -2.0
0 4 7 1
0 4 8 -4.5
0 4 9 1
0 4 10 -4.5
0 4 11 1
20 3 0 1.0
20 3 1 1.0
20 3 2 1.0
20 3 3 1.0
21 RETURN SerialReceiving

waveform SynchedParallelTransfer:
0 12 0 -0.5
0 12 1 1
0 12 2 -0.5
0 12 3 1
0 12 4 -0.5
0 12 5 1
0 12 6 -0.5
0 12 7 1
0 12 8 -0.5
0 12 9 1
0 12 10 -0.5
0 12 11 1
0 12 12 -0.5
0 12 13 1
0 12 14 -0.5
0 12 15 1
5000 12 8 -2.5
5000 12 9 1
5000 12 10 -2.5
5000 12 11 1
5000 12 12 -2.5
5000 12 13 1
5000 12 14 -2.5
5000 12 15 1
10000 4 0 -0.5
10000 4 1 1
10000 4 2 -0.5
10000 4 3 1
15000 12 0 -2.5
15000 12 1 1
15000 12 2 -2.5
15000 12 3 1
15000 12 4 -2.5
15000 12 5 1
15000 12 6 -2.5
15000 12 7 1
20000 12 8 -0.5
20000 12 9 1
20000 12 10 -0.5
20000 12 11 1
20000 12 12 -0.5
20000 12 13 1
20000 12 14 -0.5
20000 12 15 1
20001 RETURN SynchedParallelTransfer

waveform SerialShift:
0 4 4 -4.5
0 4 5 1
0 4 6 -4.5
0 4 7 1
200 4 8 -2.0
200 4 9 1
200 4 10 -2.0
200 4 11 1
400 4 12 -4.5
400 4 13 1
600 4 4 -2.0
600 4 5 1
600 4 6 -2.0
600 4 7 1
800 4 8 -4.5
800 4 9 1
800 4 10 -4.5
800 4 11 1
1000 4 12 -2.0
1000 4 13 1
1001 RETURN SerialShift

waveform wOpenShutter:
0 0 0 1.0
1 RETURN wOpenShutter

waveform wCloseShutter:
0 0 0 0.0
1 RETURN wCloseShutter

waveform wFrame:
0 0 1 1.0
1 RETURN wFrame

waveform wLine:
0 0 2 1.0
1 RETURN wLine

waveform wLine_triggered:
0 0 0 1.0
2000 0 0 0.0
2000 0 2 1.0
2001 RETURN wLine_triggered

waveform wIdle:
1 RETURN wIdle

waveform SetParallelExpose:
0 12 0 -2.5
0 12 1 1
0 12 2 -2.5
0 12 3 1
0 12 4 -2.5
0 12 5 1
0 12 6 -2.5
0 12 7 1
0 4 0 -2.5
0 4 1 1
0 4 2 -2.5
0 4 3 1
0 12 8 -0.5
0 12 9 1
0 12 10 -0.5
0 12 11 1
0 12 12 -0.5
0 12 13 1
0 12 14 -0.5
0 12 15 1
1 RETURN SetParallelExpose

waveform SerialReceiving:
0 4 4 -2.0
0 4 5 1
0 4 6 -2.0
0 4 7 1
0 4 8 -2.0
0 4 9 1
0 4 10 -2.0
0 4 11 1
0 4 12 -4.5
0 4 13 1
0 10 8 -1.0
0 10 9 1
0 10 10 -1.0
0 10 11 1
0 10 12 -1.0
0 10 13 1
0 10 14 -1.0
0 10 15 1
0 3 0 7.0
0 3 1 1
0 3 2 7.0
0 3 3 1
0 3 4 7.0
0 3 5 1
0 3 6 7.0
0 3 7 1
1 RETURN SerialReceiving

waveform SerialTransfer:
0 4 8 -4.5
0 4 9 1
0 4 6 -4.5
0 4 7 1
0 10 8 -10.0
0 10 9 1
0 10 10 -10.0
0 10 11 1
0 10 12 -10.0
0 10 13 1
0 10 14 -10.0
0 10 15 1
5000 4 12 -2.0
5000 4 13 1
10000 4 10 -4.5
10000 4 11 1
10000 4 4 -4.5
10000 4 5 1
15000 4 8 -2.0
15000 4 9 1
15000 4 6 -2.0
15000 4 7 1
20000 4 12 -4.5
20000 4 13 1
25000 4 10 -2.0
25000 4 11 1
25000 4 4 -2.0
25000 4 5 1
25001 RETURN SerialTransfer

waveform wReset:
0 3 0 -4.0
0 3 1 1
0 3 2 -4.0
0 3 3 1
0 3 4 -4.0
0 3 5 1
0 3 6 -4.0
0 3 7 1
5000 3 0 7.0
5000 3 1 1
5000 3 2 7.0
5000 3 3 1
5000 3 4 7.0
5000 3 5 1
5000 3 6 7.0
5000 3 7 1
5001 RETURN wReset

waveform SkipperSamples:
5000 5 0 1.0
5500 5 0 0.0
5500 11 0 -3.0
5500 11 1 1
5500 11 2 -3.0
5500 11 3 1
5500 11 4 -3.0
5500 11 5 1
5500 11 6 -3.0
5500 11 7 1
10500 11 0 -10.0
10500 11 1 1
10500 11 2 -10.0
10500 11 3 1
10500 11 4 -10.0
10500 11 5 1
10500 11 6 -10.0
10500 11 7 1
10500 5 0 1.0
10500 5 1 1
11000 5 0 0.0
11000 5 1 1
11000 10 0 -8.0
11000 10 1 1
11000 10 2 -8.0
11000 10 3 1
11000 10 4 -8.0
11000 10 5 1
11000 10 6 -8.0
11000 10 7 1
16000 10 0 -4.0
16000 10 1 1
16000 10 2 -4.0
16000 10 3 1
16000 10 4 -4.0
16000 10 5 1
16000 10 6 -4.0
16000 10 7 1
16001 RETURN SkipperSamples

waveform ParallelTransfer:
0 12 0 -0.5
0 12 1 1
0 12 2 -0.5
0 12 3 1
0 12 4 -0.5
0 12 5 1
0 12 6 -0.5
0 12 7 1
0 12 8 -0.5
0 12 9 1
0 12 10 -0.5
0 12 11 1
0 12 12 -0.5
0 12 13 1
0 12 14 -0.5
0 12 15 1
0 4 0 -2.5
0 4 1 1
0 4 2 -2.5
0 4 3 1
5000 12 8 -2.5
5000 12 9 1
5000 12 10 -2.5
5000 12 11 1
5000 12 12 -2.5
5000 12 13 1
5000 12 14 -2.5
5000 12 15 1
10000 4 0 -0.5
10000 4 1 1
10000 4 2 -0.5
10000 4 3 1
15000 12 0 -2.5
15000 12 1 1
15000 12 2 -2.5
15000 12 3 1
15000 12 4 -2.5
15000 12 5 1
15000 12 6 -2.5
15000 12 7 1
20000 12 8 -0.5
20000 12 9 1
20000 12 10 -0.5
20000 12 11 1
20000 12 12 -0.5
20000 12 13 1
20000 12 14 -0.5
20000 12 15 1
25000 4 0 -2.5
25000 4 1 1
25000 4 2 -2.5
25000 4 3 1
25000 11 8 -1.0
25000 11 9 1
25000 11 10 -1.0
25000 11 11 1
25000 11 12 -1.0
25000 11 13 1
25000 11 14 -1.0
25000 11 15 1
30000 11 8 -3.5
30000 11 9 1
30000 11 10 -3.5
30000 11 11 1
30000 11 12 -3.5
30000 11 13 1
30000 11 14 -3.5
30000 11 15 1
30001 RETURN ParallelTransfer

parameter exptime=0
parameter Expose=0
parameter Abort=0
parameter ShutterEnable=1
parameter shutdelay=470
parameter SerialPrescan=4
parameter SerialOverscan=30
parameter ParallelOverscan=50
parameter ImageCols=2040
parameter ImageRows=2040
parameter SplitLines=2090
parameter Lines=2090
parameter Pixels=2074
parameter PxByFour=518
parameter IdleLines=2040

