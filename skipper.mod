/** -*- C -*- **/

#define	Iphi_slew_fast	100    /*100*/
#define Iphi_slew_slow	 10 /*10*/
#define Rphi_slew_fast	500 /* 500 was too fast */
#define Rphi_slew_slow	 29.508 /*33*/

#define TG_slew_fast	500
#define TG_slew_slow	10

#define BIAS_slew_fast 100
#define BIAS_slew_slow 50

#define DG_slew_fast 100
#define DG_slew_slow 50

#define OutputDrain     30.5

#define OutputGate      2.5

#define ResetDrain      18

#define ResetGateHi      8
#define SummingWellHi    5

/* wdl can compile xvbias card */
SLOT 1 xvbias {
  PBIAS 1 [0,0];
  PBIAS 2 [0,0];
  PBIAS 3 [0,0];
  PBIAS 4 [0,0];
  NBIAS 1 [0,-20]; // These are Vdd (output drain)
  NBIAS 2 [0,-20]; // for all four amplifiers
  NBIAS 3 [0,-20];
  NBIAS 4 [0,-20];
}

SLOT 2 xvbias {
  PBIAS 1 [0,70];  // Vsubstrate voltage - nominal
  PBIAS 2 [0,0];
  PBIAS 3 [0,0];
  PBIAS 4 [0,0];
  NBIAS 1 [0,-24]; // Dump drive voltage
  NBIAS 2 [0,-24];
  NBIAS 3 [0,-24];
  NBIAS 4 [0,-24];
}

SLOT 3 driver {
  DRV 1 [Rphi_slew_fast,Rphi_slew_slow,1];  // Reset gate
  DRV 2 [Rphi_slew_fast,Rphi_slew_slow,1];  // Reset gate
  DRV 3 [Rphi_slew_fast,Rphi_slew_slow,1];  // Reset gate
  DRV 4 [Rphi_slew_fast,Rphi_slew_slow,1];  // Reset gate
  DRV 5 [Rphi_slew_fast,Rphi_slew_slow,1];  // Spare
  DRV 6 [Rphi_slew_fast,Rphi_slew_slow,1];  // Spare
  DRV 7 [BIAS_slew_fast,BIAS_slew_slow,1];  // Spare
  DRV 8 [BIAS_slew_fast,BIAS_slew_slow,1];  // Spare
}

SLOT 4 driver {
  DRV 1 [Rphi_slew_fast,Rphi_slew_slow,1];  // Parallel clock
  DRV 2 [Rphi_slew_fast,Rphi_slew_slow,1];  // Parallel clock
  DRV 3 [Rphi_slew_fast,Rphi_slew_slow,1];  // Serial clock
  DRV 4 [Rphi_slew_fast,Rphi_slew_slow,1];  // Serial clock
  DRV 5 [Rphi_slew_fast,Rphi_slew_slow,1];  // Serial clock
  DRV 6 [Rphi_slew_fast,Rphi_slew_slow,1];  // Serial clock
  DRV 7 [BIAS_slew_fast,BIAS_slew_slow,1];  // Serial clock
  DRV 8 [BIAS_slew_fast,BIAS_slew_slow,1];  // Spare
}

SLOT 5 ad {
  CLAMP 1 = 1.5;
  CLAMP 2 = 1.5;
  CLAMP 3 = 1.5;
  CLAMP 4 = 1.5;
  PREAMPGAIN = low;
}

/* This is a lvxbias card since it can go negative */
/* Need to figure out how to know the cards wdl can compile */
SLOT 9 lvbias {
  LVLC 1  [1,0]; /* Reset Drain a          */
  LVLC 2  [1,0]; /* Reset Drain b          */
  LVLC 3  [1,0]; /* Reset Drain c          */
  LVLC 4  [1,0]; /* Reset Drain d          */
  LVLC 5  [0,0];  /* Spare                  */
  LVLC 6  [0,0];  /* Spare                  */
  LVLC 7  [0,0];  /* Spare                  */
  LVLC 8  [0,0];  /* Spare                  */
  LVLC 9  [0,0];  /* Spare                  */
  LVLC 10 [0,0];  /* Spare                  */
  LVLC 11 [0,0];    /* Reset Gate High Rail   */
  LVLC 12 [0,0];  /* Summing Well High Rail */
  LVLC 13 [0,0];  /* Spare                  */
  LVLC 14 [0,0];  /* Spare                  */
  LVLC 15 [0,0];  /* Spare                  */
  LVLC 16 [0,0];  /* Spare                  */
  LVLC 17 [0,0];  /* Spare                  */
  LVLC 18 [0,0];  /* Spare                  */
  LVLC 19 [0,0];  /* Spare                  */
  LVLC 20 [0,0];  /* Spare                  */
  LVLC 21 [0,0];  /* Spare                  */
  LVLC 22 [0,0];  /* Spare                  */
  LVLC 23 [0,0];  /* Spare                  */
  LVLC 24 [0,0];  /* Dump Drain All Quads   */
  LVHC  1 [0,10,0,1];   /* Spare                         */
  LVHC  2 [0,10,0,1];   /* Spare                         */
  LVHC  3 [14,100,0,1]; /* Output Drain Top Left     (a) */
  LVHC  4 [14,100,0,1]; /* Output Drain Top Right    (b) */
  LVHC  5 [14,100,0,1]; /* Output Drain Bottom Right (c) */
  LVHC  6 [14,100,0,1]; /* Output Drain Bottom Left  (d) */
}

SLOT 10 driver {
  DRV 1 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 2 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 3 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 4 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 5 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 6 [Iphi_slew_fast,Iphi_slew_slow,1];
  DRV 7 [TG_slew_fast,TG_slew_slow,1];
  DRV 8 [TG_slew_fast,TG_slew_slow,1];
}

SLOT 11 driver {
  DRV 1 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 2 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 3 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 4 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 5 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 6 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 7 [DG_slew_fast,DG_slew_slow,1];
  DRV 8 [BIAS_slew_fast,BIAS_slew_slow,1];
}

SLOT 12 driver {
  DRV 1 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 2 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 3 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 4 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 5 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 6 [Rphi_slew_fast,Rphi_slew_slow,1];
  DRV 7 [DG_slew_fast,DG_slew_slow,1];
  DRV 8 [BIAS_slew_fast,BIAS_slew_slow,1];
}
