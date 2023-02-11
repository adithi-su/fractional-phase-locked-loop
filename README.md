# Fractional Phase locked loop 

Project title: 2.4 GHz Delta Sigma based Fractional Phase Locked Loop for Wireless Communication Applications

Project Members:
* Adithi S Upadhya 
* Rohan Mallya 
* Jaya Srivastava

Technology file for LTSpice: 65nm [https://ptm.asu.edu/](https://ptm.asu.edu/)  

### Virtuoso Cadence:

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

#### Links 

* [RF Integrated Circuits- Prof. Shouribrata Chatterjee, IIT Delhi](https://www.youtube.com/playlist?list=PLbMVogVj5nJQdGDSx243YPnNeLMBrhNE8)
* [PLL - Prof. Saurabh Saxena, IIT Madras](https://archive.nptel.ac.in/courses/108/106/108106184/)
* [RF Integrated Circuits - Prof. Sankaran Aniruddhan, IIT Madras](https://www.ee.iitm.ac.in/vlsi/courses/ee6320_2022/start)
* [Delta-Sigma Fractional-N PLL, Sudhakar Pamarti](https://www.youtube.com/watch?v=7Di2jv_rlko)
* [Model files - from IIT Madras lectures](https://www.ee.iitm.ac.in/~nagendra/cadinfo.html)
* [Oscillator general topology, large signal Gm, amplitude and frequency calculation](https://www.youtube.com/watch?v=L7uazLiHC7o)

#### Revise

* Opamp basics
* Analog electronics- feedback mechanism (Sedra and Smith)
* Control Systems - oscillations part 
* MOSFET basics
