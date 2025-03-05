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
  PV 1 [0];
  PV 2 [0];
  PV 3 [0];
  PV 4 [0];
  PN 1 [-20]; // These are Vdd (output drain)
  PN 2 [-20]; // for all four amplifiers
  PN 3 [-20];
  PN 4 [-20];
}

SLOT 2 xvbias {
  PV 1 [70];  // Vsubstrate voltage - nominal
  PV 2 [0];
  PV 3 [0];
  PV 4 [0];
  PN 1 [-24]; // Dump drive voltage
  PN 2 [-24];
  PN 3 [-24];
  PN 4 [-24];
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
  HVLC 1  [15,0]; /* Reset Drain a          */
  HVLC 2  [15,0]; /* Reset Drain b          */
  HVLC 3  [15,0]; /* Reset Drain c          */
  HVLC 4  [15,0]; /* Reset Drain d          */
  HVLC 5  [0,0];  /* Spare                  */
  HVLC 6  [0,0];  /* Spare                  */
  HVLC 7  [0,0];  /* Spare                  */
  HVLC 8  [0,0];  /* Spare                  */
  HVLC 9  [0,0];  /* Spare                  */
  HVLC 10 [0,0];  /* Spare                  */
  HVLC 11 [ResetGateHi,0];    /* Reset Gate High Rail   */
  HVLC 12 [SummingWellHi,0];  /* Summing Well High Rail */
  HVLC 13 [0,0];  /* Spare                  */
  HVLC 14 [0,0];  /* Spare                  */
  HVLC 15 [0,0];  /* Spare                  */
  HVLC 16 [0,0];  /* Spare                  */
  HVLC 17 [0,0];  /* Spare                  */
  HVLC 18 [0,0];  /* Spare                  */
  HVLC 19 [0,0];  /* Spare                  */
  HVLC 20 [0,0];  /* Spare                  */
  HVLC 21 [0,0];  /* Spare                  */
  HVLC 22 [0,0];  /* Spare                  */
  HVLC 23 [0,0];  /* Spare                  */
  HVLC 24 [0,0];  /* Dump Drain All Quads   */
  HVHC  1 [0,10,0,1];   /* Spare                         */
  HVHC  2 [0,10,0,1];   /* Spare                         */
  HVHC  3 [24,100,0,1]; /* Output Drain Top Left     (a) */
  HVHC  4 [24,100,0,1]; /* Output Drain Top Right    (b) */
  HVHC  5 [24,100,0,1]; /* Output Drain Bottom Right (c) */
  HVHC  6 [24,100,0,1]; /* Output Drain Bottom Left  (d) */
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
