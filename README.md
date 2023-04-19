# Fractional PLL

Project title: **2.4 GHz Delta Sigma based Fractional Phase Locked Loop for Wireless Communication Applications**

Project Members:
* Adithi S Upadhya
* Rohan Mallya 
* Jaya Srivastava

### Tools used
- Cadence Virtuoso 
- LTSpice 
  - Technology file for LTSpice: 65nm [https://ptm.asu.edu/](https://ptm.asu.edu/)  
- MATLAB
- Icarus Verilog

### Design targets 

- 65 nm CMOS Technology
- 1.2 V Supply Voltage
- Target Frequency band 2.4 GHz to 2.48 GHz
- Lock Time of 20 μs
- Kvco = 82 MHz/V
- Charge pump current of 100 μA
- Phase margin of 70°
- Reference frequency of ≈20 MHz

Choosing a large loop bandwidth leads to better phase noise since the divided VCO output mimics
the crystal frequency within the loop bandwidth. However, on the contrary it may also allow spurs
to pass through.

Hence, for spur rejection loop bandwidth must be kept as small as possible. Keeping a very small
loop bandwidth makes the PLL slow and increases the lock time. Thus, there is a tradeoff.

Considering the above factors, the following parameters were chosen:
- Loop Bandwidth = Reference Frequency / 100 = 0.2 MHz
- Second-Order Passive filter: C1 = 7.93 pF, C2 = 247 pF, R1 = 19.2 kΩ

### Deliverables 

- MATLAB Simulation: Fractional PLL
- Charge-pump PLL 
  - Second-order type-2
  - Third-order type-2
- LC VCO 
- Digital Delta-Sigma modulator 
  - First-order DDSM 
  - Second-order DDSM 
- Two-stage fully-differential OTA
- OTA based RC Integrator
- Comparator 
- Continuous-time Delta-Sigma modulator
  - First-order CTDSM 
  - Second-order CTDSM 
- Phase-frequency detector 
- Charge pump 
- Fractional frequency divider
- CPPL: using a frequency divider to generate toggling modulus control
- CPPL: with designed charge pump and CTDSM
- CPPL: with designed charge pump and DDSM

**Future work**: CPPL: with CTDSM and feedforward correction, architectures for low-power charge pump and spur-reduction techniques

### Virtuoso Cadence: Usage instructions

- `ssh -Y username@ip`
- cd into work dir
- `source cadence.cshrc`
- `virtuoso &`

Library ~ folder, cellview ~ file

- File -> New -> Library -> attach an existing technology library -> name your library, attach usmc65 -> OK
- Create new cell view 

#### Shortcuts: 

I: add new instance <br>
- select usmc65nm 
- select cell -> component 
- NMOS: N_12_LLLVT (low leakage low threshold)
- PMOS: P_12_LLLVT 

W: Wire (else, just drag from nodes)

Q: Properties 

U: Undo 

C: Copy (drag and select for more than one component)

P: Create pin (choose direction, input/output etc.)

L: Label 

#### General component info: 

- Sizing of transistor (Q - shortcut): Total width = #fingers x finger width 
- Safe length: 5*Lmin 
- For vdc, idc, gnd: use analogLib 

#### Simulations:

- Check and save schematic
- Launch -> ADEL - sim window opens up
- Analyses: tran/dc/ac etc.
- Output -> Setup (can also set transfer function - using Calculator)
- Tools -> parameter analysis (for dc sweep), can also enable the option to display DC operating point
- To display more DC operating points than default, ex: 1/gds -> Left click on schematic and modify settings 

Open image via terminal: `gio open image.png`

#### Sharing files from/to VM and host OS: 
- Enable shared folder - VM settings, add the required folder
- On ubuntu: my computer - mnt - hgfs - filename

### References 
[1] Dean Banerjee and Paul Boyer. “Delta Sigma PLLs Raise The Standard For Performance”. In: National
Semiconductor Application Brief 125 (2003).

[2] T Chembiyan, Preetham N Reddy, and G Raghurama. “A Very Low Reference Spur Phase Offset
Technique in Fractional-N Charge pump PLLs”. In: ().

[3] Ian Collins. “Phase-Locked Loop (PLL) Fundamentals”. In: SSB 130.140 (2018), p. 150.

[4] Ian Galton. Delta-sigma fractional-N phase-locked loops. 2003.

[5] Richard Gu and Sridhar Ramaswamy. “Fractional-N phase locked loop design and applications”. In:
2007 7th International Conference on ASIC. IEEE. 2007, pp. 327–332.

[6] Texas Instruments and Curtis Barrett. “Fractional/integer-N PLL basics”. In: SWRA029, edited by Curtis
Barrett, wireless communication business unit (1999).

[7] Sudhakar Pamarti, Lars Jansson, and Ian Galton. “A wideband 2.4-GHz delta-sigma fractional-NPLL
with 1-Mb/s in-loop modulation”. In: IEEE Journal of Solid-State Circuits 39.1 (2004), pp. 49–62.

[8] Shanthi Pavan, Richard Schreier, and Gabor C Temes. Understanding delta-sigma data converters. John
Wiley & Sons, 2017.

[9] Behzad Razavi. Design of CMOS phase-locked loops: From circuit level to architecture level. Cambridge
University Press, 2020.

[10] Behzad Razavi. “Design of millimeter-wave CMOS radios: A tutorial”. In: IEEE Transactions on Circuits
and Systems I: Regular Papers 56.1 (2009), pp. 4–16.

[11] Behzad Razavi. “The delta-sigma modulator [a circuit for all seasons]”. In: IEEE Solid-State Circuits
Magazine 8.2 (2016), pp. 10–15.

[12] Behzad Razavi. “The StrongARM latch [a circuit for all seasons]”. In: IEEE Solid-State Circuits Magazine
7.2 (2015), pp. 12–17.

[13] Behzad Razavi and Razavi Behzad. RF microelectronics. Vol. 2. Prentice hall New York, 2012.
60

### Links 

* [RF Integrated Circuits- Prof. Shouribrata Chatterjee, IIT Delhi](https://www.youtube.com/playlist?list=PLbMVogVj5nJQdGDSx243YPnNeLMBrhNE8)
* [PLL - Prof. Saurabh Saxena, IIT Madras](https://archive.nptel.ac.in/courses/108/106/108106184/)
* [RF Integrated Circuits - Prof. Sankaran Aniruddhan, IIT Madras](https://www.ee.iitm.ac.in/vlsi/courses/ee6320_2022/start)
* [Delta-Sigma Fractional-N PLL, Sudhakar Pamarti](https://www.youtube.com/watch?v=7Di2jv_rlko)
* [Model files - from IIT Madras lectures](https://www.ee.iitm.ac.in/~nagendra/cadinfo.html)
* [Oscillator general topology, large signal Gm, amplitude and frequency calculation](https://www.youtube.com/watch?v=L7uazLiHC7o)
* [gm-Id design methodology](https://youtu.be/dzz4z3ijVts)
* [2 stage Miller opamp](https://youtu.be/PT31xAEd_v4)
* [Stability of CMFB](https://www.youtube.com/watch?v=Zvv2TBVyuOI) 

